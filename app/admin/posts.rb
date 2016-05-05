ActiveAdmin.register Post do
  menu priority: 1
  permit_params :title, :content

  controller do
    resources_configuration[:self][:instance_name] = 'post'
  end

  index do
    column :title
    actions
  end

  show do
    attributes_table_for post do
      row :title
      row :content
      #  do |post|
      #   strip_tags(post.content)
      # end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Post" do
      f.input :title
      f.input :content, input_html: {class: 'redactor'}
    end

    actions
  end
end
