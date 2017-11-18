App.tv = App.cable.subscriptions.create "TvChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    switch data.type
      when "meal"
        if (meal = document.getElementById("meal")) != null
          window.componentMeal.addMeal(data.img.url)

      when "comment"
        if (comment = document.getElementById("comment")) != null
          window.componentComment.addComment(data.from, data.message)
