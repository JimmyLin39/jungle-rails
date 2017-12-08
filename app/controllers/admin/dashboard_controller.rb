class Admin::DashboardController < ApplicationController
  before_filter :authorize  
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
  end
end
