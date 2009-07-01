class NovaronController < ApplicationController

  def index
		redirect_to :action => 'news'
	end

	def news
		@section = "news"
		@items = []
		0.upto(4) {|index| @items[index] = Item.find(:first, :conditions => ['category = ? AND position = ?', 'news', (index + 1)]) || Item.new}
	end

  def show
	  if params[:id].strip =~ /^\d+$/ # is a number?
			@item = Item.find_by_id params[:id]
			@items = Item.find_all_by_category(@item.category, :order => 'position')
    else
			@items = Item.find_all_by_category(params[:id], :order => 'position')
			@item = @items.first
		end
		@slideshow = @item.slideshow		
		@section = @item.category
	end

	def services
		show
	end

	def contact
 		prepare('contact', params[:id], nil)
	end

	def team
		id = params[:id]
 		prepare('team', id, nil)
 		@item = nil if (id.nil? || !(id.strip =~ /^\d+$/))
	end

  def project
    @item = Item.find_by_id(params[:id])
		@group = period_of(@item.subcategory)
		@items = Item.find_projects(years_in @group)
		@slideshow = @item.slideshow
  end

	def projects
		@section = "Projekte"

		@groups = @periods
		@group = params[:id]
		@group = @current_period if @group.nil?
		@items = Item.find_projects(years_in @group)
		@item = nil
		all = []
		@items.each {|item| all << [item.index_image.public_filename, item.id ] if !item.index_image.nil? }
		@images = []
		range = 0..((6*3) - 1)
		range.each do |index| 
			@images[index] = ['index_empty.gif', nil]
		end
		all.each_with_index {|thumb, index| @images[index] = thumb }
		@images.reverse!
	end

  private
  def prepare(category, id, group)
  	@group = group
	  if id.nil?
			@group = @subcategories[category][0] if @group.nil?
			@item = nil
		elsif id.strip =~ /^\d+$/
			@item = Item.find_by_id(id)
			@group = @item.subcategory if @group.nil?
		else
			@group = id
			@item = nil
		end
		@groups = @subcategories[category]
    @items = Item.find_all_by_category_and_subcategory(category, @group, :order => 'position')
		@item = @items.first if @item.nil?
		@section = @item.category
	end
end
