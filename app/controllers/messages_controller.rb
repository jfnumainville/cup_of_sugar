class MessagesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(message_params)
    @message.request = @request
    @message.user = current_user
    if @message.save
      redirect_to item_path(@request, anchor: "message-#{message.id}")
    else
      render 'requests/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
