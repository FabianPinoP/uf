class RequestsController < ApplicationController
  before_action :set_request, only: [:update, :destroy]
  before_action :set_request_by_client, only: [:show]
  # GET /requests
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /requests/1
  def show
    render json: {total_calls_by_client: @requests.count }
  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end
    def set_request_by_client
      @requests = Request.where(user: params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:user)
    end
end
