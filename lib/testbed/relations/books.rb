module Relations
  class Books < ROM::Relation[:sql]
    schema(:books, infer: true) do
      associations do
        has_many :authors_books
        has_many :authors, through: :authors_books
      end
    end
  end
end
