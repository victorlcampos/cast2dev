ActiveAdmin.register Video do
  permit_params :youtube_id, :tag_list

  form do |f|
    f.inputs 'Video' do
      f.input :youtube_id
      f.input :tag_list
    end
    f.actions
  end

  controller do
    defaults finder: :find_by_params
  end
end
