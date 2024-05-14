# Import the Pkg module
using Pkg

# Define the function to instantiate project dependencies
function instantiate_project(project_path)
    # Activate the project environment
    Pkg.activate(project_path)
    
    # Instantiate project dependencies
    Pkg.instantiate()
end

# Define the function to recursively find all Project.toml files
function find_projects(root_dir)
    projects = String[]
    for (root, dirs, files) in walkdir(root_dir)
        for file in files
            if file == "Project.toml"
                push!(projects, root)
            end
        end
    end
    return projects
end

# Main function to instantiate projects
function main()
    # Define the root directory
    root_dir = "docs"
    
    # Find all Project.toml files in the subdirectories
    projects = find_projects(root_dir)
    
    # Instantiate project dependencies for each project
    for project in projects
        instantiate_project(project)
        println("Project dependencies have been successfully instantiated for $project.")
    end
end

main()
