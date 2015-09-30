require 'json'
require 'pry'

yelp_json=File.read('categories.json')
yelp_hash=JSON.parse(yelp_json)

parse_alias=[]
yelp_hash.each do |alia|
  if alia["parents"][0]==nil
  parse_alias<<alia["alias"]
  end
end

titles=[]
yelp_hash.each do |title|
  if title["parents"][0]==nil
    titles<<title["title"]
  end
end
zipped=titles.zip(parse_alias)
tag_names=Hash[zipped]
