module NovaronHelper

	def filename_of(image)
	  return image.nil? ? "empty.gif" : image.public_filename
	end
	
	def beautify(text)
		text = '' if text.nil?
		RedCloth.new(text, [:hard_breaks]).to_html 
	end
end
