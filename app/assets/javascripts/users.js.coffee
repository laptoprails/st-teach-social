# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
(($) ->
  $.fn.charCount = (options) ->

    # default configuration properties
    calculate = (obj) ->
      count = $(obj).val().length
      available = options.allowed - count
      if available <= options.warning and available >= 0
        $(obj).next().addClass options.cssWarning
      else
        $(obj).next().removeClass options.cssWarning
      if available < 0
        $(obj).next().addClass options.cssExceeded
      else
        $(obj).next().removeClass options.cssExceeded
      $(obj).next().html options.counterText + available
    defaults =
      allowed: 160
      warning: 25
      css: "counter"
      counterElement: "span"
      cssWarning: "warning"
      cssExceeded: "exceeded"
      counterText: "Characters Left: "

    options = $.extend(defaults, options)
    @each ->
      $(this).after "<" + options.counterElement + " class=\"" + options.css + "\">" + options.counterText + "</" + options.counterElement + ">"
      calculate this
      $(this).keyup ->
        calculate this

      $(this).change ->
        calculate this


) jQuery



