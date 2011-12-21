#require "#{Rails.root}/lib/"
class ChannelsController < ApplicationController
  def show
    @channel = Channel.find_by_id params[:id]
  end
  
  def create
    @channel = Channel.find_or_create_by_title(params[:channel][:title])
    if @channel.present?
      redirect_to channel_path @channel.id
    else
      redirect_to root_path
    end
  end
  
  def add_message
    debugger
    ChatFaye.broadcast "/channel/#{params[:id]}", params[:message]
    render :nothing => true
  end
end
