# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@CommentPoller =
	poll: ->
		setTimeout @request, 5000

	request: ->
		$.get($('.microposts').data('url'), after: $('.microposts').last().data('id'))

jQuery ->
	if $('.microposts').length > 0
		CommentPoller.poll()