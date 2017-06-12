class AvaliacaoFesta < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'AvaliacaoFesta'
  belongs_to :cadastro
  # has_many:
end
