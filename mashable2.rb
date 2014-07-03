require 'httparty'
require 'sinatra'


class Mashable2

  def response 
    @response ||= HTTParty.get('http://localhost/stories.json')
  end


  def get_all_data
    temp_array = []
    temp_hash ={}
    hash = response.parsed_response
#    hash = JSON.parse(response)
    array = hash['hot']

    array.each do |article|
#      puts viper[0] # prints new,rising,hot,channel
      puts article['title']
      puts article['responsive_images'][2]['size'] # this will return 80x80#
      temp_hash = { "#{article['title']}" => "#{article['responsive_images'][2]['image']}" }
      temp_array << temp_hash
      # temp_array << article['title']
      # temp_array << article['responsive_images'][2]['image']
      puts "temp_array.length = #{temp_array.length}"
    end # end of EACH-DO 
    return temp_array
  end # end of get_all_data function 

end # end class mash2

mashable_object = Mashable2.new

puts "\nFetching Mashable.com data...."
mashable_object.response
puts "Done getting Mashable.com data.\n"

# rising_array = []
# mashable_object.get_rising_titles( rising_array )

# rising_array = []
# puts "rising_arrayA = #{rising_array}"
title_picture_array = mashable_object.get_all_data
# puts "rising_arrayB = #{rising_array}"

get '/mashable' do
  @my_hash = title_picture_array
  erb :mash_view
end
