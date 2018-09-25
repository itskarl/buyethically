class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("http://api.walmartlabs.com/v1/items?apiKey=e7cvndf2d9pv8yv77cgnebcg&upc=#{searched}")
      @req = JSON.parse(@data.body_str)
    end
    rescue StandardError
      flash.now[:error] = "Product Not Found"

  end

  def about
  end
end
