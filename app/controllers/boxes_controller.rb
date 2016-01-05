class BoxesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_move_new, only: [:new, :create]
    before_action :set_move_update, only: [:show, :edit, :update, :destroy]
    before_action :set_box, only: [:show, :edit, :update, :destroy]
    
    def show
        @items = Item.where(box_id: @box.id).order("created_at DESC")
        @item_count = @items.count
        
        qr_string = url_for(@box)
        @qrcode_icon = RQRCode::QRCode.new(qr_string).to_img.resize(30,30).to_data_url
    end
    
    def new
        @box = @move.boxes.build
    end
    
    def create
        @box = @move.boxes.build(box_params)
        
        @box.user_id = current_user.id
        
        if @box.save
            redirect_to @move, notice: "Successfully created box '#{@box.name}'"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @box.update_attributes(box_params)
            redirect_to @move, notice: "Successfully updated box '#{@box.name}'"
        else
            render 'edit'
        end
    end
    
    def destroy
        @box.destroy
        redirect_to @move
    end
    
    private
    
    def set_move_new
        @move = Move.find(params[:move_id])
    end
    
    def set_move_update
        @box = Box.find(params[:id])
        @move_id = @box.move_id
        @move = Move.find(@move_id)
    end
    
    def set_box
        @box = Box.find(params[:id])
    end
    
    def box_params
        params.require(:box).permit(:name)
    end
end
