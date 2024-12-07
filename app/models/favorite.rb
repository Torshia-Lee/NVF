class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :lake

  validates :notes, presence: true
  validates :lake_id, presence: true, uniqueness: true
end
