ROM::SQL.migration do
  change do
    create_table :authors_books do
      foreign_key :author_id, :authors
      foreign_key :book_id, :books
    end
  end
end
