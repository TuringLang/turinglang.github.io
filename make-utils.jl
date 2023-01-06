using Base64
using LibGit2
using Pkg

## Text Utilities

function find_yaml_header(lines)
    yaml = []
    yaml_start, yaml_stop = 1, length(lines)

    # read out YAML block.
    if strip(lines[1]) == "---"
        for i = 2:length(lines)
            if strip(lines[i]) == "---"
                yaml = lines[1:i]
                yaml_stop = i
                break
            end
        end
    end
    return yaml, yaml_start, yaml_stop
end

function remove_yaml(file, key=nothing)
    lines = readlines(file, keep=true)
    yaml, yaml_start, yaml_stop = find_yaml_header(lines)
    if !isempty(yaml)
        open(file, "w+") do f
            # write back YAML lines.
            if key !== nothing
                for line in yaml
                    startswith(line, key * ":") || write(f, line)
                end
            end
            # write back non-YAML lines
            for line in lines[yaml_stop + 1 : end]
                write(f, line)
            end
        end
    end

    return yaml
end

function tidy_api(file)
    lines = readlines(file, keep=true)

    # Find the ID sections.
    for i = 1:(length(lines)-1)
	first = lines[i]
	second = lines[i+1]
        if startswith(first, "<a id=") && startswith(second, "**")
            first = replace(first, "\n" => "")
	    second = replace(second, "\n" => "")
	    # final_line = replace(first, ">" => ">$second", count = 1)

	    lines[i] = "### $first $second"
	    lines[i+1] = ""
        end
    end

    # Write lines back.
    open(file, "w+") do f
        for line in lines
            write(f, line)
        end
    end
end

## Utilities for Tutorial docs preprocess

"""
            fix_header_1

        This function is used to add a first-level header into the
        markdown file.

        There are no H1 titles for documents in tutorials, so we need
        this.
        """
function fix_header_1(file)
    lines = readlines(file, keep=true)
    yaml, yaml_start, yaml_stop = find_yaml_header(lines)
    isempty(yaml) && return

    for line in lines[yaml_stop + 1 : end]
        strip(line) == "" && continue
        if startswith(line, "# ") # has a h1 title
            return
        else # no h1 title
            break
        end
    end

    title = "Untitled"
    for line in yaml
        if startswith(line, "title:")
            title = line[7:end] |> strip
            break
        end
    end
    title = strip(title, ['"'])

    open(file, "w+") do f
        for line in yaml
            write(f, line)
        end
        write(f, "\n# $title\n")
        # write back non-YAML lines
        for line in lines[yaml_stop + 1 : end]
            write(f, line)
        end
    end
end

function fix_image_path(file)
    # ![](/tutorials/figures/image.png)
    # to
    # ![](../figures/image.png)
    lines = readlines(file, keep=true)
    open(file, "w+") do f
        for line in lines
            line = replace(line, "](figures/" => "]({{site.baseurl}}/tutorials/figures/")
            write(f, line)
        end
    end
end

## Building Utilities

function preprocess_markdown(folder)
    @debug "preprocess_markdown" folder
    yaml_dict = Dict()

    try
        for (root, dirs, files) in walkdir(folder)
            for file in files
		if endswith(file, ".md")
	            full_path = joinpath(root, file)
	            yaml_dict[full_path] = remove_yaml(full_path)
		end
            end
        end
    catch e
        # println("Markdown copy error: $e")
        rethrow(e)
    end

    return yaml_dict
end

function postprocess_markdown(folder, yaml_dict; original = "")
    try
        for (root, dirs, files) in walkdir(folder)
            for file in files
                full_path = joinpath(root, file)
                original_path = full_path

                if length(original) > 0
                    # original_path = abspath(original, file)
                    original_path = replace(full_path, folder => original)
                    # original_path = replace(
                    #     full_path,
                    #     joinpath("docs", "site") => joinpath("docs", "src")
                    # )
                end

                if haskey(yaml_dict, original_path)
                    # println("Original: $original_path => Full path: $full_path")

                    txt = open(f -> read(f, String), full_path)
                    open(full_path, "w+") do f
                        # Add in the yaml block.
                        for line in yaml_dict[original_path]
                            write(f, line)
                        end

                        # This is needed to replace the hyperlinks Documenter.jl generates
                        # for the API pages.
			txt = replace(txt, "api.md" => "{{site.baseurl}}/docs/library/")
			txt = replace(txt, "bijectors.md" => "{{site.baseurl}}/docs/library/bijectors/")
			txt = replace(txt, "advancedhmc.md" => "{{site.baseurl}}/docs/library/advancedhmc/")

                        # Add the rest of the text.
			if original_path == full_path
			    write(f, txt)
			else
                # If function `fix_image_path` rums first, this line will probably never run. 
			    write(f, replace(txt, "![](figures" => "![]({{site.baseurl}}/tutorials/figures"))
			end
                    end
                elseif endswith(file, ".md")
                    println("Original: $original_path")
                    println("Full:     $full_path \n")
                end

		# Make specific api items headers.
		if file == "api.md" && original_path != full_path
		    tidy_api(full_path)
		end
            end
        end
    catch e
        # println("Markdown copy error: $e")
        rethrow(e)
    end

    return yaml_dict
end

function cp_by_write(src, dest; force::Bool=false)

    if isdir(src)
        for (root, dirs, files) in walkdir(src)
            new_root = replace(root, src => dest)
            mkpath(new_root)

            for file in files
                src_file = joinpath(root, file)
                dest_file = joinpath(new_root, file)

                if !ispath(dest_file) || force
                    @debug "Making $dest_file from $src_file"
                    open(src_file, "r") do f_in
                        open(dest_file, "w+") do f_out
                            write(f_out, read(f_in))
                        end
                    end
                end
            end
        end
    else
        # Assume it's a file
        if !ispath(dest) || force
            @debug "Making $dest from $src"
            open(src, "r") do f_in
                open(dest, "w+") do f_out
                    write(f_out, read(f_in))
                end
            end
        end
    end

    return dest
end

function with_clean_docs(func, source, target)
    src_temp = mktempdir()
    cp_by_write(source, src_temp, force=true)
    yaml_dict = preprocess_markdown(src_temp)

    try
        func(src_temp, target)
        yaml_dict = postprocess_markdown(target, yaml_dict, original=src_temp)
    catch e
        rethrow(e)
    finally
        # Put back the original files in the event of an error.
        # cp(src_temp, source_path, force=true)
        rm(src_temp, recursive=true)
    end
    return yaml_dict
end


function copy_tutorial(tutorial_dest_path)
    @debug "destination of tutorials" tutorial_dest_path
    mkpath(tutorial_dest_path)

    # Use temporary workspace directory.
    mktempdir() do workspace
        # Use temporary directory for prebuilt output of tutorials.
        mktempdir() do tutorialsoutput
            # Fetch tutorials.
            clone("https://github.com/TuringLang/TuringTutorialsOutput", tutorialsoutput)

            # Copy the .md versions of all tutorials.
            md_path = joinpath(tutorialsoutput, "markdown")
            @debug "folder with Markdown version of tutorials" md_path
            for tutorial_src in readdir(md_path)
                # Construct the full path
                tutorial_src_path = joinpath(md_path, tutorial_src)
                for (dir, subdirs, files) in walkdir(tutorial_src_path)
                    # Change base directory of source path
                    dir_new = replace(dir, tutorial_src_path => workspace)
                    # Make the path if it does not exist
                    mkpath(dir_new)
                    # Copy over the files ensuring that we have write access
                    println("Copying $dir to $dir_new")
                    cp_by_write(dir, dir_new, force=true)

                    for file in files
                        dest_path = joinpath(dir_new, file)

                        if endswith(dest_path, ".md")
                            # remove_yaml(target_path, "permalink")
                            fix_header_1(dest_path)
                            print("fixing image path")
                            fix_image_path(dest_path)
                        end
                    end
                end
            end

            # Copy from temporary workspace to destination
            cp(workspace, tutorial_dest_path, force=true)
            index = joinpath(@__DIR__, "_tutorials/index.md")
            cp(index, tutorial_dest_path * "/index.md", force=true)
        end
    end

    return nothing
end

function with_baseurl(func, baseurl, config_path)
    jekyll_config = config_path
    lines = readlines(jekyll_config, keep=true)
    open(jekyll_config, "w+") do f
        for line in lines
            if startswith(line, "baseurl:")
                write(f, "baseurl: \"$(baseurl)\"\n")
                continue
            end
            write(f, line)
        end
    end
    ret = func()
    open(jekyll_config, "w+") do f
        for line in lines
            write(f, line)
        end
    end
    return ret
end
