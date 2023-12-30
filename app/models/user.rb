class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
end
