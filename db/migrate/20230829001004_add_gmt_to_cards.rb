class AddGmtToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :gmt, :float
  end
end
