class YelpApi
  attr_reader :client, :params, :location, :results
  def initialize
    @client = Yelp::Client.new({ consumer_key: ENV["Consumer_Key"],
                consumer_secret: ENV["Consumer_Secret"],
                token: ENV["Token"],
                token_secret: ENV["Token_Secret"]
              })
    set_location
  end

  def set_params(tag)
    a = Tag.find(tag)
    @params = { limit: 1,
                category_filter: a.alias
              }
  end

  def set_location
    @location = "New York"
  end

  def search
    @results = @client.search(@location, @params)
  end
end
