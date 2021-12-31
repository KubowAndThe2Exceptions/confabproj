class SearchesController < ApplicationController
    def show
        if logged_in?
            @search = Search.find(params[:id])
        else
            redirect_to new_session_path
        end
    end 

    def new
        if logged_in?
            #@searches = Search.all
            #@searches.each do |f| # Bad solution.  Future problem would be all records
            #    f.destroy         # are deleted ANY time "new" is called.  Research/use sessions maybe?
            #end
            @search = Search.new
        else
            redirect_to new_session_path
        end
    end

    def create
        if logged_in?
            @search = Search.create(search_params)
            redirect_to @search
        else
            redirect_to new_session_path
        end
    end
    
    private

    def search_params
        params.require(:search).permit(:search_input, :usertype)
    end 
end