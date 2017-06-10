class CreateBaladas < ActiveRecord::Migration[5.0]
  def change
    create_table :baladas do |t|

      t.timestamps
    end
  end
end
