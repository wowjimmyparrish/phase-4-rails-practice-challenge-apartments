class TenantsController < ApplicationController
    def index 
        tenants = Tenant.all 
        render json: tenants, status: :ok 
    end

    def show 
        tenant = find_tenant
        render json: tenant, status: :ok 
    end 

    def update 
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant
    end 

    def create 
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created 
    end 

    def destroy 
        tenant = find_tenant
        if tenant 
        tenant.destroy 
        head :no_content 
        else
            render json: { error: "tenant not found" }, status: :not_found 
        end
        
    end

    private 
    def find_tenant 
        Tenant.find(params[:id]) 
    end

    def tenant_params 
        params.permit(:name, :age)
    end
end

end
