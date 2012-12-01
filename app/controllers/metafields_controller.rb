class MetafieldsController < ApplicationController
  
  around_filter :shopify_session
  
  def index
    if session[:product_id].blank?
      @metafields = []
    else
      @metafields = ShopifyAPI::Product.find(session[:product_id]).metafields
    end
         
  end
  
  def show
    @metafield = ShopifyAPI::Metafield.find(params[:id])
  end
  
  def new
    @metafield = Metafield.new
  end
  
  def create
    metafield = ShopifyAPI::Metafield.new(params[:metafield].update(
      :resource => 'products', 
      :resource_id => session[:product_id]
    ))
    metafield.namespace = metafield.namespace.parameterize
    if metafield.save
      flash[:notice] = 'Successfully created metafield.'
      redirect_to '/metafields'
    else
      flash[:error] = 'Your metafield could not be saved.'
      render :action => 'new'
    end
  end
  
  def edit
    @metafield = ShopifyAPI::Metafield.find(params[:id])
  end
  
  def update
    metafield = ShopifyAPI::Metafield.find(params[:id]).load(params[:shopify_api_metafield])
    metafield.namespace = metafield.namespace.parameterize
    if metafield.save
      flash[:notice] = 'Successfully updated metafield.'
      redirect_to '/metafields'
    else
      flash[:error] = 'Your metafield could not be saved.'
      render :action => 'edit'
    end
  end
  
  def destroy
    metafield = ShopifyAPI::Metafield.find(params[:id])
    metafield.destroy
    flash[:notice] = 'Successfully deleted metafield.'
    redirect_to '/metafields'
  end
end
