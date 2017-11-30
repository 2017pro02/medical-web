# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

set_week_hash = (id) ->
  if id == "month"
    $("#month").addClass("active")
    $("#week").removeClass("active")
  else
    $("#week").addClass("active")
    $("#month").removeClass("active")
  for s in ["#prev", "#next"]
    href = $(s).attr("href")
    if href.indexOf("#") != -1
      href = href.slice(0, href.indexOf("#")) + "##{id}"
    else
      href = href + "##{id}"
    $(s).attr("href", href)

$(document).on 'ready turbolinks:load', ->
  unless month_cal = document.getElementById("month-cal") \
     and week_cal  = document.getElementById("week-cal") \
     then return

  if location.hash.substr(1) == "week"
    $("#month-cal, #week-cal").toggle()
    set_week_hash("week")
  else
    $("#month").addClass("active")

  $("#month, #week").click ->
    if this.id == location.hash.substr(1) then return
    location.hash = this.id
    $("#month-cal, #week-cal").toggle()
    set_week_hash(this.id)
