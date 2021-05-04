module ImageHelper
  def status_image_tag(user)
    if user.id.odd?
      image_tag 'fish.png', size: 40
    else
      image_tag 'fishbone.png', size: 40
    end
  end
end
