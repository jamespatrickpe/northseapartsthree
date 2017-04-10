class GenericReportController < ApplicationController

  layout 'report/main'

  before_action :setup_controller

  def setup_variables(main_resource_path, parent_controller_path, title_heading = 'report')
    @main_resource_path = main_resource_path
    @parent_controller_path = parent_controller_path
    @title_heading = title_heading.upcase
  end

end
