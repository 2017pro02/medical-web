# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

resize = () ->
  h = $("footer .container").height()
  $("body").css {"cssText": "margin-bottom: #{h+60}px !important"}
  $("footer").css "height", h

cron = () ->
  now = new Date()
  if now.getHours() == 0 && now.getMinutes() == 0
    window.componentMeal.dayChanged()

$(document).on "ready turbolinks:load", ->
  if $("footer").length != 0
    resize()
    $(window).resize ->
      resize()

  unless document.getElementById("tv") then return
  setInterval(cron, 60000)
