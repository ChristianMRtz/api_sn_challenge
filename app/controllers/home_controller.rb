class HomeController < ApplicationController
  def index
    render json: { message: 'Welcome to the Social Network API',
                   documentation_url: '/users /posts /comments'}    
  end
end