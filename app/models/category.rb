class Category < ActiveRecord::Base
	validates :name, :description, presence: {message: 'O campo não pode ficar vazio'}
	validates :name, uniqueness: {message: 'Categoria já cadastrada'}
end
