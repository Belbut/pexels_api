class StaticpagesController < ApplicationController
  def index
    api_key = Rails.application.credentials.dig(:pexels, :api_key)
    client = Pexels::Client.new(api_key)

    collections = client.collections
    @collections_for_select = collections.all.map { |collection| [collection.title, collection.id] }

    return if params[:collection_id].empty?

    @media_results = collections[params[:collection_id]].media
  end
end
