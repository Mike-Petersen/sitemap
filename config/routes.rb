Mime::Type.register_alias "text/xml", :xsl

Rails.application.routes.draw do
  resource :sitemap
  resources :sitemap_settings
  resources :sitemap_widgets
  resources :sitemap_static_links
end
