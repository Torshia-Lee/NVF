class FishingLog < ApplicationRecord
  belongs_to :user
  belongs_to :lake
end
