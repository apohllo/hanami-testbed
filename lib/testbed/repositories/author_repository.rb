require 'rom-repository'

class AuthorRepository < ROM::Repository[:authors]
  include Testbed::Import.args['testbed.rom']

  commands :create
  struct_namespace Entities

  def create(author)
    authors.changeset(:create, author).map(:add_timestamps).commit
  end

  def create_with_books(name, book_ids)
    authors.
      combine(:authors_books).
      command(:create).
      call(name: name,
           created_at: Time.now,
           updated_at: Time.now,
           authors_books: book_ids.map{|id| {
             book_id: id
           } })
  end

  def create_with_poems(name, titles)
    authors.
      combine(:poems).
      command(:create).
      call(name: name,
           created_at: Time.now,
           updated_at: Time.now,
           poems: titles.map{|t| {
             title: t,
             created_at: Time.now,
             updated_at: Time.now
           } })
  end

  def by_id_with_books(id)
    authors.combine(:books).where(id: id).one
  end

  def ids
    authors.pluck(:id)
  end

  def first
    authors.first
  end
end
