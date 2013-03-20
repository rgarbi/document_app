class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :creator
      t.string :name
      t.integer :num_pages
      t.date :date

      t.timestamps
    end
  end
end
