class MovesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_move, except: [:index, :new, :create]
    
    def index
        @moves = Move.where(user_id: current_user.id).order(created_at: :DESC)
    end
    
    def show
        @boxes = Box.where(move_id: @move.id).order("created_at DESC")
        @box_count = @boxes.count
    end
    
    #view for the create method
    def new
        @move = current_user.moves.build
    end
    
    def create
        @move = current_user.moves.build(move_params)
        
        if @move.save
            redirect_to @move, notice: "Successfully created move '#{@move.name}'"
        else
            render 'new'
        end
    end
    
    #view for update method
    def edit
    end
    
    def update
        if @move.update(move_params)
            redirect_to @move, notice: "Successfully updated move"
        else
            render 'edit'
        end
    end
    
    def destroy
        @move = Move.find(params[:id])
        @move.destroy
        redirect_to root_path, notice: "Successfully deleted move"
    end
    
    private
    
    def set_move
        @move = Move.find(params[:id])
    end
    
    def move_params
        params.require(:move).permit(:name, :from, :to)
    end
    
end
