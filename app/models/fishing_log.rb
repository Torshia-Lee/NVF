class FishingLog < ApplicationRecord
  belongs_to :user
  belongs_to :lake

  validates :date, presence: true
  validates :species, presence: true
  validates :notes, presence: true
  validates :lures, presence: true
end
