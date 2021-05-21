class ReservationsController < ApplicationController
  
  def index
    @room = Room.all.includes(:reservations)
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.new
    
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @use_days = (@end_date.to_date - @start_date.to_date).to_s.chomp('/1')
    @person_num= params[:person_num]
    @total_price = @room.price.to_i * @use_days.to_i * @person_num.to_i
  end
  
  def create
    @room = Room.new
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
    
  end
  
  private
  
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_price, :user_id, :room_id)
    end
    
end
