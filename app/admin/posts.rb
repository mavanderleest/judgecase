ActiveAdmin.register Post do
  permit_params :title, :body, :slug, :author_name, :image

  index do
    column :title
    column :body do |post|
      post.body.truncate(25) + " (" + post.body.split.size.to_s + " words)"
    end
    column :slug
    column :author_name
    column :image do |post|
      "Uploaded" unless !post.image.exists?
    end
    actions
  end

  show do |t|
    attributes_table do
      row :title
      row :body
      row :slug
      row :author_name
      row :image do
        post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No photo yet")
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :slug
      f.input :author_name
      f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
