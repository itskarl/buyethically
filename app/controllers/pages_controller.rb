class PagesController < ApplicationController
  def home

    #the search begins here!!
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://api.barcodable.com/api/v1/upc/#{searched}")
      # @data = Curl::Easy.perform(jsontest.json)
      @req = JSON.parse(@data.body_str)

      # require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/043695071238"))

      # this is my own API, uploaded to buddyweb server where we find company info
      @data2 = Curl::Easy.perform("https://bridge.buddyweb.fr/api/companyrating/companyratings")
      @req2 = JSON.parse(@data2.body_str)

      if @req['item']
      @thecompany = @req['item']['company_name'].downcase.gsub("the ", "")
      end

      if @req['item']['matched_items'][0] && @req['item']['matched_items'][0]['manufacturer']
        @themanufacturer = @req['item']['matched_items'][0]['manufacturer'].downcase.gsub("the ", "")
      else
        @themanufacturer = nil
      end

      #creating an abbreviation from the company name to parse through the API
      if @thecompany && @thecompany[0..3].chars.count == 4
        @company_abbrev = @thecompany[0..3].downcase
        @found_company = @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)} if @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}
        @matched_company = @found_company['company'] if @found_company
      end

      #if you cant match the company name, try the manufacturer name
      if @matched_company == nil
        @company_abbrev = @themanufacturer[0..3].downcase if @themanufacturer
        @found_company = @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)} if @req2.find {|x| x['company'].downcase.match(/#{@company_abbrev}/)}
        @matched_company = @found_company['company'] if @found_company
      end


      if @found_company && @matched_company
        @company_score = @found_company['score']

        #newsAPI here!
        @newssearchterm = URI.encode(@matched_company.gsub(/[!@%&"-]/,' '))
        @daterange = (Time.now - 28.days).strftime("%C%y-%m-%d")

        @newsdata = Curl::Easy.perform("https://newsapi.org/v2/everything?q=#{@newssearchterm}%20company&from=#{@daterange}&sortBy=popularity&apiKey=bcd7a32090a74b88b8730f2c5540a792")
        p @newssearchterm

        @newsreq = JSON.parse(@newsdata.body_str)

        @newsarticles = @newsreq['articles']
        #newsAPI here!
      end

    end

    rescue StandardError
    rescue Exception
  end

  def about
  end
end
