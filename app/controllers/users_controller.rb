class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users=User.all
  end

  def show
  end
  def destroy
    user=User.find(params[:id])
    user.destroy
    redirect_to root_path,notice:"ユーザ登録の取り消しが完了しました。"
  end

  def edit
  end
end
