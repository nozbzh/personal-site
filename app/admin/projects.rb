ActiveAdmin.register Project do
  menu priority: 1
  permit_params :name, :summary, :content, :published, :priority_order, :image

  controller do
    resources_configuration[:self][:instance_name] = 'project'
  end

  index do
    column :name do |project|
      link_to project.name, admin_project_path(project)
    end
    column :published
    column :priority_order
    actions
  end

  show do
    attributes_table_for project do
      row :image do |project|
        image_tag project.image.thumb
      end
      row :name
      row :published
      row :priority_order
      row :summary do |project|
        strip_tags(project.summary)
      end
      row :content do |project|
        strip_tags(project.content)
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "project" do
      f.input :name
      f.input :published
      f.input :priority_order
      f.input :image, as: :file
      f.input :summary, input_html: {class: 'redactor'}
      f.input :content, input_html: {class: 'redactor'}
    end

    actions
  end

  # publish project
  action_item only: [:show, :edit], if: -> { project.published == false } do
    link_to("Publish", action: :publish)
  end

  member_action :publish do
    begin
      project = Project.find(params[:id])
      project.published = true
      project.save
    rescue Exception => e
      flash[:alert] = e.to_s
    end
    flash[:notice] = "This project is now published"
    redirect_to url_for(action: :show, id: params[:id])
  end

  # unpublish project
  action_item only: [:show, :edit], if: -> { project.published == true } do
    link_to("Unpublish", action: :unpublish)
  end

  member_action :unpublish do
    begin
      project = Project.find(params[:id])
      project.published = false
      project.save
    rescue Exception => e
      flash[:alert] = e.to_s
    end
    flash[:notice] = "This project is now unpublished"
    redirect_to url_for(action: :show, id: params[:id])
  end
end
