-- adds methods to elements using a single function for get and set operations
-- ex: instead of getWidth() and setWidth(val), use width() and width(val)

import graphics from love
import sub, len from string

path = sub ..., 1, len(...) - len "/extensions/streamlined_get_set"
element = require "#{path}/elements/element"
box = require "#{path}/elements/box"
text = require "#{path}/elements/text"

element.__base.position = (x, y) =>
    if x or y
        return @setPosition x, y
    else
        return @getPosition!

element.__base.size = (w, h) =>
    if w or h
        return @setSize w, h
    else
        return @getSize!

element.__base.width = (w) =>
    if w
        return @setWidth w
    else
        return @getWidth!

element.__base.height = (h) =>
    if h
        return @setHeight h
    else
        return @getHeight!

element.__base.alignment = (horizontal, vertical) =>
    if horizontal or vertical
        return @setAlignment horizontal, vertical
    else
        return @getAlignment!

-- why is this bit here? Oo
element.__base.margin = (m) =>
    if m
        return @setMargin m
    else
        return @getMargin!

--oldinit = element.__init
--
--element.__init = (...) ->
--    object = oldinit ...
--    value = object.margin
--
--    object.margin = setmetatable {:value}, {
--        __call: (...) ->
--            print ...
--    }

element.__base.resize = element.__base.adjustSize

-- box.__base.background -- can't be done!

box.__base.color = (r, g, b, a) =>
    if r or g or b or a
        return @setColor r, g, b, a
    else
        return @getColor!

text.__base.text = (text) =>
    if text
        return @setText text
    else
        return @getText!

text.__base.font = (font) =>
    if font
        return @setFont font
    else
        return @getFont!

text.__base.color = (r, g, b, a) =>
    if r or g or b or a
        return @setColor r, g, b, a
    else
        return @getColor!