class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    private
    def current_player
        Player.where(id: session[:player_id]).first
    end
    helper_method :current_player
end
