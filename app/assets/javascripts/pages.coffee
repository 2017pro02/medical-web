# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cron = () ->
  now = new Date()
  if now.getHours() == 0 && now.getMinutes() == 0
    window.componentMeal.dayChanged()

$ ->
  unless document.getElementById("tv") then return
  setInterval(cron, 60000)
