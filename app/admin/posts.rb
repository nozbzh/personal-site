ActiveAdmin.register Post do
  menu priority: 2
  permit_params :title, :content, :published

  controller do
    resources_configuration[:self][:instance_name] = 'post'
  end

  index do
    column :title do |post|
      link_to post.title, admin_post_path(post)
    end
    column :published
    actions
  end

  show do
    attributes_table_for post do
      row :title
      row :published
      row :content do |post|
        strip_tags(post.content)
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Post" do
      f.input :title
      f.input :published
      f.input :content, input_html: {class: 'redactor'}
    end

    actions
  end

  # publish post
  action_item only: [:show, :edit], if: -> { post.published == false } do
    link_to("Publish", action: :publish)
  end

  member_action :publish do
    begin
      post = Post.find(params[:id])
      post.published = true
      post.save
    rescue Exception => e
      flash[:alert] = e.to_s
    end
    flash[:notice] = "This post is now published"
    redirect_to url_for(action: :show, id: params[:id])
  end

  # unpublish post
  action_item only: [:show, :edit], if: -> { post.published == true } do
    link_to("Unpublish", action: :unpublish)
  end

  member_action :unpublish do
    begin
      post = Post.find(params[:id])
      post.published = false
      post.save
    rescue Exception => e
      flash[:alert] = e.to_s
    end
    flash[:notice] = "This post is now unpublished"
    redirect_to url_for(action: :show, id: params[:id])
  end
end
