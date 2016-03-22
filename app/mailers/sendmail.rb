class Sendmail < ApplicationMailer
	default from: 'teleantioquiaapps@teleantioquia.com.co'
   
	def send_email(adjunto)
		@adjunto = adjunto
	  #@user = user
	  #@url  = 'http://www.gmail.com'
	  #delivery_options = { user_name: 'prueba1@teleantioquia.com.co', password: 'teleantioquia', address: 'correo.edatel.net.co' }
	  delivery_options = { user_name: 'teleantioquiaapps@teleantioquia.com.co', password: 'teleantioquia2015ta', address: 'correo.edatel.net.co' }
	  attachments["#{@adjunto.original_filename}"] = File.read(@adjunto.tempfile)
	  #mail(to: "long64@hotmail.com", content_type: "text/html", subject: "Nuevo Adjunto", delivery_method_options: delivery_options)
	  mail(to: "gerperez64@gmail.com", subject: "Nuevo Adjunto", delivery_method_options: delivery_options)
	end
end
