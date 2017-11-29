# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', ->
  unless month_cal = document.getElementById("month-cal") \
     and week_cal  = document.getElementById("week-cal") \
     then return

  $("#month-btn, #week-btn").click ->
    $("#month-cal, #week-cal").toggle()
