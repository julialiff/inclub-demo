class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :proximas_festas, :info_balada, :estilo_festa, :qtd_checkin, :nome_usuario, :checked_in?, :estilo_balada

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

  def estilo_festa(idFesta)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM EstiloFesta where idFesta = #{idFesta};"
    estilos = ActiveRecord::Base.connection.exec_query(sql)
    result = []
    estilos.each do |estilo|
      sql = "SELECT nome FROM Estilo where idEstilo = #{estilo['idEstilo']};"
      r = ActiveRecord::Base.connection.exec_query(sql)
      unless result.include?(r[0]['nome'])
        result << r[0]['nome']
      end
    end
    result
  end

    def estilo_balada(idBalada)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM EstiloBalada where idBalada = #{idBalada};"
    estilos = ActiveRecord::Base.connection.exec_query(sql)
    result = []
    estilos.each do |estilo|
      sql = "SELECT nome FROM Estilo where idEstilo = #{estilo['idEstilo']};"
      r = ActiveRecord::Base.connection.exec_query(sql)
      unless result.include?(r[0]['nome'])
        result << r[0]['nome']
      end
    end
    result
  end

  def qtd_checkin(idFesta)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM total_checkin_festa WHERE idFesta = #{idFesta};"
    r = ActiveRecord::Base.connection.exec_query(sql)
    if r[0]
      r[0]['totalCheckins']
    else
      0
    end
  end

  def nome_usuario(idUsuario)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT idCadastro, nome FROM Cadastro WHERE idCadastro = #{idUsuario};"
    user = ActiveRecord::Base.connection.exec_query(sql)
    user.first.symbolize_keys!
  end

  def checked_in?(idUsuario, idFesta)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM CheckIn WHERE idUsuario = #{idUsuario} && idFesta = #{idFesta};"
    result = ActiveRecord::Base.connection.exec_query(sql)
    !result[0].nil?
  end
end
