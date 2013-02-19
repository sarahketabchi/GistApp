class TagsController < ApplicationController
  def create
    @tag = Tag.new(params[:tag])

    @tag.save!

    render :nothing => true
  end

  def destroy

  end

  def index
    @tags = Tag.all

    respond_to do |format|
      format.json { render :json => @tags }
    end
  end
end
