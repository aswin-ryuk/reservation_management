class Reservation < ApplicationRecord
	include ActiveModel::Dirty

	validates :guest_name, :guest_email, :guest_count, :restaurant_time,
	:table_id, :restaurant_id, presence: true
	

	validates :guest_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	validates :restaurant_shift, :presence => true, :inclusion => { :in => ['M', 'E']}

	belongs_to :restaurant
	belongs_to :table

	around_update :check_for_changes

	validate :check_params_validation

    def check_params_validation
      if self.restaurant_id.present?
        self.errors.add(:restaurant_id, "No Restaurant is found") unless Restaurant.where(id: self.restaurant_id).first.present?
      end

      if self.table_id.present? &&  self.restaurant_id.present?
      	table = Table.where(id: self.table_id, restaurant_id: self.restaurant_id).first
        unless table.present?
      		self.errors.add(:table_id, "No Table is found") 
        end
        if  (table.present? && self.guest_count.present? && ((self.guest_count > table.max_count) || (self.guest_count < table.min_count)))
        	self.errors.add(:guest_count, "should be in between #{table.min_count} and #{table.max_count} for the selected table") 
        end
      end

      if self.restaurant_shift.present? && self.restaurant_time.present?
		if self.restaurant_shift == 'M'
      	  unless self.restaurant_time.to_time.strftime("%H:%M").between?("09:00".to_time.strftime("%H:%M"),"13:00".to_time.strftime("%H:%M"))
      	  	self.errors.add(:restaurant_time, "should be between 9:00 am to 13:00 pm") 
      	  end
      	elsif self.restaurant_shift == 'E'
      	  unless self.restaurant_time.to_time.strftime("%H:%M").between?("18:00".to_time.strftime("%H:%M"),"23:00".to_time.strftime("%H:%M"))
      	  	self.errors.add(:restaurant_time, "should be between 18:00 pm to 23:00 pm") 
      	  end
      	end
      end

    end

    def self.send_mail(reservation)
      begin
    	RestaurantMailer.guest_reservation_confirmation(reservation).deliver
		RestaurantMailer.restaurant_reservation_confirmation(reservation).deliver      	
      rescue Exception => e
      	Rails.logger.info(e)      	
      end
    end

    def check_for_changes
		@changes = self.changes
		yield
		if  (@changes.present? && (@changes[:guest_count].present? || @changes[:restaurant_time].present? ))
		  	begin
	    	   RestaurantMailer.guest_modified_reservation_confirmation(self,@changes).deliver 
	    	rescue Exception => e
	      		Rails.logger.info(e)      	
	      	end
		end
	end



end

