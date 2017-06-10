class CreateCadastros < ActiveRecord::Migration[5.0]
  def change
    create_table :cadastros do |t|

      t.timestamps
    end
  end
end
