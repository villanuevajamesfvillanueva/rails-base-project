# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    require "net/http"

    require "net/http"
    def url_exist?(url_string)
        url = URI.parse(url_string)
        req = Net::HTTP.new(url.host, url.port)
        req.use_ssl = (url.scheme == 'https')
        path = url.path if url.path.present?
        res = req.request_head(path || '/')
        res.code != "404" # false if returns 404 - not found
    rescue Errno::ENOENT
        false # false if can't find the server
    end


    @client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_publishable_token,
        secret_token: Rails.application.credentials.iex_secret_token,
        endpoint: 'https://sandbox.iexapis.com/v1'
    )

    # @symbols = @client.ref_data_symbols
    # @symbols.each do |x|
    #     Stock.create(symbol: x.symbol)
    # end

    @stocks = Stock.all
    @stocks.each do |stock|
        url = "https://sandbox.iexapis.com/v1/stock/#{stock.symbol}/company"
        if url_exist?(url)
            stock.update(companyname: @client.company(stock.symbol).company_name)
        end
    end
    
