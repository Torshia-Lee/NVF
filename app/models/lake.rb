class Lake < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :fishing_logs, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
