module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:idCadastro] = user[:idCadastro]
    session[:nome] = user[:nome]
    session[:username] = user[:username]
    session[:email] = user[:email]
    session[:tipo] = user[:tipo]
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(idCadastro: session[:idCadastro])
  end

   def logged_in?
    !session[:idCadastro].nil?
  end

  def log_out
    session.delete(:idCadastro)
  end
end
