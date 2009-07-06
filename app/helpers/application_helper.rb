# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def name_of token
		@names[token]
  end

  def project_path(project_id)
    {:controller => 'novaron', :action => 'project', :id => project_id} if project_id
  end

	def render_link(label, item)
		if !item.link.nil? && !item.link.empty?
			link = item.link
			link = "mailto: " + link if link =~ /@/
			'<a href="' + link + '">' + label + '</a>'
		end
	end

	def title_of(attachment)
		return attachment.title unless attachment.title.nil? || attachment.title.empty?
		attachment.filename[0..attachment.filename.rindex('.') - 1] 
	end
end
