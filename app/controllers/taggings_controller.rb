class TaggingsController < ApplicationController
  def create
    @gist = Gist.find(params[:gist][:id])
    @tag = Tag.find_by_topic(params[:topic])

    @tagging = Tagging.new(
  end

  def destroy

  end
end
