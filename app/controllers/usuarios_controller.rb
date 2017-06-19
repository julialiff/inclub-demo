class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @connection = ActiveRecord::Base.establish_connection

    nome = params[:nome]
    email = params[:email]
    username = params[:username]
    senha = params[:senha]
    senha = Digest::SHA1.hexdigest senha
    telefone = params[:telefone]
    tipo = params[:tipo][:tipo].to_i
    data_nasc = params[:dataNasc]

    sql = "INSERT INTO Cadastro(nome, email, username, senha, telefone, tipo, isActive)
                         VALUES('#{nome}', '#{email}', '#{username}', '#{senha}', '#{telefone}', #{tipo}, true);"
    puts sql
    result = @connection.connection.insert(sql)
    puts result
    sql = "INSERT INTO Usuario(idCadastro, dataNasc)
                        VALUES(#{result}, '#{data_nasc}');"
    puts sql
    @result = @connection.connection.insert(sql)

    Usuario.connection
    @usuario = Usuario.last

    # respond_to do |format|
      # if @result == 0
        # format.html { redirect_to @usuario, notice: 'Cadastro realizado com sucesso!' }
        # format.json { render :show, status: :created, location: @usuario }
      # else
        # format.html { render :new }
        # format.json { render json: @usuario.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.where(idUsuario: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.fetch(:usuario, {})
    end
end
