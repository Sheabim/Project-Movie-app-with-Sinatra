require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

#@title is an instance variable and title is a local variable 

get '/' do
  erb :index
end


#about
get '/about' do
erb :about

end


get '/movie' do 

	@url = "http://omdbapi.com/?apikey=2f6435d9&t=" + params[:movie_title] # always like that
	@movie_search.parsed_response #METHOD OF HTTPPARTY
	@movie_search.Title = @url["Title"]
	@movie_search.Year = @url["Year "]
	@movie_search.Runtime =  @urlc["Runtime "]
    @movie_search.Director =  @url["Director "]
	@movie_search.Poster =  @url["Poster "]


# conn = PG.connect(dbname: 'localmovie')
# sql = "SELECT * FROM local_movie"
# conn.exec(sql)
# conn.close
                         #KEY           #VALUE
    if LocalMovie.where(title: params[:movie_title]).empty? # OR === 0

    	return 'ask omdb'

		else

    end




	# @url = "http://omdbapi.com/?apikey=2f6435d9&t=" + params[:movie_title]
	# @movie_search.Title = @url["Title"]
	# @movie_search.Year = @url["Year "]
	# @movie_search.Runtime =  @urlc["Runtime "]
 #    @movie_search.Director =  @url["Director "]
	# @movie_search.Poster =  @url["Poster "]


# conn = PG.connect(dbname: 'localmovie')
# sql = "INSERT INTO local_movie(Title,Year, Runtime, Genre, Director, Poster) VALUES('#{@movie_search.movie_Title}','#{@movie_search.movie_Year}', '#{@movie_search.movie_Runtime}','#{@movie_search.movie_Director}','#{@movie_search.movie_Name}', '#{@movie_search.movie_Poster}')";
#     conn.exec(sql)
# 	conn.close

else

	# @movie_search.Title = @url["Title"]
	# @movie_search.Year = @url["Year "]
	# @movie_search.Runtime =  @urlc["Runtime "]
 #    @movie_search.Director =  @url["Director "]
	# @movie_search.Poster =  @url["Poster "]



 end

erb :movie

end



get '/options' do

	@url = "http://omdbapi.com/?apikey=2f6435d9&s=" + params[:movie_title]
	@movie_search = HTTParty.get(@url) 

erb :options

end

