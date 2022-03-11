module TuringWeb

import Documenter.Writers.HTMLWriter: render_page, render_search
using Documenter.Utilities.DOM: @tags, Node, Attributes
using Documenter.Writers.HTMLWriter: getpage, get_url, relhref, 
    render_head, render_sidebar, render_navbar, render_article, render_footer, render_html, open_output

function updatehead!(node)
    # Add the Tailwind CSS
    tailwindjs = Node(:script, [:src => "https://cdn.tailwindcss.com"], Node[])
    push!(node.nodes, tailwindjs)
    css_str = read(joinpath(@__DIR__, "../_css/documenter.css"), String)
    # Add top navbar adjustment
    navbarcss = Node(Symbol("#RAW#"), Attributes(), [Node("<style>$css_str</style>")])
    push!(node.nodes, navbarcss)
end

"Add the header navbar to first thing in body"
function addnavbar!(node)
    header_str = read(joinpath(@__DIR__, "../_layout/header.html"), String)
    header = Node(Symbol("#RAW#"), Attributes(), [Node(header_str)])
    insert!(node.nodes, 2, header) # head is at index 1 so we insert at index 2
end

function render_page(ctx, navnode)
    @tags html div body
    page = getpage(ctx, navnode)
    head = render_head(ctx, navnode)

    updatehead!(head)
    
    sidebar = render_sidebar(ctx, navnode)
    navbar = render_navbar(ctx, navnode, true)
    article = render_article(ctx, navnode)
    footer = render_footer(ctx, navnode)
    htmldoc = render_html(ctx, navnode, head, sidebar, navbar, article, footer)

    addnavbar!(htmldoc.root)

    open_output(ctx, navnode) do io
        print(io, htmldoc)
    end
end

function render_search(ctx)
    @tags article body h1 header hr html li nav p span ul script

    src = get_url(ctx, ctx.search_navnode)

    head = render_head(ctx, ctx.search_navnode)
    
    updatehead!(head)

    sidebar = render_sidebar(ctx, ctx.search_navnode)
    navbar = render_navbar(ctx, ctx.search_navnode, false)
    article = article(
        p["#documenter-search-info"]("Loading search..."),
        ul["#documenter-search-results"]
    )
    footer = render_footer(ctx, ctx.search_navnode)
    scripts = [
        script[:src => relhref(src, ctx.search_index_js)],
        script[:src => relhref(src, ctx.search_js)],
    ]
    htmldoc = render_html(ctx, ctx.search_navnode, head, sidebar, navbar, article, footer, scripts)
    
    addnavbar!(htmldoc.root)

    open_output(ctx, ctx.search_navnode) do io
        print(io, htmldoc)
    end
end

end # module