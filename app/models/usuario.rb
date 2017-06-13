class Usuario < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'Usuario'
  belongs_to :cadastro
  # has_many:
end
