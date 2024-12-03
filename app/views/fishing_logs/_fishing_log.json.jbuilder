json.extract! fishing_log, :id, :user_id, :lake_id, :date, :species, :notes, :lures, :photo, :created_at, :updated_at
json.url fishing_log_url(fishing_log, format: :json)
