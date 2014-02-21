class CategoriesController < InheritedResources::Base
def video
    @category = Category.find(params[:category_id])    
    @videos = Video.where(category_id: params[:category_id])
end

end
