class FestaController < ApplicationController
  before_action :set_festa, only: [:show, :edit, :update, :destroy]

  # GET /festa
  # GET /festa.json
  # todas festas ativas
  def index
    @connection = ActiveRecord::Base.establish_connection
    sql = 'SELECT idFesta, nome, data, hora, tipo_bar, idBalada FROM Festa WHERE (data BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 100 DAY) && isActive = true) ORDER BY data ASC;'
    @festas = ActiveRecord::Base.connection.exec_query(sql)
  end

  # GET /festa/1
  # GET /festa/1.json
  def show
    @comentarios = comentarios(params[:id])
  end

  # GET /festa/new
  def new
    @festa = Festa.new
  end

  def search
    @nome = params[:festa] ? params[:festa] : ''
    @data_inicio = params[:data_inicio] ? params[:data_inicio] : Time.now.strftime('%Y-%m-%d')
    @data_fim = params[:data_fim] ? params[:data_fim] : (Time.now + 30.days).strftime('%Y-%m-%d')
    data_inicio = @data_inicio#.to_formatted_s(:db)
    data_fim = @data_fim#.to_formatted_s(:db)
    tipo_bar = if params[:tipo_bar] == 'Qualquer um' then'true || false'
              elsif params[:tipo_bar] == 'Open bar' then true
              else false
              end

    @connection = ActiveRecord::Base.establish_connection
    @sql = "SELECT idFesta, nome, data, hora, tipo_bar, idBalada
           FROM Festa
           WHERE(
            nome LIKE '%#{@nome}%' &&
            data BETWEEN '#{data_inicio}' AND '#{data_fim}' &&
            isActive = true
            ) ORDER BY data ASC;"# &&

            # BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 100 DAY &&
            # isActive = true)
          # ) ORDER BY data ASC;"
    @festas = ActiveRecord::Base.connection.exec_query(@sql)
  end

  # GET /festa/1/edit
  def edit
  end

  # POST /festa
  # POST /festa.json
  def create
    @festa = Festa.new(festa_params)

    respond_to do |format|
      if @festa.save
        format.html { redirect_to @festa, notice: 'Festa was successfully created.' }
        format.json { render :show, status: :created, location: @festa }
      else
        format.html { render :new }
        format.json { render json: @festa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /festa/1
  # PATCH/PUT /festa/1.json
  def update
    respond_to do |format|
      if @festa.update(festa_params)
        format.html { redirect_to @festa, notice: 'Festa was successfully updated.' }
        format.json { render :show, status: :ok, location: @festa }
      else
        format.html { render :edit }
        format.json { render json: @festa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /festa/1
  # DELETE /festa/1.json
  def destroy
    @festa.destroy
    respond_to do |format|
      format.html { redirect_to festa_url, notice: 'Festa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comentarios(idFesta)
    @connection = ActiveRecord::Base.establish_connection
    sql = "SELECT * FROM AvaliacaoFesta WHERE idFesta = #{idFesta} AND isActive = true;"
    ActiveRecord::Base.connection.exec_query(sql)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festa
      @connection = ActiveRecord::Base.establish_connection
      sql = "SELECT idFesta, nome, data, hora, tipo_bar, idBalada FROM Festa WHERE(idFesta = #{params[:id]} && isActive = true);"
      # @festa = Festa.find(params[:id])
      @festa = ActiveRecord::Base.connection.exec_query(sql)
      @festa = @festa.first.symbolize_keys!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def festa_params
      params.fetch(:festa, {})
    end
end
