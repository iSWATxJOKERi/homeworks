class Houses < ApplicationRecord
    validates :address, presence: true
    validate :check_address_length

    def check_address_length
        unless self.address.length >= 10
            errors[:address] << "too short. Must be longer than 10 characters."
        end
    end

    has_many(:people, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :People
    })
end