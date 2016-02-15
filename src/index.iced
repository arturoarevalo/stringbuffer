
process = require "process"

class StringBuffer

    @NEWLINE = switch
        when process.platform is "win32" then "\r\n"
        else "\n"


    constructor: (@separator = "") ->
        @buffer = []
        @index = 0


    append: (string) ->
        if "StringBuffer" is typeof string
            @append s for s in string.buffer
        else
            @buffer[@index] = string
            @index++

        return @


    toString: (separator) ->
        separator ?= @separator

        return @buffer.join separator


module.exports = StringBuffer
