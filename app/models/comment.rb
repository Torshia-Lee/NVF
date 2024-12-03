class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :lake_id
end
