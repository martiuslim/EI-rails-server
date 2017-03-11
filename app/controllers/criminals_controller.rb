class CriminalsController < ApplicationController
    def index
        @criminals = Criminal.all
    end
    
    def show
        @criminal = Criminal.find(params[:id])
    end
    
    def new
        @criminal = Criminal.new
    end
    
    def edit
        @criminal = Criminal.find(params[:id])
    end
    
    def create
        @criminal = Criminal.new(criminal_params)
        
        @criminal.save
        redirect_to @criminal
    end
    
    def destroy
        @criminal = Criminal.find(params[:id])
        @criminal.destroy
        
        redirect_to criminals_path
    end
    
    def find
        @criminal = Criminal.find_by ic: params[:ic]
        if @criminal != nil
            @to_return = {:Status => :Ok, :Message => :"Criminal Found", :Name => @criminal.name, :IC => @criminal.ic, :Offence => @criminal.offence}
            render :json => @to_return
        else
            render :json => {:Status => :Ok, :Message => :'No Criminals Found'}
        end
    end
    
    private
        def criminal_params
            params.require(:criminal).permit(:name, :ic, :offence)
        end
end
