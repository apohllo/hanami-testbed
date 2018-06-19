module Relations
  class Authors < ROM::Relation[:sql]
    schema(:authors, infer: true) do
      associations do
        has_many :authors_books
        has_many :books, through: :authors_books
        has_many :poems
      end
    end
  end
end
