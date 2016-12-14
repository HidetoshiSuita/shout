json.extract! shout_list, :id, :shout, :user_id, :created_at, :updated_at
json.url shout_list_url(shout_list, format: :json)