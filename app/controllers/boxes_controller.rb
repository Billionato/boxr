class BoxesController < ApplicationController
    before_action :set_move
    before_action :set_box, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def new
        @box = Box.new
    end
    
    def create
        @box = Box.create!(box_params)
        @box.move_id = @move.id
        
        if @box.save
            redirect_to @move
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @box.update_attributes(box_params)
            redirect_to @move
        else
            render 'edit'
        end
    end
    
    def destroy
        @box.destroy
        redirect_to @move
    end
    
    private
    
    def set_move
        @move = Move.find(params[:move_id])
    end
    
    def set_box
        @box = Box.find(params[:id])
    end
    
    def box_params
        params.require(:box).permit(:name)
    end
end
