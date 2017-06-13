class CreateAvaliacaoFesta < ActiveRecord::Migration[5.0]
  def change
    create_table :avaliacao_festa do |t|

      t.timestamps
    end
  end
end
