module AfterLogInProsessHelper
  def get_resp(id)#返信のshout_id
    info=ShoutList.find_by(:id => id)
    info
  end
  def find_genre_name(genre_id)
    genre = Genre.find_by(:id => genre_id)
    genre.name
  end
end
