class Product < ActiveRecord::Base

	# Makes sure these fields are not empty
	validates :title, :description, :image_url, presence: true

	# makes sure there's a price greater than 0.01
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }

	#Make sure the title is unique
	validates :title, uniqueness: true

	#Makes sure image url ends with gif, jpg or png
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image'
	}

	def self.latest
		Product.order(:updated_at).last	
	end

end
