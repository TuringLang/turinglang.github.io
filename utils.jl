function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

# TuringLang customisation

function hfun_teammember(vname)
  photourl, name, institution = vname[1:3]
  links = []
  if length(vname) > 3
    for i in 4:2:length(vname)
      push!(links, "<a href=\"$(vname[i+1])\">$(vname[i])</a>")
    end
  end
  links_str = join(links, " | ")
  return """
  <div class="row team-member">
    <img class="left" src="$photourl">
    <p class="team-member-name">$name</p>
    <hr>
    <p>$institution</p>
    <p>$links_str</p>
    <div style="clear: both"></div>
  </div>
  """
end

function _nice_title(title)
  words = split(title, '-')
  Words = uppercasefirst.(words)
  return join(Words, ' ')
end

# Ref: https://franklinjl.org/syntax/utils/#without_parameters
function hfun_navbar(vname)
  directory = vname[1]
  current = length(vname) > 1 ? vname[2] : nothing
  if directory[end] != '/'
    directory *= '/'
  end
  list = readdir(directory)
  filter!(fn -> endswith(fn, ".md"), list)
  L = length(list)
  io = IOBuffer()
  write(io, """<ul class="pb-2">\n""")
  for (i, fn) in enumerate(list)
    pn = splitext(fn)[1]
    isindex = (pn == "index")
    iscurrent = (pn == current)
    if isindex
      pn = split(directory, '/')[end-1]
    end
    wp = isindex ? "/" * directory : "/" * directory * pn * "/"
    padding = i == 1 ? "pr-0" : 
              i == L ? "pl-0" : "px-0"
    text = iscurrent ? "<u>$(_nice_title(pn))</u>" : _nice_title(pn)
    suffix = i < L ? " &#62;" : ""
    write(io, """<li class="inline-block $padding"><a href="$wp">$text</a>$suffix</li>\n""")
  end
  write(io, "</ul>")
  return String(take!(io))
end