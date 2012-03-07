module UsersHelper

  # Returns the Gravatar for the given email
  def gravatar_for(user, options = { size: 50, classes: '' })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    
    # can the following line be cleaned up?
    if options[:classes] then classes = ' ' + options[:classes] else classes = '' end
    
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar#{classes}")
  end  
end
