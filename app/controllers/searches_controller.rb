class SearchesController < ApplicationController
    def show
        @search = Search.find(params[:id])
    end 

    def new
        #@searches = Search.all
        #@searches.each do |f| # Bad solution.  Future problem would be all records
        #    f.destroy         # are deleted ANY time "new" is called.  Research/use sessions maybe?
        #end
        @search = Search.new
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end
    
    private

    def search_params
        params.require(:search).permit(:search_input, :usertype)
    end 
end