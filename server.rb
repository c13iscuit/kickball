require 'sinatra'
require 'pry'

get "/" do
  erb :index
end


get '/:params' do
  require 'csv'

  def kickball(roster)
    @kickball_array = []
    CSV.foreach(roster, headers: true) do |row|
      kickball_hash = {}
      kickball_hash[:first]= row["first_name"]
      kickball_hash[:last]= row["last_name"]
      kickball_hash[:position]= row["position"]
      kickball_hash[:team]= row["team"]
      @kickball_array << kickball_hash
    end
  end
  kickball('lackp_starting_rosters.csv')
  erb :show

  #require 'csv'
 #
end
