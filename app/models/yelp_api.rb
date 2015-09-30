class YelpApi
  attr_reader :client, :params, :location, :results
  def initialize
    @client = Yelp::Client.new({ consumer_key: ENV["Consumer_Key"],
                consumer_secret: ENV["Consumer_Secret"],
                token: ENV["Token"],
                token_secret: ENV["Token_Secret"]
              })
  end

  def set_params(term, tag, sort)
    @params = { term: term,
                sort: sort,
                limit: 10,
                category_filter: tag
              }
  end

  def set_location(latitude,longitude)
    @latitude = latitude
    @longitude = longitude
    @location = {latitude: @latitude, longitude: @longitude}
  end

  def search
    @results = @client.search_by_coordinates(@location, @params).businesses
  end
end
