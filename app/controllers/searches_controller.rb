class SearchesController < ApplicationController
  def index
    @searches = Search.all
    @top_searches = Search.most_searched
  end

  def create
    query = search_params[:query].strip

    if query.present?
      search = Search.create(query: query, ip_address: request.remote_ip)

      if search.persisted?
        ActionCable.server.broadcast 'searches_channel', { query: query, ip_address: search.ip_address }
        @top_searches = Search.most_searched
        respond_to do |format|
          format.html { render 'index', locals: { top_searches: @top_searches } }
          format.json { render json: { status: 'success' } }
        end
      else
        respond_to do |format|
          format.html { render 'index', locals: { top_searches: @top_searches } }
          format.json { render json: { status: 'error', message: "Error creating search: #{search.errors.full_messages.join(', ')}" } }
        end
      end
    else
      respond_to do |format|
        format.html { render 'index', locals: { top_searches: @top_searches } }
        format.json { render json: { status: 'error', message: 'Query cannot be blank' } }
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
