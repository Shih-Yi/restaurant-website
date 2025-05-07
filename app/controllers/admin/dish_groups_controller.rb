class Admin::DishGroupsController < Admin::BaseController
  before_action :authenticate_admin_user!
  before_action :set_dish_group, only: [:edit, :update, :destroy, :update_position]

  def index
    @dish_groups = DishGroup.all.order(position: :asc)
  end

  def new
    @dish_group = DishGroup.new
    # 預設添加一個空白的嵌套表單
    @dish_group.dish_group_images.build
  end

  def create
    @dish_group = DishGroup.new(dish_group_params)
    
    if @dish_group.save!
      redirect_to admin_dish_groups_path, notice: "Create Success!"
    else
      render :new
    end
  end

  def edit
    # 確保有一個空白的嵌套表單用於添加
    @dish_group.dish_group_images.build if @dish_group.dish_group_images.empty?
  end

  def update
    if @dish_group.update(dish_group_params)
      redirect_to admin_dish_groups_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  def destroy
    @dish_group.destroy
    
    redirect_to admin_dish_groups_path, notice: "Delete Success!"
  end

  def update_position
    @dish_group.insert_at(params[:position].to_i)
    
    redirect_to admin_dish_groups_path
  end

  private

  def set_dish_group
    @dish_group = DishGroup.find(params[:id])
  end

  def dish_group_params
    params.require(:dish_group).permit(
      :name, :description, :published, :group_type,
      dish_group_images_attributes: [:id, :image, :title, :image_type, :image_size, :_destroy]
    )
  end

end 