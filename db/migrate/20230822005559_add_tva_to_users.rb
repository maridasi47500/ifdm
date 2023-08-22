class AddTvaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tva, :string
    add_column :users, :societe, :string
    add_column :users, :complementadresse, :string
    add_column :users, :civilite, :string
  end
end
