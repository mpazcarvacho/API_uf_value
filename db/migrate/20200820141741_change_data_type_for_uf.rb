class ChangeDataTypeForUf < ActiveRecord::Migration[5.2]
  def change
    change_column :Ufvalues, :uf, :float
  end
end
