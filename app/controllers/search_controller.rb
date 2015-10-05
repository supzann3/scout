class SearchController < ApplicationController
  def index
    @keyword = params["search_key"]
    @search_result = Search.for(@keyword)
  end
end
