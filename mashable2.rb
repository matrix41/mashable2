require 'httparty'

class Mashable2

  def response
    @response ||= HTTParty.get('http://localhost/stories.json')
  end

  def get_title
    battlestar = response.parsed_response

    battlestar.each do |viper|
      puts viper
    end

  end

end # end class mash2

mashable_object = Mashable2.new

puts "\nFetching Mashable.com data...."
mashable_object.response
puts "Done getting Mashable.com data.\n"

puts "\nGetting title"
mashable_object.get_title
