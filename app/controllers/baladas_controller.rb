class BaladasController < ApplicationController
  before_action :set_balada, only: [:show, :edit, :update, :destroy]

  # GET /baladas
  # GET /baladas.json
  def index
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM Balada INNER JOIN Cadastro ON Balada.idCadastro = Cadastro.idCadastro WHERE(Cadastro.isActive = true) ORDER BY nome ASC;"
    @baladas = ActiveRecord::Base.connection.exec_query(sql)
  end

  # GET /baladas/1
  # GET /baladas/1.json
  def show
    @comentarios = comentarios(params[:id])
    @festas = festas(params[:id])
  end


  def festas(idBalada)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM Festa WHERE idBalada = #{idBalada};"
    ActiveRecord::Base.connection.exec_query(sql)
  end

  # GET /baladas/new
  def new
    @balada = Balada.new
  end

  # GET /baladas/1/edit
  def edit
  end

  # POST /baladas
  # POST /baladas.json
  def create
    @balada = Balada.new(balada_params)

    respond_to do |format|
      if @balada.save
        format.html { redirect_to @balada, notice: 'Balada was successfully created.' }
        format.json { render :show, status: :created, location: @balada }
      else
        format.html { render :new }
        format.json { render json: @balada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baladas/1
  # PATCH/PUT /baladas/1.json
  def update
    respond_to do |format|
      if @balada.update(balada_params)
        format.html { redirect_to @balada, notice: 'Balada was successfully updated.' }
        format.json { render :show, status: :ok, location: @balada }
      else
        format.html { render :edit }
        format.json { render json: @balada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baladas/1
  # DELETE /baladas/1.json
  def destroy
    @balada.destroy
    respond_to do |format|
      format.html { redirect_to baladas_url, notice: 'Balada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comentarios(idBalada)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM AvaliacaoBalada WHERE idBalada = #{idBalada};"
    ActiveRecord::Base.connection.exec_query(sql)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balada
      @connection = ActiveRecord::Base.establish_connection
      sql = "SELECT * FROM Balada INNER JOIN Cadastro ON Balada.idCadastro = Cadastro.idCadastro WHERE(Cadastro.idCadastro = #{params[:id]} && Cadastro.isActive = true);"
      @balada = ActiveRecord::Base.connection.exec_query(sql)
      @balada = @balada.first.symbolize_keys!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balada_params
      params.fetch(:balada, {})
    end
end
