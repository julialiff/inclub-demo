class CreateFesta < ActiveRecord::Migration[5.0]
  def change
    create_table :festa do |t|

      t.timestamps
    end
  end
end
