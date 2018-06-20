require_relative '../types'

module Entities
  class Author < ROM::Struct
    attribute :name, Testbed::Types::String
    attribute :created_at, Testbed::Types::DateTime
    attribute :updated_at, Testbed::Types::DateTime

    def full_name
      "Full name: #{self.name}"
    end
  end
end
