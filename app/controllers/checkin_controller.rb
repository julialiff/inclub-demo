class CheckinController < ApplicationController
  def new
    idUsuario = session[:idCadastro]
    idFesta = params[:idFesta]
    dataHora = Time.now.to_formatted_s(:db)
    @connection = ActiveRecord::Base.establish_connection
    sql = "INSERT INTO CheckIn(idUsuario, idFesta, dataHora)
                        VALUES(#{idUsuario}, #{idFesta}, '#{dataHora}');"
    result = @connection.connection.insert(sql)
    flash[:success] = 'Check-in realizado com sucesso!'
    redirect_to :back
  end

  def destroy
    idUsuario = session[:idCadastro]
    idFesta = params[:idFesta]
    @connection = ActiveRecord::Base.establish_connection
    sql = "DELETE FROM CheckIn WHERE idUsuario = #{idUsuario} && idFesta = #{idFesta};"
    @connection.connection.insert(sql)
    flash[:success] = 'Check-in desfeito.'
    redirect_to :back
  end
end
