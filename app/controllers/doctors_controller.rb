class DoctorsController < ApplicationController
    def index
        render json: Doctor.all.as_json(include: :reviews)
    end

    def show
        @doctor = Doctor.find(params[:id])
        render json: @doctor.as_json(include: :reviews)
    end

    def create
        if @doctor = Doctor.create(doctor_params)
            render json: @doctor.as_json(include: :reviews), status: :okay
        else
            render json: {error: true}, status: :unprocessable_entity
        end
    end

    def update
        @doctor = Doctor.find(params[:id])
        if @doctor.update(doctor_params)
            render json: @doctor.as_json(include: :reviews), status: :okay
        else
            render json: {error: true}, status: :unprocessable_entity
        end
    end

    def destroy
        @doctor = Doctor.find(params[:id])
        @doctor.destroy
        render json: {}, status: :okay
    end

    private

    def doctor_params
        params.require(:doctor).permit(:name)
    end
end