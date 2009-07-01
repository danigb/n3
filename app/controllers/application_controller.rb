# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class NameValue
	attr_reader :name, :value

	def initialize(name, value)
		@name = name
		@value = value
	end
end

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation

  include AuthenticatedSystem

	def initialize 
		@categories = ['news', 'projects', 'services', 'sell', 'rent', 'team', 'contact']
		name_list = ['News', 'Projekte', 'Dienstleistungen', 'Kaufangebote', 'Mietangebote', 'Team', 'Kontakt']
		@names = {}
		@categories.each_with_index {|item, index| @names[item] = name_list[index]}
		@subcategories = {}
		@categories.each {|item| @subcategories[item] = ['all']}
    # JODER: (2007..1996).to_a
		@subcategories['projects'] = ['2009', '2008', '2007', '2006', '2005', '2004', '2003', '2002', '2001', '2000', '1999', '1998', '1997', '1996']  
		@subcategories['team'] = ['Diepoldsau', 'Zürich']
		@subcategories['contact'] = ['Diepoldsau', 'Zürich']
		@positions = [NameValue.new('Diashow', 'slideshow'), 
      NameValue.new('Karte', 'map'),
      NameValue.new('Hauptbild', 'main image'),
      NameValue.new('Pdf', 'pdf'),
      NameValue.new('Projekte index bild', 'index image'),
      NameValue.new('Kein', 'none')]


		@periods = ['2009 | 2008', '2007 | 2006', '2005 | 2004', '2003 | 2002', '2001 | 2000', '1999 | 1998', '1997 | 1996']
		@period_years = [[2009, 2008], [2007, 2006], [2005, 2004], [2003, 2002], [2001, 2000], [1999, 1998], [1997, 1996]]
		@map = {}
		@periods.each_with_index {|period, index| @map[@periods[index]] = @period_years[index]}
		@current_period = @periods[0]
	end
	
	def years_in(period)
		limits = @map[period]
		[limits[0], limits[1]]
	end
	
	def period_of(year)
    # # 		@periods.find {|period| Regex.new(period).match(year.to_s).nil? }
		@periods.find {|period| !period.index(year.to_s).nil?}
	end	
	

end