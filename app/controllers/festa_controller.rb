class FestaController < ApplicationController
  before_action :set_festa, only: [:show, :edit, :update, :destroy]

  # GET /festa
  # GET /festa.json
  # todas festas ativas
  def index
    @connection = ActiveRecord::Base.establish_connection
    sql = 'SELECT idFesta, nome, data, hora, tipo_bar, idBalada FROM Festa WHERE isActive = true;'
    @festa = ActiveRecord::Base.connection.exec_query(sql)
  end

  # GET /festa/1
  # GET /festa/1.json
  def show
  end

  # GET /festa/new
  def new
    @festa = Festa.new
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
