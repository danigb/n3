class ItemImagesController < ApplicationController
  before_filter :login_required
  layout 'admin'
    
  def index
    if params[:category].blank?
      @item_images = ItemImage.paginate(:page => params[:page])
    else
      conditions =  {:content_type => 'image/jpeg', :items => {:category => params[:category]}}
      @item_images = ItemImage.paginate(:page => params[:page], :joins => :item, :include => :item,
        :conditions => conditions, :per_page => 100)
    end
  end

  def show
    @item_image = ItemImage.find(params[:id])
  end

  def new
    @item_image = ItemImage.new
  end

  def create
    @item_image = ItemImage.new(params[:item_image])
    if @item_image.save
      flash[:notice] = 'ItemImage was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @item_image = ItemImage.find(params[:id])
  end

  def update
    @item_image = ItemImage.find(params[:id])
    if @item_image.update_attributes(params[:item_image])
      flash[:notice] = 'ItemImage was successfully updated.'
      redirect_to :action => 'show', :id => @item_image
    else
      render :action => 'edit'
    end
  end

  def destroy
    ItemImage.find(params[:id]).destroy
    redirect_to item_images_path
  end
end
