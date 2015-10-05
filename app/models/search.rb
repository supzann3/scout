class Search < ActiveRecord::Base

  def self.for(keyword)
    word_match = FuzzyStringMatch::JaroWinkler.create( :pure )
    @all = Itinerary.all
    @results = []
    @all.each do |itinerary|
     if word_match.getDistance(itinerary.name.downcase, keyword.downcase) > 0.55
       @results << [itinerary.name, itinerary.id]
     end
   end
   @results
  end

end
