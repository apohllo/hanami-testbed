class BookRepository < ROM::Repository[:books]
  include Testbed::Import.args['testbed.rom']

  commands(:create)

  def ids
    poems.pluck(:id)
  end
end
