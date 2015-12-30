class ItemsController < ApplicationController
    
    before_action :set_box_new, only: [:new, :create]
    before_action :set_box_update, only: [:show, :edit, :update, :destroy]
    # before_action :set_move
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.create!(item_params)
        
        @item.box_id = @box.id
        @item.move_id = @box.move_id
        
        if @item.save
            redirect_to @box
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @item.update_attributes(item_params)
            redirect_to @box
        else
            render 'edit'
        end
    end
    
    def destroy
        @item.destroy
        redirect_to @box
    end
    
    private
    
    def set_box_new
        @box = Box.find(params[:box_id])
    end
    
    def set_box_update
        @item = Item.find(params[:id])
        @box_id = @item.box_id
        @box = Box.find(@box_id)
    end
    
    def set_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name)
    end
end
