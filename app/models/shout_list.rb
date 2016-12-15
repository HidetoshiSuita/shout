class ShoutList < ApplicationRecord
  def create_shout_list(contents, usr_id)
    ShoutList.create(
                     :shout => contents,
                     :user_id =>usr_id
                     )
  end
end
