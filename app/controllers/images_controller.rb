class ImagesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @item_image_pages, @item_images = paginate :item_images, :per_page => 10
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
    redirect_to :action => 'list'
  end
end
