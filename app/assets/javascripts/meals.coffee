# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

obj =
  type: "radar"
  data:
    labels: ["カロリー", "タンパク質", "脂質", "炭水化物", "食物繊維", "飽和脂肪酸"]
    datasets: [
      {
        label: "基準"
        data: [100, 100, 100, 100, 100, 100]
      }
      {
        label: "本日"
        data: []
        backgroundColor: "#FFB74D"
      }
    ]
    options:
      scale:
        display: false


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
  if month_cal = document.getElementById("month-cal") and week_cal  = document.getElementById("week-cal")
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

  #meals:show
  if ctx = document.getElementById("dri")
    chart = new Chart ctx, obj

    dri = ["energy", "protein", "lipid", "carbohydrate", "dietary_fiber", "saturated_fatty_acid"]
    d = []
    for name in dri
      d[name] = parseInt ctx.getAttribute(name)
    unless d["energy"] then return

    ndata = [0, 0, 0, 0, 0, 0]

    fetch(location.href + ".json", { credentials: "include" })
    .then (res) ->
      return res.json()
    .then (json) ->
      for j in json
        for n in j.nutritions
          dri.forEach (v, i, a) ->
            ndata[i] += n[v]
      ndata = ndata.map (v, i) ->
        v * 100 / d[dri[i]]
      obj["data"]["datasets"][1]["data"] = ndata
      chart.update()
