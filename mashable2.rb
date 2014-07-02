require 'httparty'
require 'sinatra'


class Mashable2

  def response
    @response ||= HTTParty.get('http://localhost/stories.json')
  end


  def get_new_titles
    battlestar = response.parsed_response
    new_articles = battlestar['new']

    puts "\nNew articles: "
    new_articles.each do |raider|
      puts raider['title']
    end
  end


  def get_rising_titles
    battlestar = response.parsed_response
    rising_articles = battlestar['rising']

    puts "\nRising articles: "
    rising_articles.each do |viper|
      puts viper['title']
    end
  end


  def get_hot_titles( test_array )
    battlestar = response.parsed_response
    hot_articles = battlestar['hot']

    puts "\nHot articles: "
    hot_articles.each do |raptor|
      test_array << raptor['title']
    end
  end


end # end class mash2

mashable_object = Mashable2.new

puts "\nFetching Mashable.com data...."
mashable_object.response
puts "Done getting Mashable.com data.\n"

# puts "\nGetting title"
# mashable_object.get_title

test_array = []
mashable_object.get_hot_titles( test_array )

get '/mashable' do
  "This is mashable"
  "#{test_array}"
end
