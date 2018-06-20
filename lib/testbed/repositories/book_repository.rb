class BookRepository < ROM::Repository[:books]
  include Testbed::Import.args['testbed.rom']
  struct_namespace Entities

  commands(:create)

  def create(book)
    books.changeset(:create, book).map(:add_timestamps).commit
  end

  def ids
    poems.pluck(:id)
  end
end
