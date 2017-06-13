class CheckIn < ActiveRecord::Base
  attr_accessor :current
  @connection = ActiveRecord::Base.establish_connection
  self.table_name = 'CheckIn'
  belongs_to :Balada
  # has_many:
end
