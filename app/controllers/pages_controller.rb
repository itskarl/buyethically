class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://api.barcodable.com/api/v1/upc/#{search}")
      @req = JSON.parse(@data.body_str)
      @manufacturer = @req['item']['manufacturer']
      @company = @req['item']['company_name']
      #
      # require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/#{searched}"))
      # @manufacturer = @doc.search('p')[1].text
    end
    # 
    # rescue StandardError
    # rescue Exception

  end

  def about
  end
end
