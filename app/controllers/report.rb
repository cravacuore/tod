require 'iconv'

Tod::App.controllers :report do

  get :page  do
    @user = !user_is_revisor?
    render 'report/report_page'
  end

  post :search do
    @query=params[:consulta]
    @proposals = search_tag("#{@query}").uniq
    @quantity_search = @proposals.size
    render 'report/report_page'
  end
end