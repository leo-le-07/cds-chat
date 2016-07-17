jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  filepicker = $('#message_image_url')
  if messages.length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.conversations = App.cable.subscriptions.create {
        channel: "ConversationsChannel"
        conversation_id: messages.data('conversation-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, conversation_id) ->
        @perform 'send_message', message: message, conversation_id: conversation_id, sid: messages.data('sid'), rid: messages.data('rid'), image_url: filepicker.val()

    $('#new_message').submit (e) ->
      $this = $(this)
      inputText = $this.find('#message_content')
      if $.trim(inputText.val()).length > 0
        App.conversations.send_message inputText.val(), messages.data('conversation-id')
        inputText.val('')
      e.preventDefault()
      return false
