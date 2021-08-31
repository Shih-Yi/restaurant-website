class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_admin_user!

  def index
  end
end
