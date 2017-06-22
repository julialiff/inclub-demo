class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email]
    senha = Digest::SHA1.hexdigest params[:session][:password]
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM Cadastro WHERE ((email = '#{email}' && senha = '#{senha}') && isActive = true);"
    user = ActiveRecord::Base.connection.exec_query(sql)
    if !user.empty?
      user = user.first.symbolize_keys!
      log_in user
      redirect_to root_path
      # flash.now[:]
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'E-mail ou senha inválidos.' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
