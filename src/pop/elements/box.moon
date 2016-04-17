import graphics from love
import sub, len from string

path = sub ..., 1, len(...) - len "/box"
element = require "#{path}/element"

class box extends element
    new: (parent, background=false) =>
        super parent

        @w = 20
        @h = 20

        @background = background

    draw: =>
        if @background
            if type(@background) == "table"
                graphics.setColor @background
                graphics.rectangle "fill", @x, @y, @w, @h
            else
                w, h = @background\getDimensions!
                w = @w / w
                h = @h / h
                graphics.setColor 255, 255, 255, 255
                graphics.draw @background, @x, @y, 0, w, h

        return @

    debugDraw: =>
        graphics.setLineWidth 0.5
        graphics.setColor 0, 0, 0, 100
        graphics.rectangle "fill", @x, @y, @w, @h
        graphics.setColor 0, 0, 200, 200
        graphics.rectangle "line", @x, @y, @w, @h
        graphics.setColor 200, 200, 255, 255
        graphics.print "b", @x, @y

        return @

    setBackground: (background) =>
        @background = background
        return @

    getBackground: =>
        return @background

    setColor: (r, g, b, a=255) =>
        if type(r) == "table"
            @background = r
        else
            @background = {r, g, b, a}

        return @

    getColor: =>
        if type(@background) == "table"
            return unpack @background
        else
            error "Box \"#{@}\" doesn't have a color." --might be a bad idea