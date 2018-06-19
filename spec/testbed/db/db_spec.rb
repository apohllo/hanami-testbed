require_relative '../../spec_helper'

module Testbed
  class Database
    include Import['testbed.rom']

    def connection
      @rom
    end
  end
end

describe 'Database' do
  before do
    DatabaseCleaner.start
    @instance = Testbed::Database.new
    @author_repo = AuthorRepository.new
    @poem_repo = PoemRepository.new
    @book_repo = BookRepository.new
    @author_repo.create(name: "John Doe", created_at: Time.now, updated_at: Time.now)
  end

  after do
    DatabaseCleaner.clean
  end

  it 'connects to the DB' do
    @instance.connection.wont_equal nil
  end

  it 'reads data from repository' do
    assert @author_repo.ids.size > 0
  end

  it 'creates authors with poems' do
    @author_repo.create_with_poems('John f Doe', ['Abc', 'Efg'])
    assert @author_repo.ids.size == 2
    assert @poem_repo.ids.size == 2
  end

  it 'creates authors with books' do
    book_1 = @book_repo.create(title: 'Abc', created_at: Time.now, updated_at: Time.now)
    book_2 = @book_repo.create(title: 'Xyz', created_at: Time.now, updated_at: Time.now)
    author = @author_repo.create_with_books('John f Doe', [book_1.id, book_2.id])
    author_copy = @author_repo.by_id_with_books(author.id)
    assert author_copy.books.size == 2
    assert author_copy.books.map(&:id).include?(book_1.id)
    assert author_copy.books.map(&:id).include?(book_2.id)
  end
end
