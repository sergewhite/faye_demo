class RootController < ApplicationController
  def index
    @channel = Channel.new
    @channels = Channel.all
  end
end
