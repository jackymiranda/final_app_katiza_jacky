class SpaceController < ApplicationController

  def index
    # Obtener tipos únicos de space (por si necesitas mostrar más categorías dinámicas)
    @space_types = Space.distinct.pluck(:space)

    # Filtrar por categoría si el parámetro está presente
    if params[:space_type].present? && params[:space_type] != "All"
      @list_of_space = Space.where(space: params[:space_type]).order(created_at: :desc)
    else
      @list_of_space = Space.all.order(created_at: :desc)
    end

    render template: "all_templates/index"
  end
  
  def show
    the_id = params.fetch("path_id")
    @the_space = Space.find(the_id)

    render({ :template => "all_templates/show" })
  end

  def create
    @the_space = Space.new
    @the_space.name = params.fetch("query_name")
    @the_space.space = params.fetch("query_space")
    @the_space.original_price = params.fetch("query_original_price")
    @the_space.selling_price = params.fetch("query_selling_price")
    @the_space.brand = params.fetch("query_brand")
    @the_space.condition = params.fetch("query_condition")
    @the_space.description = params.fetch("query_description")
    @the_space.owner = params.fetch("query_owner")
  
    # Adjuntar imagen si está presente
    @the_space.image.attach(params[:query_image]) if params[:query_image].present?
  
    if @the_space.save
      redirect_to("/space", notice: "Item created successfully.")
    else
      redirect_to("/space", alert: "Item failed to create successfully.")
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_space = Space.find(the_id)
  
    @the_space.name = params.fetch("query_name")
    @the_space.space = params.fetch("query_space")
    @the_space.original_price = params.fetch("query_original_price")
    @the_space.selling_price = params.fetch("query_selling_price")
    @the_space.brand = params.fetch("query_brand")
    @the_space.condition = params.fetch("query_condition")
    @the_space.description = params.fetch("query_description")
    @the_space.owner = params.fetch("query_owner")
  
    # Actualizar la imagen si se subió una nueva
    if params[:query_image].present?
      @the_space.image.attach(params[:query_image])
    end
  
    if @the_space.save
      redirect_to("/space/#{@the_space.id}", notice: "Item updated successfully.")
    else
      redirect_to("/space/#{@the_space.id}", alert: "Item failed to update successfully.")
    end
  end
  

  def destroy
    the_id = params.fetch("path_id")
    @the_space = Space.find(the_id)

    @the_space.destroy

    redirect_to("/space", { :notice => "Item deleted successfully." })
  end
end
