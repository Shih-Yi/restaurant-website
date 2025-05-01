class Admin::DishesController < Admin::BaseController
  before_action :authenticate_admin_user!
  before_action :set_dish, only: [:edit, :update, :destroy, :update_position]

  def index
    group_type = params[:group_type]
    @dish_groups = DishGroup.where(group_type: group_type)
    @dishes = Dish.joins(:dish_group).where(dish_groups: { group_type: group_type })
  end

  def new
    @dish = Dish.new
    @dish_groups = DishGroup.all.order(position: :asc)
  end

  def edit
    @dish_groups = DishGroup.all.order(position: :asc)
  end

  def create
    dish = Dish.new(dish_params)
    
    if dish.dish_group_id.blank?
      flash[:error] = "Dish group is required"
      redirect_to new_admin_dish_path and return
    end

    if dish.save
      flash[:success] = "Create Successfully"
      group_type = DishGroup.find(dish.dish_group_id).group_type
      redirect_to admin_dishes_path(group_type: group_type)
    else
      flash[:error] = dish.errors.full_messages.join(", ")
      redirect_to new_admin_dish_path and return
    end
  end

  def update
    if dish_params[:dish_group_id].blank?
      flash[:error] = "Dish group is required"
      redirect_to edit_admin_dish_path(@dish) and return
    end

    if @dish.update(dish_params)
      flash[:success] = "Successfully"
      group_type = DishGroup.find(@dish.dish_group_id).group_type
      redirect_to admin_dishes_path(group_type: group_type)
    else
      flash[:error] = @dish.errors.full_messages.join(", ")
      redirect_to edit_admin_dish_path(@dish) and return
    end
  end

  def destroy
    group_type = @dish.dish_group&.group_type
    @dish.destroy
    render status: 200, json: { result: "Delete Successfully", redirect_url: admin_dishes_path(group_type: group_type) }
  end

  def update_position
    @dish.insert_at(params[:position].to_i)
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:english_name, :chinese_name, :small_price, :large_price, :description, :dish_group_id)
  end
end
