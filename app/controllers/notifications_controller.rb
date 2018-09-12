class NotificationsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  before_action :authenticate_user!
  before_action :set_notifications

  def index
    @notifications = Notification.all.reverse
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to :back
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end

end
