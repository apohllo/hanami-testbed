module Entities
  class Author < ROM::Struct
    def full_name
      "Full name: #{self.name}"
    end
  end
end
