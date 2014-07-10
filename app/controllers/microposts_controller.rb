class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    respond_to do |format|
      format.html do
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
          flash[:success] = 'Micropost created!'
          redirect_to root_url
        else
          @feed_items = []
          render 'static_pages/home'
        end
      end
      format.json do
        render json: create_post(micropost_params)
      end
    end
  end

  def update
    respond_to do |format|
      format.html
      format.json do
        post = Micropost.find(params[:id])
        post.content = params[:micropost][:content]
        post.save!
        render json: post
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        @micropost = Micropost.find(params[:id])
        #tp = micropost_dto_service(@micropost)
        render json: @micropost
      end
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_dto_service(post)
      DTOService::Micropost.new.process(post)
    end

    def create_post(info)
      micropost_model = Micropost.new(info)
      micropost_model.save!
      micropost_model
    end

    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
