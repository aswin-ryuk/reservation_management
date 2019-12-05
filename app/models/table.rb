class Table < ApplicationRecord
	
	validates :name, :max_count, :min_count, :restaurant_id, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }

	validate :check_table_count

	belongs_to :restaurant


	def check_table_count
        unless  max_count > min_count
            self.errors.add(:min_count, "Minimum count can't be greater or equal to maxmimum count")
    	end
    end

end
