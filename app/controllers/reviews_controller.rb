class ReviewsController < ApplicationController
    def index
        render json: Review.all.as_json(include: :doctor)
    end

    def show
        @review = Review.find(params[:id])
        render json: @review.as_json(include: :doctor)
    end

    def create
        if @review = Review.create(review_params)
            @review.doctor = Doctor.find(params[:doctor_id])
            @review.save
            render json: @review.as_json(include: :doctor), status: :okay
        else
            render json: {error: true}, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            render json: @review.as_json(include: :doctor), status: :okay
        else
            render json: {error: true}, status: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        render json: {}, status: :okay
    end

    private

    def review_params
        params.require(:review).permit(:description, :doctor_id)
    end
end