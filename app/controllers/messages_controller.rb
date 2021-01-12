class MessagesController < ApplicationController

  before_action :set_message, only: [:destroy]

	def index
		@messages = Message.recent
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
			flash[:notice] = "File uploaded succesfully"
			redirect_to  messages_path
		else
			render 'new'
		end
  end

  def delete_attachment
    @media_assest = ActiveStorage::Blob.find_signed(params[:id])
    @media_assest.purge_later
    redirect_to  messages_path
  end

  private

    def set_message
    	@message = Message.find(params[:id])
    end

		def message_params
		  params.require(:message).permit(:description, :image, media_assests: [])
		end
end
