module ResourcesHelper

	#Defining assignment to current_qr. 
	def current_qr=(qr)
	 @current_qr = qr
	end

	def current_qr
		@current_qr ||= Qr.find_by_qr_id(qr)
	end

end
