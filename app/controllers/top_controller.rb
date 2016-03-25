class TopController < ApplicationController

  def index
    @task = Task.new
    @feed_contents = FeedContent.includes(:content).page(params[:page]).per(10).order("created_at DESC")
    @feed_contents_resource = @feed_contents.map(&:content)
  end

end
