class MessagesController < ApplicationController

  # def new
  #   @message = Message.new
  # end

  def create
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact_us(@message).deliver_now
      respond_to do |format|
        format.html { redirect_to root_url, notice: "We have received your message and will be in contact with you soon!" }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'pages/home' }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
