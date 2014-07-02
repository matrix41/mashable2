require 'httparty'

class Mashable2

  def response
    @response ||= HTTParty.get('http://localhost/stories.json')
  end

  def get_title
    battlestar = response.parsed_response

    new_articles = battlestar['new']
    rising_articles = battlestar['rising']
    hot_articles = battlestar['hot']

    new_articles.each do |raider|
      puts raider['title']
    end

    rising_articles.each do |viper|
      puts viper['title']
    end

    hot_articles.each do |raptor|
    	puts raptor['title']
    end


  end

end # end class mash2

mashable_object = Mashable2.new

puts "\nFetching Mashable.com data...."
mashable_object.response
puts "Done getting Mashable.com data.\n"

puts "\nGetting title"
mashable_object.get_title
