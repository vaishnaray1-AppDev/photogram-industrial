# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :bigint           not null
#
# Indexes
#
#  index_photos_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Photo < ApplicationRecord
  # belongs_to :owner
  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :likes # inverse of belongs_to :photo
  has_many :comments # inverse of belongs_to :photo


  has_many :fans, through: :likes

  validates :caption, presence: true
  validates :image, presence: true

end
