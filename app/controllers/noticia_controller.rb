class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]
  include NoticiaHelper
  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.all
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
    #@var = JSON.parse(File.read("public/DatasB/records/#{params[:id].to_i}.json"), object_class: OpenStruct)
  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @noticium = Noticium.new(noticium_params)

    respond_to do |format|
      if @noticium.save
        format.html { redirect_to @noticium, notice: 'Noticium was successfully created.' }
        format.json { render :show, status: :created, location: @noticium }
      else
        format.html { render :new }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to @noticium, notice: 'Noticium was successfully updated.' }
        format.json { render :show, status: :ok, location: @noticium }
      else
        format.html { render :edit }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticium.destroy
    if File.exist?("public/DatasB/records/#{params[:id].to_i}.json")
      File.delete("public/DatasB/records/#{params[:id].to_i}.json")
    end
    respond_to do |format|
      format.html { redirect_to noticia_url, notice: 'Noticium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      #@noticium = Noticium.find(params[:id])
      if action_name == 'edit' || action_name == 'update' || action_name == 'destroy'
        @noticium = Noticium.find(params[:id])
      else
        if !File.exist?("public/DatasB/records/#{params[:id].to_i}.json")
          cache_record(@noticium = Noticium.find(params[:id]))
        end
        @noticium = JSON.parse(File.read("public/DatasB/records/#{params[:id].to_i}.json"), object_class: OpenStruct)
      end      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:titulo, :descripcion, :iframe, :categoria, :publicar, :visible, :usuario)
    end
end
