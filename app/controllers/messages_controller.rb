class MessagesController < ApplicationController
  def index

  end

  def demo
    ApplicationCable.server.broadcast('demo', {content: 'Salut'})
  end
end
