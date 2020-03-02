class GreetingsController < ApplicationController
  def index
    @greeting = "Hello world message rendered from #{ENV['AUTHOR']} by host #{Socket.gethostname}"
  end
end
