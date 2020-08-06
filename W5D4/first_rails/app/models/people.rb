class People < ApplicationRecord
    validates :name, presence: true
    validates :house_id, presence: true
    validate :check_name_length

    def check_name_length
        unless self.name.length >= 4 
            errors[:name] << "too short. Must be longer than 4 characters."
        end
    end

    belongs_to(:house, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Houses
    })
end
