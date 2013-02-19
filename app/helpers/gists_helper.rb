module GistsHelper
  def favorited?(user_id, gist_id)
    if Favorite.where(:user_id => user_id, :gist_id => gist_id).length > 0
      return true
    else
      return false
    end
  end
end
