module LikesHelper
  def liked?(user)
    @liked
  end
  def set_like
    @liked = true
  end
  def unset_like
    @liked = false
  end
end
