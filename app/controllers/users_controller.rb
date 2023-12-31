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
      # Cloudinaryでファイルをアップロードおよび加工する処理
      uploaded_image = Cloudinary::Uploader.upload(params[:user][:avatar].tempfile.path,
        transformation: [
          {
            overlay: "text:Arial_200_bold:結婚おめでとう", # テキストのオーバーレイ
            color: "orange", # テキストの色
            gravity: "north_west", # テキストの位置（左上）
            y: 50, # テキストのy位置の微調整
            x: 50  # テキストのx位置の微調整
          }
        ]
      )

      # アップロードしたファイルのURLを取得
      cloudinary_url = uploaded_image["url"]

      # UserモデルにURLを保存
      @user.remote_avatar_url = cloudinary_url

      # CarrierWaveのアップローダーオブジェクトを保存
      @user.save

      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
