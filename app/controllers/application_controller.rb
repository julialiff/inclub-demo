class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :proximas_festas, :info_balada

  def proximas_festas
    @connection = ActiveRecord::Base.establish_connection
    sql = 'SELECT idFesta, nome, data, hora, tipo_bar, idBalada FROM Festa WHERE (data BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY) && isActive = true) LIMIT 3;'
    ActiveRecord::Base.connection.exec_query(sql)
  end

  def info_balada(idBalada)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT nome FROM Cadastro where idCadastro = #{idBalada};"
    r = ActiveRecord::Base.connection.exec_query(sql)
    r[0]['nome']
  end
end
