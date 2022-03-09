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