import Documenter.Writers.HTMLWriter: render_page
using Documenter.Utilities.DOM: @tags, Node, Attributes
using Documenter.Writers.HTMLWriter: getpage, render_head, render_sidebar, render_navbar, render_article, render_footer, render_html, open_output

function render_page(ctx, navnode)
    @tags html div body
    page = getpage(ctx, navnode)
    head = render_head(ctx, navnode)

    # Add the Tailwind CSS to head
    tailwind = Node(:script, [:src => "https://cdn.tailwindcss.com"], Node[])
    push!(head.nodes, tailwind)
    
    sidebar = render_sidebar(ctx, navnode)
    navbar = render_navbar(ctx, navnode, true)
    article = render_article(ctx, navnode)
    footer = render_footer(ctx, navnode)
    htmldoc = render_html(ctx, navnode, head, sidebar, navbar, article, footer)

    # Add the header navbar to first thing in body
    header_str = read(joinpath(@__DIR__, "../_layout/header.html"), String)
    header = Node(Symbol("#RAW#"), Attributes(), [Node(header_str)])
    insert!(htmldoc.root.nodes, 2, header) # head is at index 1 so we insert at index 2

    open_output(ctx, navnode) do io
        print(io, htmldoc)
    end
end