class RoomsController < ApplicationController
  before_action :set_q, only: [:home, :search]
  
  def home
  end
  
  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = current_user.rooms.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "部屋が作成されました。"
      redirect_to @room
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def search
    @results = @q.result
  end

  private

    def room_params
      params.require(:room).permit(:name, :content, :price, :address, :image)
    end
    
    def set_q
      @q = Room.ransack(params[:q])
    end
end

