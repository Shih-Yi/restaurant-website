class Admin::NoticesController < Admin::BaseController
  before_action :set_notice, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    @notice = Notice.new
  end

  def create
    notice = Notice.new(notice_params)
    notice.save!
    flash[:success] = "Create Successfully"
    redirect_to admin_notice_path
  end

  def update
    @notice.update(notice_params)
    @notice.save!
    flash[:success] = "Successfully"
    redirect_to admin_notice_path
  end

  private

  def set_notice
    @notice = Notice.first
  end

  def notice_params
    params.require(:notice).permit(:title, :text, :start_at, :end_at, :published)
  end
end
