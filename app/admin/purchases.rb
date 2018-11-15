ActiveAdmin.register Purchase do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :subtotal,:total,:user_id,:status, purchase_products_attributes:[:id,:product_id, :purchase_id,:quantity,:price,:total, :_destroy]

  index do
    selectable_column
      column :user
      column :status
      column :subtotal
      column :total
      column :created_at
      actions
  end

  show do |purchase|
    attributes_table do
      row :user
      row :status
      row :subtotal
      row :total
      row :created_at
      row :purchase_products do |purchase|
        purchase.products.map {|p| p.name}.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Purchase" do
      f.input :user
      f.input :status
      f.input :subtotal
      f.input :total
      f.has_many :purchase_products, allow_destroy: true do |n_f|
        #n_f.object.purchase = :purchase
        n_f.input :product
        n_f.input :purchase
        n_f.input :quantity
        n_f.input :price
        n_f.input :total
      end
    end
    f.actions
  end
end
