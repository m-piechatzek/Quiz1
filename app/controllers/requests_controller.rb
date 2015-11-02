class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit([:name, :email, :department, :message])
    @request = Request.new(request_params)
    @request.status = false

    if @request.save

      redirect_to(requests_path)
    else
      render :new
    end
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
        @request = Request.find params[:id]
    request_params = params.require(:request).permit([:name, :email, :department, :message, :status])


    if @request.update(request_params)
      redirect_to(requests_path)
    else
      render :edit
    end
  end

  def index
    @request = Request.order(:status)#.page params[:page]

    if params[:search]
      @request = Request.search(params[:search]).order(:status)#.page params[:page]
    else
      @request = Request.order(:status)
    end

  end

  def destroy
        @request = Request.find params[:id]
  @request.destroy
  # quick note that goes away
  # flash[:notice] =  "Request deleted successfully"
  redirect_to requests_path
end

  # def search
  #         # @request = Request.search(params[:search]).order(:status)
  #   if params[:search]
  #     @request = Request.search(params[:search]).order(:status)
  #   else
  #     @request = Request.order(:status)
  #   end
  # 
  #
  # end


end
