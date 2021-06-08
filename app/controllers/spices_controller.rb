class SpicesController < ApplicationController

    before_action :find_spice, only: [:update, :destroy]

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        @found_spice.update(spice_params)
        render json: @found_spice
    end

    def destroy
        @found_spice.destroy
        render json: "Spice deleted."
    end

    private

    def find_spice
        @found_spice = Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
