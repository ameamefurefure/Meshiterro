class PostImage < ApplicationRecord
  has_onr_attached:image
  belongs_to :user
end
