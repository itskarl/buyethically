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
      @data2 = Curl::Easy.perform("https://bridge.buddyweb.fr/api/companyrating/main")
      @req2 = JSON.parse(`{[{"company":"No Info","political":3,"environment":null,"csr":0,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Agri-Mark","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Agropur Coorperative","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"American Crystal Sugar Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"American Food Groups Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"American International Industries","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Amway Ada","political":3,"environment":null,"csr":51,"lgbt":null,"environmentmath":null,"score":51,"politicsdetails":null,"greendetails":"Tests products on animals"},{"company":"Anheuser-Busch InBev","political":1.3,"environment":1,"csr":50,"lgbt":100,"environmentmath":20,"score":57,"politicsdetails":"Supports Planned Parenthood, Supports Common Core, Supports Sanctuary Cities, Supports Repeal of Stand Your Ground Laws","greendetails":"Poor packaging practices. Conflict mineral mining"},{"company":"Arbonne","political":3,"environment":null,"csr":45,"lgbt":null,"environmentmath":null,"score":45,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Associated British Foods","political":3,"environment":1,"csr":79,"lgbt":null,"environmentmath":20,"score":51,"politicsdetails":null,"greendetails":"Poor worker rights conditions in India. Poor ratings in conserving energy, Poor water conditions"},{"company":"Associated Milk Producers","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Avon","political":1.7,"environment":3,"csr":85,"lgbt":100,"environmentmath":60,"score":82,"politicsdetails":"Part of Coalition to Stop Gun Violence, Supports Carbon Tax","greendetails":"Tests products on animals, Unethical palm oil sourcing, Little to no conservation efforts"},{"company":"B&G Foods","political":3,"environment":null,"csr":48,"lgbt":null,"environmentmath":null,"score":48,"politicsdetails":null,"greendetails":null},{"company":"Beam Suntory Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Bimbo Bakeries USA","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Blyth","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Bonduelle NA","political":3,"environment":null,"csr":78,"lgbt":null,"environmentmath":null,"score":78,"politicsdetails":null,"greendetails":null},{"company":"Borden Dairy Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Boston Beer Co.","political":3,"environment":2,"csr":36,"lgbt":null,"environmentmath":40,"score":38,"politicsdetails":null,"greendetails":"Poor packaging practices"},{"company":"Brown-Forman Corp","political":2.1,"environment":3,"csr":74,"lgbt":100,"environmentmath":60,"score":78,"politicsdetails":"Supports Climate Control, Supports Cap and Trade","greendetails":"Poor water conservation practices"},{"company":"Cal Maine Foods","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"California Dairies Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Campbell Soup Co.","political":2.6,"environment":3,"csr":94,"lgbt":100,"environmentmath":60,"score":85,"politicsdetails":"Supports Paris Agreement, Supports pro-life group Salvation Army, Supports Common Core","greendetails":"Unethical palm oil practices"},{"company":"Cargill Inc.","political":1.7,"environment":1,"csr":87,"lgbt":100,"environmentmath":20,"score":69,"politicsdetails":"Supports Carbon Tax, Supports Planned Parenthood, Supports Sanctuary Cities","greendetails":"Amazon deforestration due to soy, Human rights abuses in cotton farms, Promotes GMO in food chain, Labor abuse in Malaysia, Child labor violations"},{"company":"Chattem","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Chobani Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Church & Dwight","political":3,"environment":1,"csr":56,"lgbt":null,"environmentmath":20,"score":38,"politicsdetails":null,"greendetails":"Tests products on animals"},{"company":"Clorox","political":2.6,"environment":1,"csr":93,"lgbt":100,"environmentmath":20,"score":71,"politicsdetails":"Supports pro-life group Salvation Army, Supports Planned Parenthood","greendetails":"Tests products on animals, Unethical palm oil practices"},{"company":"Coca-Cola Co.","political":1,"environment":1,"csr":98,"lgbt":100,"environmentmath":20,"score":73,"politicsdetails":"Supports repeal of Stand Your Ground laws, Supports common core, Against conceal and carry, Supported Paris Climate Deal, Supports Planned Parenthood and Girls Inc, Supports Sanctuary Cities","greendetails":"Human rights abuses, Groundwater contamination, Child labor violations, Nanoparticles in food products"},{"company":"Colgate-Palmolive","political":1.9,"environment":3,"csr":93,"lgbt":100,"environmentmath":60,"score":84,"politicsdetails":"Supports Cap & Trade, Pro Choice, ","greendetails":"Tests products on animals, Unethical palm oil practices, Unethical supply chain practices"},{"company":"Combe","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Conagra Brands Inc.","political":2.3,"environment":null,"csr":80,"lgbt":100,"environmentmath":null,"score":90,"politicsdetails":"Supports Planned Parenthood, Supports Sanctuary Cities","greendetails":null},{"company":"Constellation Brands","political":3,"environment":1,"csr":43,"lgbt":100,"environmentmath":20,"score":54,"politicsdetails":null,"greendetails":"Poor water practices"},{"company":"Cott Corp.","political":3,"environment":null,"csr":1,"lgbt":null,"environmentmath":null,"score":1,"politicsdetails":null,"greendetails":null},{"company":"Coty","political":3,"environment":1,"csr":8,"lgbt":null,"environmentmath":20,"score":14,"politicsdetails":null,"greendetails":"Tests products on animals, Unethical palm oil practices"},{"company":"CROPP Cooperative\/Organic Valley","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Dairy Farmers of America","political":3,"environment":null,"csr":73,"lgbt":null,"environmentmath":null,"score":73,"politicsdetails":null,"greendetails":null},{"company":"Danone North America","political":3,"environment":null,"csr":97,"lgbt":null,"environmentmath":null,"score":97,"politicsdetails":null,"greendetails":null},{"company":"Darigold","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Dean Foods Co.","political":3,"environment":null,"csr":78,"lgbt":40,"environmentmath":null,"score":59,"politicsdetails":null,"greendetails":null},{"company":"Del Monte Pacific Ltd.","political":2.7,"environment":1,"csr":50,"lgbt":null,"environmentmath":20,"score":35,"politicsdetails":"Supports Planned Parenthood","greendetails":"Violates worker rights, Child labor, Poor water management"},{"company":"Dermalogica","political":3,"environment":4,"csr":50,"lgbt":null,"environmentmath":80,"score":65,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Dr Pepper Snapple Group","political":3,"environment":1,"csr":87,"lgbt":65,"environmentmath":20,"score":57,"politicsdetails":null,"greendetails":"Poor packaging practices, Poor water management"},{"company":"E&J Gallo Winery","political":3,"environment":null,"csr":50,"lgbt":100,"environmentmath":null,"score":75,"politicsdetails":null,"greendetails":null},{"company":"Ecolab","political":3,"environment":null,"csr":90,"lgbt":100,"environmentmath":null,"score":95,"politicsdetails":null,"greendetails":null},{"company":"Elizabeth Arden","political":3,"environment":1,"csr":21,"lgbt":null,"environmentmath":20,"score":20,"politicsdetails":null,"greendetails":"Tests products on animals"},{"company":"Energizer","political":2.3,"environment":2,"csr":19,"lgbt":null,"environmentmath":40,"score":30,"politicsdetails":"Supports repeal of Stand Your Ground laws, Contributes to National Wildlife Federation, Contributes to The Nature Conservancy, Supports Planned Parenthood","greendetails":"Cadmium poisoning"},{"company":"Est\u00e9e Lauder","political":2.1,"environment":1,"csr":87,"lgbt":null,"environmentmath":20,"score":54,"politicsdetails":"Pro choice organization","greendetails":"Tests products on animals, Uses microbeads in products, Unethical palm oil practices, Conflict minerals"},{"company":"Ferrero USA","political":3,"environment":3,"csr":50,"lgbt":null,"environmentmath":60,"score":55,"politicsdetails":null,"greendetails":"Nanoparticles in food products"},{"company":"Flowers Foods Inc.","political":3,"environment":null,"csr":24,"lgbt":null,"environmentmath":null,"score":24,"politicsdetails":null,"greendetails":null},{"company":"Foremost Farms USA","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Foster Farms LLC","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"General Mills","political":1.3,"environment":3,"csr":91,"lgbt":100,"environmentmath":60,"score":84,"politicsdetails":"Supports repeal of Stand Your Ground Laws, Support Paris Climate Deal, Pro-Life Organization, Supports Common Core, ","greendetails":"Nanoparticles in food products, Deceptive health claims"},{"company":"Gilster-Mary Lee Corp.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Glanbia USA","political":3,"environment":2,"csr":25,"lgbt":null,"environmentmath":40,"score":32,"politicsdetails":null,"greendetails":"Supports greyhound racing"},{"company":"Gojo","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Golden State Foods","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Gorton's Seafood","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Grassland Dairy","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Great Lakes Cheese Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Guthy-Renker","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"H.P. Hood Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Hain Celestial","political":3,"environment":3,"csr":49,"lgbt":100,"environmentmath":60,"score":70,"politicsdetails":null,"greendetails":"Cruelty-free products, Water risk management"},{"company":"Hearthside Food Solutions LLC","political":3,"environment":null,"csr":50,"lgbt":100,"environmentmath":null,"score":75,"politicsdetails":null,"greendetails":null},{"company":"Helen of Troy","political":3,"environment":null,"csr":11,"lgbt":null,"environmentmath":null,"score":11,"politicsdetails":null,"greendetails":null},{"company":"Herbalife","political":3,"environment":null,"csr":9,"lgbt":null,"environmentmath":null,"score":9,"politicsdetails":null,"greendetails":null},{"company":"Hershey Co.","political":2,"environment":3,"csr":80,"lgbt":100,"environmentmath":60,"score":80,"politicsdetails":null,"greendetails":"Human rights violations, Nanoparticles in food products, Water risk management"},{"company":"High Ridge","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Hilmar Cheese Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Hormel Foods Group","political":3,"environment":1,"csr":77,"lgbt":100,"environmentmath":20,"score":66,"politicsdetails":null,"greendetails":"BPA Use, Unethical water practices"},{"company":"Hostess Brands Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Hydroxatone","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Inter Parfums","political":3,"environment":null,"csr":19,"lgbt":null,"environmentmath":null,"score":19,"politicsdetails":null,"greendetails":null},{"company":"J.M. Smucker Co.","political":3.6,"environment":null,"csr":46,"lgbt":90,"environmentmath":null,"score":68,"politicsdetails":null,"greendetails":null},{"company":"J.R. Simplot Co.","political":3,"environment":2,"csr":50,"lgbt":null,"environmentmath":40,"score":45,"politicsdetails":null,"greendetails":"Water pollution in China"},{"company":"J&J Snack Foods","political":3,"environment":null,"csr":20,"lgbt":null,"environmentmath":null,"score":20,"politicsdetails":null,"greendetails":null},{"company":"Jafra","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Jarden","political":3,"environment":1,"csr":36,"lgbt":null,"environmentmath":20,"score":28,"politicsdetails":null,"greendetails":"Conflict minerals, Little to no conservation efforts"},{"company":"JBS USA ","political":3,"environment":1,"csr":30,"lgbt":null,"environmentmath":20,"score":25,"politicsdetails":null,"greendetails":"Deforestation and slave labor, Water pollution, Poor water practices "},{"company":"John Paul Mitchell Systems","political":3,"environment":4,"csr":50,"lgbt":null,"environmentmath":80,"score":65,"politicsdetails":null,"greendetails":null},{"company":"Johnson & Johnson","political":1,"environment":1,"csr":97,"lgbt":100,"environmentmath":20,"score":72,"politicsdetails":"Opposed conceal and carry, Supports Carbon tax, Supports cap and trade, Supports planned parenthood, Supports Common Core, Supports sanctuary cities","greendetails":"Tests products on animals, Poor palm oil practices, Fined for talc dangers, Healthcare fraud, Risperdal lawsuits, Unethical supply chains"},{"company":"Kellogg Co.","political":1.3,"environment":3,"csr":91,"lgbt":100,"environmentmath":60,"score":84,"politicsdetails":"Supports repeal of Stand Your Ground Laws, Supports Paris Climate Change, Supports Planned Parenthood, Supports Common Core, Supports Sanctuary Cities","greendetails":"Nanoparticles in Pop Tarts, False advertising, Unethical palm oil sourcing"},{"company":"Keystone Foods","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Koch Foods Inc.","political":1.6,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":"Supports repeal of Stand Your Ground Laws, Supports Common Core, Supports Sanctuary Cityies","greendetails":null},{"company":"Kraft Heinz Co.","political":1.7,"environment":1,"csr":50,"lgbt":90,"environmentmath":20,"score":53,"politicsdetails":"Supports repeal of Stand Your Ground Laws, Supports Cap and Trade, Supports Carbon Tax, Supports Planned Parenthood, Supports Religious Liberty Laws, Supports Common Core, Supports Sanctuary Cities","greendetails":"Unethical palm oil sourcing, Nanoparticles in food"},{"company":"L Brands","political":3,"environment":null,"csr":54,"lgbt":100,"environmentmath":null,"score":77,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Lactalis American Group","political":3,"environment":1,"csr":50,"lgbt":null,"environmentmath":20,"score":35,"politicsdetails":null,"greendetails":"Deforestation, Poor nutrition data, Poor animal treatment, Unethical palm oil sourcing, Irresponsible marketing"},{"company":"Lancaster Colony Corp.","political":3,"environment":null,"csr":38,"lgbt":null,"environmentmath":null,"score":38,"politicsdetails":null,"greendetails":null},{"company":"Land O'Lakes Inc.","political":3,"environment":null,"csr":76,"lgbt":100,"environmentmath":null,"score":88,"politicsdetails":null,"greendetails":null},{"company":"Leprino Foods Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Lindt & Sprungli","political":3,"environment":3,"csr":62,"lgbt":null,"environmentmath":60,"score":61,"politicsdetails":null,"greendetails":"Nanoparticles in food products"},{"company":"Maple Leaf Foods","political":3,"environment":null,"csr":45,"lgbt":null,"environmentmath":null,"score":45,"politicsdetails":null,"greendetails":null},{"company":"Markwins","political":3,"environment":4,"csr":50,"lgbt":null,"environmentmath":80,"score":65,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Mars Inc.","political":2.1,"environment":1,"csr":62,"lgbt":90,"environmentmath":20,"score":57,"politicsdetails":"Supports Paris Climate Deal, Supports Planne Parenthood, Supports sanctuary cities","greendetails":"Tuna sourcing for cat food, Animal Testing, Poor farm animal welfare, Nanoparticles in MMs"},{"company":"Mary Kay","political":2.6,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":"Part of the Coalition to End Gun Violence","greendetails":"Cruelty-free products"},{"company":"McCain Foods Inc.","political":3,"environment":null,"csr":85,"lgbt":null,"environmentmath":null,"score":85,"politicsdetails":null,"greendetails":null},{"company":"McCormick and Co. Inc.","political":3,"environment":1,"csr":73,"lgbt":75,"environmentmath":20,"score":56,"politicsdetails":null,"greendetails":"BPA use, Poor water practices"},{"company":"McKee Foods Corp.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Merck","political":2.6,"environment":null,"csr":96,"lgbt":100,"environmentmath":null,"score":98,"politicsdetails":"Corporate Partner of the National Gay and Lesbian Chamber of Commerce, Supports Planned Parenthood","greendetails":"Tests products on animals"},{"company":"Molson Coors Co.D","political":3,"environment":1,"csr":82,"lgbt":null,"environmentmath":20,"score":51,"politicsdetails":null,"greendetails":"Poor recycling practices"},{"company":"Mondelez International","political":1.6,"environment":null,"csr":50,"lgbt":100,"environmentmath":null,"score":75,"politicsdetails":"Supports repeal of Stand Your Ground Laws, Supports Carbon Tax and Paris Climate Deal, GLAAD corporate partner, Supports Common Core, Supports Planned Parenthood","greendetails":null},{"company":"Monogram Foods LLC","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Murad","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"National Beef Packing Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"National Beverage Corp.","political":3,"environment":1,"csr":7,"lgbt":null,"environmentmath":20,"score":14,"politicsdetails":null,"greendetails":"Poor recycling practices"},{"company":"Nerium","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Nestle","political":2.4,"environment":1,"csr":95,"lgbt":95,"environmentmath":20,"score":70,"politicsdetails":"Support Paris Climate Deal, Supports Planned Parenthood","greendetails":"Unethical water control practices in NA, Irresponsible marketing, Human rights violation, Slave labor in Brazil, Animal Testing, Unethical palm oil sourcing, Child labor, nanoparticles in food and baby formula, Price fixing"},{"company":"Nu Skin","political":3,"environment":null,"csr":24,"lgbt":null,"environmentmath":null,"score":24,"politicsdetails":null,"greendetails":"Tests products on animals"},{"company":"OSI Group","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"PepsiCo Inc.","political":1.3,"environment":1,"csr":91,"lgbt":100,"environmentmath":20,"score":70,"politicsdetails":"Opposes conceal and carry laws, Supports Carbon Tax, Sponsor of the National Gay and Lesbian Chamber of Commerce, Supports Common Core, Supports Sanctuary Cities","greendetails":"Unethical palm oil sourcing, Worker exploitation in Indonesia, Promotion of bottled water, Global Exchange's top 10 Corporate Criminals, Racial discrimination, Nanoparticles in food, Unethical water use in India"},{"company":"Perdue Fams","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Perfumania","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Pilgrim\u2019s Pride","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Pinnacle Foods","political":3,"environment":1,"csr":50,"lgbt":null,"environmentmath":20,"score":35,"politicsdetails":null,"greendetails":"Unethical Animal Practices, Nanoparticles in food"},{"company":"Post Holdings Inc.","political":3,"environment":null,"csr":44,"lgbt":null,"environmentmath":null,"score":44,"politicsdetails":null,"greendetails":null},{"company":"Prarie Farms Dairy Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Premium Brands Holdings Corp.","political":3,"environment":null,"csr":null,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Prestige Brands","political":3,"environment":null,"csr":51,"lgbt":null,"environmentmath":null,"score":51,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Procter & Gamble","political":2.3,"environment":1,"csr":91,"lgbt":100,"environmentmath":20,"score":70,"politicsdetails":"Supports Sanctuary Cities, Supports Planned Parenthood, Supports 2nd Amendment Rights, Supports Paris Climate Deal, Supports Cap and Trade","greendetails":"Tests products on animals, Labor abuses in Malaysia, Unethical palm oil sourcing, Nanoparticles in cosmetics, Price fixing in Europe"},{"company":"Reser's Fine Foods","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Revlon","political":3,"environment":1,"csr":12,"lgbt":null,"environmentmath":20,"score":16,"politicsdetails":null,"greendetails":"Tests products on animals, Unethical palm oil sourcing, Nanoparticles in cosmetics, Microbeads in products"},{"company":"Rich Products Corp.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Sanderson Farms","political":3,"environment":null,"csr":41,"lgbt":55,"environmentmath":null,"score":48,"politicsdetails":null,"greendetails":null},{"company":"Saputo Inc.","political":3,"environment":null,"csr":53,"lgbt":null,"environmentmath":null,"score":53,"politicsdetails":null,"greendetails":null},{"company":"Sargento Foods Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"SC Johnson","political":2.1,"environment":2,"csr":98,"lgbt":100,"environmentmath":40,"score":79,"politicsdetails":"Supports Cap and Trade, Supports Carbon Tax","greendetails":"Tests products on animals, Nanoparticles in products"},{"company":"Scentsy","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Schreiber Foods Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Schwan\u2019s Co.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Seaboard Corp.","political":3,"environment":null,"csr":35,"lgbt":20,"environmentmath":null,"score":28,"politicsdetails":null,"greendetails":null},{"company":"Sealed Air Diversey Care","political":3,"environment":null,"csr":60,"lgbt":20,"environmentmath":null,"score":40,"politicsdetails":null,"greendetails":null},{"company":"Seneca Foods Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Seventh Generation","political":3,"environment":3,"csr":50,"lgbt":null,"environmentmath":60,"score":55,"politicsdetails":null,"greendetails":"Cruelty-free products"},{"company":"Smithfield Foods Inc.","political":3,"environment":null,"csr":68,"lgbt":null,"environmentmath":null,"score":68,"politicsdetails":null,"greendetails":null},{"company":"Spartan","political":3,"environment":null,"csr":57,"lgbt":75,"environmentmath":null,"score":66,"politicsdetails":null,"greendetails":null},{"company":"State Industrial","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"SugarCreek","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Sun Products","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"TreeHouse Foods Inc.","political":3,"environment":null,"csr":57,"lgbt":null,"environmentmath":null,"score":57,"politicsdetails":null,"greendetails":null},{"company":"Triumph Foods","political":3,"environment":null,"csr":36,"lgbt":null,"environmentmath":null,"score":36,"politicsdetails":null,"greendetails":null},{"company":"Tupperware","political":3,"environment":null,"csr":58,"lgbt":null,"environmentmath":null,"score":58,"politicsdetails":null,"greendetails":null},{"company":"Turtle Wax","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Tyson Foods Inc.","political":2.1,"environment":null,"csr":42,"lgbt":100,"environmentmath":null,"score":71,"politicsdetails":"Supports Sanctuary Cities","greendetails":null},{"company":"Unilever U.S.","political":1.9,"environment":3,"csr":97,"lgbt":100,"environmentmath":60,"score":86,"politicsdetails":"Supports Carbon Tax, Supports Cap and Trade, Supports Planned Parenthood","greendetails":"Worker exploitation in Kenya and India, Mercury poisoning in India, Conflict minerals, Animal testing, Unethical palm oil sourcing, Child labor practices, Price fixing in Europe"},{"company":"Wayne Farms LLC","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"WD-40","political":1.6,"environment":null,"csr":29,"lgbt":null,"environmentmath":null,"score":29,"politicsdetails":"Opposes conceal and carry, Supports Cap and Trade, Contributes to Planned Parenthood, Supports Sanctuary Cities","greendetails":null},{"company":"Wells Enteprises Inc.","political":3,"environment":null,"csr":50,"lgbt":null,"environmentmath":null,"score":50,"politicsdetails":null,"greendetails":null},{"company":"Weston Foods","political":3,"environment":1,"csr":62,"lgbt":null,"environmentmath":20,"score":41,"politicsdetails":null,"greendetails":null},{"company":"Zep Inc.","political":3,"environment":null,"csr":86,"lgbt":null,"environmentmath":null,"score":86,"politicsdetails":null,"greendetails":null},{"company":"Green Mountain Coffee Roasters","political":3,"environment":3,"csr":79,"lgbt":95,"environmentmath":60,"score":78,"politicsdetails":null,"greendetails":"Poor water practices"},{"company":"Keurig","political":3,"environment":3,"csr":79,"lgbt":95,"environmentmath":60,"score":78,"politicsdetails":null,"greendetails":"Poor water practices"},{"company":"Nabisco","political":3,"environment":3,"csr":79,"lgbt":95,"environmentmath":60,"score":78,"politicsdetails":null,"greendetails":"Poor water practices"},{"company":"Lipton","political":3,"environment":3,"csr":79,"lgbt":95,"environmentmath":60,"score":78,"politicsdetails":null,"greendetails":"Poor water practices"},{"company":"Frito-Lay Company","political":1.3,"environment":1,"csr":91,"lgbt":100,"environmentmath":20,"score":70,"politicsdetails":"Opposes conceal and carry laws, Supports Carbon Tax, Sponsor of the National Gay and Lesbian Chamber of Commerce, Supports Common Core, Supports Sanctuary Cities","greendetails":"Unethical palm oil sourcing, Worker exploitation in Indonesia, Promotion of bottled water, Global Exchange's top 10 Corporate Criminals, Racial discrimination, Nanoparticles in food, Unethical water use in India"},{"company":"Kimberly-Clark ","political":3,"environment":2,"csr":85,"lgbt":100,"environmentmath":40,"score":75,"politicsdetails":null,"greendetails":"Conflict Minerals"}]}`)

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
