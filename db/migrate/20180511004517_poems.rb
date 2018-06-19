ROM::SQL.migration do
  change do
    create_table :poems do
      primary_key :id
      column :title, String, null: false
      foreign_key :author_id, :authors

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
