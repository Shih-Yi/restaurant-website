class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_admin_user!

  def index
  end

  def edit_background_images
    @setting = Setting.first_or_initialize

    if request.post?
      if params[:setting] && (params[:setting][:intro_image].present? || params[:setting][:menu_image].present?)
        @setting.intro_image = params[:setting][:intro_image] if params[:setting][:intro_image].present?
        @setting.menu_image = params[:setting][:menu_image] if params[:setting][:menu_image].present?
        
        if @setting.save
          flash[:notice] = "Background images updated successfully."
          redirect_to admin_dashboard_edit_background_images_path
        else
          flash[:alert] = "Failed to update background images."
          render :edit_background_images
        end
      else
        flash[:alert] = "No images were selected."
        render :edit_background_images
      end
    end
  end

  def remove_background_image
    setting = Setting.first
    
    if setting.present?
      image_type = params[:type]
      
      if image_type == "intro_image"
        setting.remove_intro_image!
        setting.save
        flash[:notice] = "Intro background image has been removed."
      elsif image_type == "menu_image"
        setting.remove_menu_image!
        setting.save
        flash[:notice] = "Menu background image has been removed."
      else
        flash[:alert] = "Invalid image type specified."
      end
    else
      flash[:alert] = "No settings found."
    end
    
    redirect_to admin_dashboard_edit_background_images_path
  end
end
