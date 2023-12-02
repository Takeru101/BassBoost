class PickupsController < ApplicationController
    def index
    end
  
    def new
      @pickup = Pickup.new
    end
  
    def show
      @pickup = Pickup.find_by(id: params[:id])
    end
  
    def create
      @pickup = Pickup.new(pickup_params)
      params[:pickup][:question] ? @pickup.question = params[:pickup][:question].join("") : false
      if @pickup.save
          flash[:notice] = "診断が完了しました"
          redirect_to pickup_path(@pickup.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def pickup_params
        params.require(:pickup).permit(:id, question: [])
    end
  end
  
  