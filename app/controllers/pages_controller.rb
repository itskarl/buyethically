class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://api.barcodable.com/api/v1/upc/#{searched}")
      @req = JSON.parse(@data.body_str)

      #       require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/043695071238"))

    end

    rescue StandardError
    rescue Exception
  end

  def about
  end
end
