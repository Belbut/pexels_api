class StaticpagesController < ApplicationController
  def index
    api_key = Rails.application.credentials.dig(:pexels, :api_key)
    client = Pexels::Client.new(api_key)

    @collections = client.collections.all
    @collections_for_select = @collections.map { |collection| [collection.title, collection.id] }

    return unless params[:collection_id].present?

    puts params[:collection_id]
  end
end
