# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tag_names={"Active Life"=>"active",
 "Arts & Entertainment"=>"arts",
 "Automotive"=>"auto",
 "Beauty & Spas"=>"beautysvc",
 "Bicycles"=>"bicycles",
 "Education"=>"education",
 "Event Planning & Services"=>"eventservices",
 "Financial Services"=>"financialservices",
 "Food"=>"food",
 "Health & Medical"=>"health",
 "Home Services"=>"homeservices",
 "Hotels & Travel"=>"hotelstravel",
 "Local Flavor"=>"localflavor",
 "Local Services"=>"localservices",
 "Mass Media"=>"massmedia",
 "Nightlife"=>"nightlife",
 "Pets"=>"pets",
 "Professional Services"=>"professional",
 "Public Services & Government"=>"publicservicesgovt",
 "Real Estate"=>"realestate",
 "Religious Organizations"=>"religiousorgs",
 "Restaurants"=>"restaurants",
 "Shopping"=>"shopping"}

 tag_names.each |k, v|
  Tag.create(name: k, alias: v)
end
