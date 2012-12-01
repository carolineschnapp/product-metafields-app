class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
  
  def index
    # get product
    puts 'The URL is ' + ShopifyAPI::Base.site.to_s
    unless params[:id].blank?
      session[:product_id] = params[:id]
    end
    unless session[:product_id].blank?
      @product = ShopifyAPI::Product.find(session[:product_id])
    end
  end
  
end