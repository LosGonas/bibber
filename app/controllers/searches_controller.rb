class SearchesController < ApplicationController


  def search
    @params = search_params['pattern']

    unless @params.blank?
      #use mongoDB 2.6 text search and create Reference objects from results
      @references = Reference.collection.find({'$text' => { '$search' => @params} }).map{|x| Reference.new(x)}
    end
    render :index
  end

  private
  def search_params
    params.permit(:pattern)
  end

end