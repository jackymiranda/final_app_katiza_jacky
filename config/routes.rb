Rails.application.routes.draw do

  get("/", { :controller => "homepage", :action => "homepage" })
  
  get("/all", { :controller => "all", :action => "index" })
  post("/insert_all", { :controller => "all", :action => "create" })
  get("/all/:path_id", { :controller => "all", :action => "show" })
  post("/modify_all/:path_id", { :controller => "all", :action => "update" })
  get("/delete_all/:path_id", { :controller => "all", :action => "destroy" })

  
end
