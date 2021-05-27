class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.string :name
      t.string :table
      t.string :symbol
      t.string :lastplay, default: ""

      t.timestamps
    end
  end
end
