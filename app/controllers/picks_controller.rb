class PicksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
      
      def index
        @picks = Pick.all
        search = params[:search]
        @picks = @picks.joins(:user).where("about LIKE ?", "%#{search}%") if search.present?
      end

      def new
        @pick = Pick.new
      end
    
      def create
        pick = Pick.new(pick_params)

        pick.user_id = current_user.id

        if pick.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @pick = Pick.find(params[:id])
        @comments = @pick.comments
        @comment = Comment.new
      end

      def edit
        @pick = Pick.find(params[:id])
      end

      def update
        pick = Pick.find(params[:id])
        if pick.update(pick_params)
          redirect_to :action => "show", :id => pick.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        pick = Pick.find(params[:id])
        pick.destroy
        redirect_to action: :index
      end

      def top
      end

      def kiso
      end


      private
      def pick_params
        params.require(:pick).permit(:about, :image)
      end
end
