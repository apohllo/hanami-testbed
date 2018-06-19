module Relations
  class Poems < ROM::Relation[:sql]
    schema(:poems, infer: true) do
      associations do
        belongs_to :author
      end
    end
  end
end
