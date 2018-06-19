class PoemRepository < ROM::Repository[:poems]
  include Testbed::Import.args['testbed.rom']

  def ids
    poems.pluck(:id)
  end
end
