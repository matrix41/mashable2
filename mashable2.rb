require 'httparty'
require 'sinatra'


class Mashable2

  def response
    @response ||= HTTParty.get('http://localhost/stories.json')
  end


  def get_new_titles( test_array )
    battlestar = response.parsed_response
    new_articles = battlestar['new']

    puts "\nNew articles: "
    new_articles.each do |raider|
      test_array << raider['title']
    end
  end


  def get_rising_titles( test_array )
    battlestar = response.parsed_response
    rising_articles = battlestar['rising']

    puts "\nRising articles: "
    rising_articles.each do |viper|
      test_array << viper['title']
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

hot_array = []
mashable_object.get_hot_titles( hot_array )

rising_array = []
mashable_object.get_rising_titles( rising_array )

new_array = []
mashable_object.get_new_titles( new_array )
puts new_array

# hot_string = ''
# (0..25).each do |i|
#   hot_string << "#{hot_array[i]}  <br>"
# end
# puts "HOT 222"
# puts hot_string
# puts " "


# new_string = ''
# (0..25).each do |i|
#   new_string << "#{new_array[i]}  <br>"
# end
# puts "NEW 222"
# puts new_string
# puts " "


get '/mashable' do
#  string = "This is mashable\n\n"
#  string += "#{test_array}"
#  string += "\n"
#  @test_string2 = "#{hot_string}"
#  @test_string  = "#{new_string}"
  @my_array = new_array
  erb :mash_view

#  string += "#{test_array[3]}"
#  string += "\n"
end
