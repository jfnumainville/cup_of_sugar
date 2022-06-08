class ChatroomsController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @chatroom = Chatroom.new(name: @item.name)

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to item_path(@item)
    end
  end


  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
