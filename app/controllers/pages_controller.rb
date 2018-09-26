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

      @thecompany = @req['item']['company_name']
      @themanufacturer = @req['item']['matched_items'][0]['manufacturer']
      #creating an abbreviation from the company name to parse through the API
      if @thecompany[0..3].chars.count == 4
        @company_abbrev = @thecompany[0..3].downcase
        @matched_company = @req2.find {|x| x['company'].downcase.gsub("the ", "").match(/#{@company_abbrev}/)}['company'] if @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}
      end
      if @matched_company == nil
        @company_abbrev = @themanufacturer[0..3].downcase if @themanufacturer
        @matched_company = @req2.find {|x| x['company'].downcase.gsub("the ", "").match(/#{@company_abbrev}/)}['company'] if @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}
      end

      #now comparing company found on UPC to list of companies in API


    end

    # rescue StandardError
    # rescue Exception
  end

  def about
  end
end
