class YelpApi
  attr_reader :client, :params, :location, :results
  def initialize(tags = []
    @client = Yelp::Client.new({ consumer_key: ENV["Consumer_Key"],
                consumer_secret: ENV["Consumer_Secret"],
                token: ENV["Token"],
                token_secret: ENV["Token_Secret"]
              })
    @tags = tags
    set_params
    set_location
  end

  def set_params
    @params = { term: 'food',
                limit: 10,
                category_filter: tags
              }
  end

  def set_location
    @location = "New York"
  end

  def search
    @results = @client.search(@location, @params).businesses
  end
end
