class SearchController < ApplicationController
    def index
        query = params[:query]
        ip_address = request.remote_ip
    
        Search.create(query: query, ip_address: ip_address)
    
        # Broadcast the search to all subscribers
        SearchChannel.broadcast_to('search', query: query)

        respond_to do |format|
            format.html
            format.json { render json: { query: query } }
      end
end
