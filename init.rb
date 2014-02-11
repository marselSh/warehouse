Redmine::Plugin.register :warehouse do
  name 'Warehouse plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :warehouse do
    permission :view_products, products: [:index]
    permission :view_product, products: [:show]
    permission :create_products, products: [:new, :create]
    permission :edit_products, products: [:edit, :update]
    permission :delete_products, products: :destroy
    permission :static_page, static: :index, public: true
  end
  menu :project_menu, :products, {controller: 'products', action: 'index'}, caption: :project_menu, param: :project_id
  menu :project_menu, :static, {controller: 'static', action: 'index'}, caption: 'Вёрстка', param: :project_id
end

require 'issue_description_hook'
