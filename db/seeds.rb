# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'rest-client'

puts "Getting TMDB Data"
    def api_key
        ENV["API_KEY"]
    end

    def movie_dataset
        api_data = { key: api_key }
        movies = JSON.parse(HTTP.get("https://api.themoviedb.org/3/movie/popular?api_key=#{api_data[:key]}"))
        movie_array = movies["results"]

        movie_array.each do |m|
            Movie.create(
                adult: m["adult"],
                backdrop_path: m["backdrop_path"],
                original_language: m["original_language"],
                original_title: m["original_title"],
                popularity: m["popularity"],
                poster_path: m["poster_path"],  
                release_date: m["release_date"],
                title: m["title"],
                description: m["overview"],
                video: m["video"]
            )
        end

    end

    movie_dataset()
    puts "Seeding movie data"
