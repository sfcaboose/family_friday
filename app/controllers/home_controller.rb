class HomeController < ApplicationController
  def index
    @groups = Employee.group
  end
end
