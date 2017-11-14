class Api::V1::SuperDepartmentsController < Api::ApiController
  before_action :authenticate!

  def index
    @departments = ListDepartments.new(
      current_corporate,
      current_user,
      only_super: true
    ).fetch
  end
end
