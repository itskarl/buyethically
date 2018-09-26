class PagesController < ApplicationController
  def home
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://api.barcodable.com/api/v1/upc/#{searched}")
      @req = JSON.parse(@data.body_str)

      # require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/043695071238"))
      @data2 = Curl::Easy.perform("https://bridge.buddyweb.fr/api/blorps/asdasdasdasd")
      @req2 = JSON.parse(@data2.body_str)


      if @req['item']['company_name'][0..3].chars.count < 4
        @company_abbrev = @req['item']['company_name'][0..3].downcase
      else
        @company_abbrev = @req['item']['matched_items'][0]['manufacturer'][0..3].downcase
      end


      @matched_company = @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}['company'] if @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}

    end

    # rescue StandardError
    # rescue Exception
  end

  def about
  end
end
