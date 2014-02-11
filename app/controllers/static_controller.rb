class StaticController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id

  def index
  end
end
