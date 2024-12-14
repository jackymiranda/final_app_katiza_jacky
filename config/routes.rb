Rails.application.routes.draw do

  get("/", { :controller => "misc", :action => "home" })
  get("about", { :controller => "misc", :action => "about" })
  get("contact", { :controller => "misc", :action => "contact" })


  get("/space", { :controller => "space", :action => "index" })
  post("/insert_item", { :controller => "space", :action => "create" })
  get("/space/:path_id", { :controller => "space", :action => "show" })
  patch("/modify_item/:path_id", { :controller => "space", :action => "update" })
  get("/delete_item/:path_id", { :controller => "space", :action => "destroy" })

  
end
