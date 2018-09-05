class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def speak(data)
    message = Message.create(body: data['message'])
    html = ApplicationController.render(partial: 'messages/message', locals: {message: message})
    ActionCable.server.broadcast 'messages', message: html
  end
end
