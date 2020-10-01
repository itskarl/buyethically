class PagesController < ApplicationController
  def home

    #the search begins here!!
    if params[:upc_input]
      searched = params[:upc_input]
      @data = Curl::Easy.perform("https://api.barcodable.com/api/v1/upc/#{searched}")
      # @data = Curl::Easy.perform("https://raw.githubusercontent.com/itskarl/jsonfiles/master/buyer?token=AmseyX-qnkfFcszX4a3RDLxElYMoU-90ks5btmT9wA%3D%3D")
      @req = JSON.parse(@data.body_str)

      # require 'open-uri'
      # @doc = Nokogiri::HTML(open("https://www.barcodable.com/upc/043695071238"))

      # this is my own API, uploaded to buddyweb server where we find company info
      @data2 = Curl::Easy.perform("https://api.jsonbin.io/b/5f75219265b18913fc577100")
      @req2 = JSON.parse(@data2)

      if @req['item'] && @req['item']['company_name']
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
        @company_csr = @found_company['csr']

        @company_environment = @found_company['environment']
        @company_politics  = @found_company['political']

        @company_lgbt = @found_company['lgbt']
        @company_details = @found_company['politicsdetails'].split(',') if @found_company['politicsdetails']
        @company_green = @found_company['greendetails'].split(',') if @found_company['greendetails']

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
