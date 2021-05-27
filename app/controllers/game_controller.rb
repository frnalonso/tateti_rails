class GameController < ApplicationController

 

    def index
        game = Game.all
        render json: game, status:200
    end

    def show
        @game = Game.find(params[:id])
        render(json: @game)
    end

    def create
        game = Game.create(game_params)
        game.table = Array.new(9,"")
        game.lastplay = "U" #Inicializo lastplay para que luego tome valores 'X' o 'O' y verifico el ultimo simbolo.
        if game.save
            render json: game, status:200
        else
            render(json: game.errors.full_message, status:400)
        end
    end

    def update
        game = Game.find(params[:id])
        json = JSON.parse request.body.read
        symbolLocal = json["symbol"]
        positionLocal = json["position"]
        tableLocal = JSON.parse(game.table) #Copia del array que tengo en string.

        
        if game.lastplay == symbolLocal #Verifico el ultimo simbolo que envio el player para que alterne los turnos, en este caso los simbolos 'X' o 'O'.
            return
        else 
            game.lastplay = symbolLocal
        end

        if tableLocal[positionLocal] == "" #Verificamos que este vacío para que se coloque 'X' o 'O', si está ocupado retorna.
            tableLocal[positionLocal] = symbolLocal
        else 
            return 
        end

        game.table = tableLocal
        game.save
        render json: game, status: 200
    end

    
    def game_params

        params.permit(:name)

    end

    def board_params

        params.permit(:symbol,:position)

    end
    
end
