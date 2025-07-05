class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    
        render json: @movies
    end

    def show 
        @movie = Movie.find(params[:id])
        @comments = @movie.comments
        @ratings = @movie.ratings

        render json: {
            movie: @movie,
            comments: @comments,
            ratings: @ratings
        }
    end

    def create_comment
        @movie = Movie.find(params[:id])
        @comment = @movie.comments.new(comment_params)

        if @comment.save
            render json: @comment
        else
            render json: @comment.errors
        end
    end

    def create_rating
        @movie = Movie.find(params[:id])
        @rating = @movie.ratings.new(rating_params)
        
        if @rating.save
            render json: @rating
        else
            render json: @rating.errors
        end
    end


    private 
    def comment_params
        params.permit(:user_id, :comment)
    end

    def rating_params
        params.permit(:user_id, :rating)
    end
end
