class PlayersController < ApplicationController
    def new
        @player=Player.new
    end

    def playersIndex
        @players=Player.take(Player.count)
    end

    def create
        checkers=[]
        validation=true
        preExistingPlayers=Player.take(Player.count)
        @player=Player.new(player_params)
        checkers.push(@player.has_username)
        checkers.push(@player.has_password)
        checkers.push(@player.username_already_used(preExistingPlayers))

        checkers.each do |check|
            if(check==true)
                validation=false
            end
        end
        if(validation==false)
            @player.destroy
            render 'new'
        else 
            if(@player.save)
                session[:player_id]=@player.id
                redirect_to ("/player")
            end
        end

    end
    def login
        @player=Player.new
    end
    def signIn
        checkers=[]
        validation=true
        preExistingPlayers=Player.take(Player.count)
        @player=Player.new(player_params)
        playerId=""
        checkers.push(@player.has_username)
        checkers.push(@player.has_password)
        checkers.push(@player.username_password_dont_match(preExistingPlayers))
        checkers.each do |check|
            if(check==true)
                validation=false
            else
                if( check!=false)
                    playerId=check
                end
                
            end
        end
        

        if(validation==false)
            render 'login'
        else

            session[:player_id]=playerId
            redirect_to ("/player")
        end
        
        @player.destroy
        
    end
    def destroy
        session[:player_id]=nil
        redirect_to ("/player")
    end
    

    def sendMessage

    end

    private
    def player_params
        params.require(:player).permit(:username,:password)
    end
    
end
