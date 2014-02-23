module ApplicationHelper
  def get_image_url_for email
    # if !profile['fbId'].blank?
    #   fbIMG = get_fb_image profile['fbId']
    #   return fbIMG if fbIMG
    # else
    #   img = get_tt_image profile
    #   return img if img
      
    #   gravatar_img = 
    get_gravatar email
      #return gravatarIMG if gravatarIMG
    #end
  end

  def get_fb_image fb_id
    "https://graph.facebook.com/#{fb_id}/picture?width=250&height=250"
  end
  def get_tt_image profile
    nil
  end
  def get_gravatar email
    gravatar_image_url(
      email.gsub('spam', 'mdeering'), 
      filetype: :png, 
      rating: 'pg', 
      size: 300, 
      secure:false,
      default: 'https://assets.github.com/images/gravatars/gravatar-140.png' 
    )
  end
end