class PoemRepository < ROM::Repository[:poems]
  include Testbed::Import.args['testbed.rom']
  struct_namespace Entities

  def ids
    poems.pluck(:id)
  end
end
