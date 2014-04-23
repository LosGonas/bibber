class SearchesController < ApplicationController


  def search
    params = search_params
    str = params['pattern']
    @params = str

    unless str.blank?
      @references = Reference.collection.find({'$text' => { '$search' => str} }).map{|x| Reference.new(x)}
    end
    render :index
  end

  private
  def search_params
    params.permit(:pattern)
  end

end