class Api::V1::DepartmentsController < Api::ApiController
  before_action :authenticate!

  def index
    options = params.permit(:store_id, :only_super)

    departments = ListDepartments.new(current_corporate, current_user, options)
    @departments = departments.fetch
  end
end
