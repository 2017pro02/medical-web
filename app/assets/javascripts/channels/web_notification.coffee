App.web_notification = App.cable.subscriptions.create "WebNotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if Notification.permission == "default"
        Notification.requestPermission (permission) ->
          notify(permission, data["title"], data["body"])

    notify(Notification.permission, data["title"], data["body"])

notify = (permission, title, body) ->
  if permission == "granted"
      new Notification title, body: body
