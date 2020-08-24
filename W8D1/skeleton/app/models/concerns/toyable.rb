module Toyable
    extend ActiveSupport::Concern
  
    included do
        has_many :toys, as: :toyable
    end
  
    def receive_toy(name)
        self.toy = Toy.find_by(name: name)
        self.toy ||= Toy.create(name)
    end
  end