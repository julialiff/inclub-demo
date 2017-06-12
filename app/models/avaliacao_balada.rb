class AvaliacaoBalada < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'AvaliacaoBalada'
  belongs_to :cadastro
  # has_many:
end
