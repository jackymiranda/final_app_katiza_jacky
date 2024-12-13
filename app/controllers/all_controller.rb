class AllController < ApplicationController
  def index
    @list_of_all = All.all.order({ :created_at => :desc })

    render({ :template => "all_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_all = All.find(the_id)

    render({ :template => "all_templates/show" })
  end

  def create
    @the_all = All.new
    @the_all.name = params.fetch("query_name")
    @the_all.space = params.fetch("query_space")
    @the_all.original_price = params.fetch("query_original_price")
    @the_all.selling_price = params.fetch("query_selling_price")
    @the_all.brand = params.fetch("query_brand")
    @the_all.condition = params.fetch("query_condition")
    @the_all.description = params.fetch("query_description")
    @the_all.owner = params.fetch("query_owner")
    @the_all.image = params.fetch("query_image")

    if @the_all.valid?
      @the_all.save
      redirect_to("/all", { :notice => "Item created successfully." })
    else
      redirect_to("/all", { :notice => "Item failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_all = All.find(the_id)

    @the_all.name = params.fetch("query_name")
    @the_all.space = params.fetch("query_space")
    @the_all.original_price = params.fetch("query_original_price")
    @the_all.selling_price = params.fetch("query_selling_price")
    @the_all.brand = params.fetch("query_brand")
    @the_all.condition = params.fetch("query_condition")
    @the_all.description = params.fetch("query_description")
    @the_all.owner = params.fetch("query_owner")
    @the_all.image = params.fetch("query_image")


    
    if @the_all.valid?
      @the_all.save
      redirect_to("/all/#{@the_all.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/all/#{@the_all.id}", { :alert => "Item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_all = All.find(the_id)

    @the_all.destroy

    redirect_to("/all", { :notice => "Item deleted successfully."} )
  end


end
