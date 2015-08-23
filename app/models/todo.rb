class Todo < ActiveRecord::Base
	has_many :items

	validates :title, :description, presence: :true
end
