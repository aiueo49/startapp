class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    # Cloudinaryへのアップロードを行う
    uploaded_image = Cloudinary::Uploader.upload(params[:user][:avatar].tempfile.path)
  
    # アップロードしたファイルのURLを取得
    cloudinary_url = uploaded_image["url"]
  
    # avatarを許可し、それをマージ
    params.require(:user).permit(:avatar).merge(avatar: cloudinary_url)
  end  
end
