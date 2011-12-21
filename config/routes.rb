FayeDemo::Application.routes.draw do
  root :to => 'root#index'
  resources :channels do
    member { post :add_message }
  end
end
#== Route Map
# Generated on 21 Dec 2011 17:05
#
# channel GET /channels/:id(.:format)               {:action=>"show", :controller=>"channels"}
#  jammit     /assets/:package.:extension(.:format) {:action=>"package", :extension=>/.+/, :controller=>"jammit"}
