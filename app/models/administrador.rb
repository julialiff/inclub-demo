class Administrador < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'Administrador'
  # belongs_to:
  # has_many:
end
