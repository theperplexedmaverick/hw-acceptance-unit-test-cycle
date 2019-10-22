require 'rails_helper'
require 'spec_helper'

describe MoviesController, :type => :controller do
    describe 'same director' do
        before :each do
            @movie = double('movie')
        end
        
        it 'movies with same director' do
            @movie.stub(:director).and_return('director')
            Movie.should_receive(:find).and_return(@movie)
            Movie.should_receive(:same_director).and_return(@movie)
            get :same_director, {id: 1}
            response.should render_template('same_director')
        end
        
        it 'no movies with same director' do
            @movie.stub(:director).and_return(nil)
            @movie.stub(:title).and_return('title')
            allow(Movie).to receive(:find).and_return(@movie)
            get :same_director, {id: 1}
            response.should redirect_to(movies_path)
        end
    end
end