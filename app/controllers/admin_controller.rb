# encoding: utf-8
class AdminController < ApplicationController
  layout "admin"
  before_filter :login_required
  before_filter :force_utf8_params

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update, :destroy_image ],
    :redirect_to => { :action => :index }

  def index
  end

  def list
    @category = params[:id]
    @groups = @subcategories[@category]
    @group = params[:group].nil? ? @groups.first : params[:group]
    @items = Item.find(:all, :conditions => ["category = ? AND subcategory = ?", @category, @group], :order => "subcategory, position")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @category = params[:id]
    @item.category = @category
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      save_images @item, params
      flash[:notice] = 'Eintrag gespeichert'
      redirect_to :action => 'edit', :id => @item
    else
      render :action => 'new', :id=> @item.category
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      save_images @item, params
      flash[:notice] = 'Einträge aktualisiert'
      redirect_to :action => 'edit', :id => @item
    else
      render :action => 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to :action => 'list', :id => item.category
  end

  def destroy_image
    image = ItemImage.find(params[:id])
    image.destroy
    redirect_to :action => 'edit', :id => image.item_id
  end

  def edit_attachment
    @attachment = ItemImage.find(params[:id])
  end

  def update_attachment
    attachment = ItemImage.find(params[:id])
    if attachment.update_attributes(params[:attachment])
      flash[:notice] = 'Eintrag aktualisiert'
      redirect_to :action => 'edit', :id => attachment.item_id
    else
      render :action => 'edit_attachment'
    end
  end

  def reorder
    category = params[:id]
    group = params[:group]
    @items = Item.find(:all, :conditions => ["category = ? AND subcategory = ?", category, group], :order => "position")
    @items.each_with_index do |item, index| 
      item.position = "%03d" % (index + 1)
      item.save
    end
    redirect_to :action => "list", :id => category, :group => group
  end

  def move_up
    image = ItemImage.find(params[:id])
    image.move_higher
    redirect_to :action => 'edit', :id => image.item
  end

  def move_down
    image = ItemImage.find(params[:id])
    image.move_lower
    redirect_to :action => 'edit', :id => image.item
  end


  private
  def save_images(item, params)
    unless params[:attachment].nil?
      params[:attachment].each do |attachment|
        item.item_images << ItemImage.new(:uploaded_data => attachment) unless attachment.size == 0
      end
    end
  end

  # https://rails.lighthouseapp.com/projects/8994/tickets/4336-ruby19-submitted-string-form-parameters-with-non-ascii-characters-cause-encoding-errors
  def force_utf8_params
    traverse = lambda do |object, block|
      if object.kind_of?(Hash)
        object.each_value { |o| traverse.call(o, block) }
      elsif object.kind_of?(Array)
        object.each { |o| traverse.call(o, block) }
      else
        block.call(object)
      end
      object
    end
    force_encoding = lambda do |o|
      o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
    end
    traverse.call(params, force_encoding)
  end
end
