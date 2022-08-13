class MoviesController < ApplicationController
    def index
        @movies = Movie.released
    end
    def show
        @movie = Movie.find(params[:id])
    end
    def edit
        @movie = Movie.find(params[:id])
      end
    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            redirect_to @movie, notice: "Movie successfully updated!"
        else
            render :edit, status: 422
        end
    end
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_url, status: :see_other, alert: "Movie successfully deleted!"
    end
    def new
        @movie = Movie.new
    end
    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie, notice: "Movie successfully created!"
        else
            render :new, status: 422
        end
    end

    private def movie_params
        params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration, :image_file_name)
    end
end


