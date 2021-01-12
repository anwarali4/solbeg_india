class Message < ApplicationRecord
	has_many_attached :media_assests
	#has_one_attached :image
	scope :recent, -> { order(created_at: :desc) }

	# def self.sizes
 #    {
 #      thumbnail: { resize: "100x100" },
 #      original:     { resize: "1000x500" }
 #    }
 #  end

 #  def sized(size)
 #    self.image_file.variant(Image.sizes[size]).processed
 #  end
end
