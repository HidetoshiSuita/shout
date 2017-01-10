json.extract! follow_list, :id, :user_id, :follow_id, :created_at, :updated_at
json.url follow_list_url(follow_list, format: :json)