class AddEcheanceIdToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :echeance_id, :integer
  end
end
