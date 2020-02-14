module LikesHelper
  def liked?(_user)
    @liked
  end

  def set_like
    @liked = true
  end

  def unset_like
    @liked = false
  end
end
