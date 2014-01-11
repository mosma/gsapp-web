module SearchHelper
  def show_search_param 
    params[:query] if !params[:query].blank?
  end
end
