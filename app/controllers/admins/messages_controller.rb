class Admins::MessagesController < Admins::ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to admins_root_path
      flash[:notice] = '投稿が完了しました'
    else
      flash[:alert] = '必須項目を入力してください'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(admin_id: current_admin.id)
  end
end