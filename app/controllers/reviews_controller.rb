class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
    def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new()
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json




  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    @restaurant = Restaurant.find(@review.restaurant_id)
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      render :new
    end
  end

  # def create
  #   @review = Review.new(review_params)

  #   respond_to do |format|
  #     if @review.save
  #       format.html { redirect_to @review, notice: 'Review was successfully created.' }
  #       format.json { render :show, status: :created, location: @review }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  #   @review.restaurant = Restaurant.find(params[:restaurant_id])
  #   @review.save
  # end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
    params.require(:review).permit(:content, :rating)
  end
end

