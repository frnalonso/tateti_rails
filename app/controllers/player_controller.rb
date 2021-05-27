class PlayerController < ApplicationController

    

    def create

        player = Player.create(user_params)

        if player.id % 2 == 0 #Le asignamos el simbolo a cada jugador de acuerdo al id impar o par.
            player.turn = "X"
        else
            player.turn = "O"
        end

        if player.save
            render(json: player, status: 200)
        else
            render(json: game.errors.full_message, status: 400)
        end
    end

    def user_params

        params.permit(:turn,:id)

    end
end
