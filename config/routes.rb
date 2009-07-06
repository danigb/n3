ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'novaron', :action => 'slideshow'

  map.connect 'Projekte', :controller => 'novaron', :action => 'projects', :id => nil
  map.connect 'Projekte/:id', :controller => 'novaron', :action => 'projects'
  map.connect 'Projekt/:id', :controller => 'novaron', :action => 'project'
  map.connect 'Slideshow', :controller => 'novaron', :action => 'slideshow'

  map.connect 'Dienstleistungen', :controller => 'novaron', :action => 'services', :id => 'services'
  map.connect 'Dienstleistungen/:id', :controller => 'novaron', :action => 'services'

  map.connect 'Kaufangebote', :controller => 'novaron', :action => 'show', :id => 'sell'
  map.connect 'Mietangebote', :controller => 'novaron', :action => 'show', :id => 'rent'
  map.connect 'Kauf-Mietangebote/:id', :controller => 'novaron', :action => 'show'

  #  map.connect 'Team', :controller => 'novaron', :action => 'team'
  map.connect 'Team/:id', :controller => 'novaron', :action => 'team'

  #  map.connect 'Kontakt', :controller => 'novaron', :action => 'contact'
  map.connect 'Kontakt/:id', :controller => 'novaron', :action => 'contact'


	map.connect 'admin/:action/:id/:group', :controller => 'admin'
  #  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
