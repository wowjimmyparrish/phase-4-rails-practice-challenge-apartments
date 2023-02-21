class ApartmentsController < ApplicationController
    def index 
        apartments = Apartment.all 
        render json: apartments, status: :ok 
    end

    def show 
        apartment = find_apartment 
        render json: apartment, status: :ok 
    end 

    def update 
        apartment = find_apartment 
        apartment.update(apartment_params)
        render json: apartment
    end 

    def create 
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created 
    end 

    def destroy 
        apartment = find_apartment 
        if apartment 
        apartment.destroy 
        head :no_content 
        else
            render json: { error: "apartment not found" }, status: :not_found 
        end
        
    end

    private 
    def find_apartment 
        Apartment.find(params[:id]) 
    end

    def apartment_params 
        params.permit(:number)
    end
end
