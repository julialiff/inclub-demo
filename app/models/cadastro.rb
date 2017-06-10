class Cadastro < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'Cadastro'
  # belongs_to:
  has_many :baladas, dependent: :destroy
end
