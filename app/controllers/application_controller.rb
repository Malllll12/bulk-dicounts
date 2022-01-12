class ApplicationController < ActionController::Base
  layout 'application'
  before_action :set_layout_variables

  def set_layout_variables
    @repo_search = RepoSearch.new
  end
end
