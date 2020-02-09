using Luxor
using Luxor: julia_blue

function getloc(tpath, idx)
    xpoint = 0
    ypoint = Inf
    xpoint = polycentroid(tpath[idx]).x
    for t in tpath
        cpos = polycentroid(t)
        (cpos.y < ypoint) && (ypoint = cpos.y)
    end
    return xpoint, ypoint
end

function find_i_index(txt)
    i = 0
    for c in txt
        if c in (
            'a', 'b', 'c', 'd', 'e',
            'f', 'g', 'h',
            'k', 'l', 'm', 'n', 'o', 
            'p', 'q', 'r', 's', 't', 
            'u', 'v', 'w', 'x', 'y',
            'z',
            'A', 'B', 'C', 'D', 'E',
            'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O',
            'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 
            'Z',
        )
            i += 1
        elseif c == 'j'
            i += 2
        elseif c == 'i'
            return i + 1
        else
            @error "Unsupoorted character \"$c\""
        end
    end
    @error "No \"i\" in the given text \"$txt\""
end
            
"""
Create a Julia style logo for the
given text which contains an "i".

Example:
```julia
textlogo("Turing")
```
![](turinglogo-new.svg)
"""
function textlogo(
    txt::String;
    ff::String="TamilMN-Bold",  # TamilMN-Bold is the font Julia's logo
    fs::Int=50,                 # font size
    xshift=( fs / 6),           # shifts for x
    yshift=(-fs / 6),           # and y axes to move Julia circles
    is_dark::Bool=false,        # dark mode or not
    is_firstblue::Bool=false,   # to draw a transparent blue on the first letter or not
    is_overlapred=true,         # to overlap red or purple?
    filename="$(lowercase(txt))-logo.svg"
)
    @assert !('c' in txt) "No \"i\" in the given text \"$txt\""
    ratio, wratio = fs / 50, length(txt) / 6
    radius = fs / 5
    for suffix in ("png", "svg")
        drawing = Drawing(180 * ratio * wratio, 80 * ratio, "$filename.$suffix")
        
        translate(5 * ratio * wratio, 65 * ratio)
        fontface(ff)
        fontsize(fs)
        if is_dark
            background("black")
            sethue("white")
        else
            background("white")
            sethue("black")
        end
            
        text(txt)
        textoutlines(txt, O, :path)
        tpath = pathtopoly()
        
        # Red, green and purple circles
        xpoint, ypoint = getloc(tpath, find_i_index(txt))
        if is_overlapred
            xtrans, ytrans = xpoint + xshift, ypoint + yshift
        else
            xtrans, ytrans = xpoint + xshift, ypoint + yshift
        end
        translate( xtrans,  ytrans)
        juliacircles(radius)
        translate(-xtrans, -ytrans)
            
        # Blue circle
        if is_firstblue
            xpoint, ypoint = getloc(tpath, 1)
            translate(xpoint - xshift, ypoint)
            p = ngon(O, radius, 1, pi/6, vertices=true)[1]
            setcolor((julia_blue..., 0.5))
            circle(p, 2 * radius, :fill)
        end
        
        finish()
    end
    preview()
end

turinglogo(; kwargs...) = textlogo("Turing"; kwargs...)
    
turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-small"),  fs=50)
turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-medium"), fs=100)
turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-large"),  fs=200)

turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-dark-small"),  fs=50,  is_dark=true)
turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-dark-medium"), fs=100, is_dark=true)
turinglogo(; filename=joinpath(@__DIR__, "../images/logo-text-dark-large"),  fs=200, is_dark=true)
