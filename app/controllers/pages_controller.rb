class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://www.digit-eyes.com/gtin/v2_0/?upcCode=#{searched}&field_names=all&language=en&app_key=/+90u/IFDVg6&signature=KN/BBmEUE4tKFPemTydKvRdmADY=")
      @req = JSON.parse(@data.body_str)
      # @manufacturer = @req['item']['manufacturer']
      @company = @req['manufacturer']['company']
      #
      # require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/#{searched}"))
      # @manufacturer = @doc.search('p')[1].text
    end

    rescue StandardError
    rescue Exception

  end

  def about
  end
end
