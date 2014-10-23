# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Helper
  getInfo: ->
    $.ajax
      type: 'post'
      url: '/wellcome/get_source'
      success: @fillSourcePanel()
      error: @error()

  fillSourcePanel: ->

  error: ->

$(document).ready ->
  helper = new Helper
  $('.get_info').click ->
    helper.getInfo()
    return false
