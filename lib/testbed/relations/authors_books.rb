module Relations
  class AuthorsBooks < ROM::Relation[:sql]
    schema(:authors_books, infer: true) do
      associations do
        belongs_to :authors
        belongs_to :books
      end
    end
  end
end
