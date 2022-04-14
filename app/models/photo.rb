class Photo < ApplicationRecord
  # belongs_to :owner
  belongs_to :user, class_name: "User"
end
