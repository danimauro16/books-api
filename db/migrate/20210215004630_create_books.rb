class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :author
      t.string :editorial
      t.date :publication_year
      t.string :photo

      t.timestamps
    end
  end
end
