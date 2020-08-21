class CreateUfvalues < ActiveRecord::Migration[5.2]
  def change
    create_table :ufvalues do |t|
      t.integer :uf
      t.date :date

      t.timestamps
    end
  end
end
