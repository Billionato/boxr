class MovesController < ApplicationController
    
    def index
        @moves = Move.all
    end
    
    def show
        @move = Move.find(params[:id])
    end
    
    #view for the create method
    def new
        @move = Move.new
    end
    
    def create
        @move = Move.create(move_params)
        if @move.save
            redirect_to @move
        else
            render 'new'
        end
    end
    
    #view for update method
    def edit
        @move = Move.find(params[:id])
    end
    
    def update
        @move = Move.find(params[:id])
        
        if @move.update(move_params)
            redirect_to @move, notice: "Successfully updated move"
        else
            render 'edit'
        end
    end
    
    def destroy
        @move = Move.find(params[:id])
        
        if @move.destroy
            redirect_to root_path
        else
            redirect_to @move
        end
    end
    
    private
    
    def move_params
        params.require(:move).permit(:name, :from, :to)
    end
end
