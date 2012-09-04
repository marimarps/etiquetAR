module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user: an image that that the user can manimpulate to define his/her avatar.
	def gravatar_for(user)
		# In Ruby, the MD5 hashing algorithm is implemented using the hexdigest method
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  	end

  	def qr_resources
  		  @resources=Resource.where(:qr_id => qr.id)
  	end
end
