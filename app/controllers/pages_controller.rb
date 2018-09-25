class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      # @data = Curl::Easy.perform("http://api.walmartlabs.com/v1/items?apiKey=e7cvndf2d9pv8yv77cgnebcg&upc=#{searched}")
      # @req = JSON.parse(@data.body_str)

      require 'open-uri'
      @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/#{searched}"))
      @manufacturer = @doc.search('p')[1].text
    end

    rescue StandardError
    rescue Exception

  end

  def about
  end
end
