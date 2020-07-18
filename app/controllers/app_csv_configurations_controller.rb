class AppCsvConfigurationsController < ApplicationController
  before_action :set_app_csv_configuration, only: [:show, :edit, :update, :destroy]

  # GET /app_csv_configurations
  # GET /app_csv_configurations.json
  def index
    @app_csv_configurations = AppCsvConfiguration.all
  end

  # GET /app_csv_configurations/1
  # GET /app_csv_configurations/1.json
  def show
  end

  # GET /app_csv_configurations/new
  def new
    @app_csv_configuration = AppCsvConfiguration.new
  end

  # GET /app_csv_configurations/1/edit
  def edit
  end

  # POST /app_csv_configurations
  # POST /app_csv_configurations.json
  def create
    @app_csv_configuration = AppCsvConfiguration.new(app_csv_configuration_params)
    @CSV_File = params[:app_csv_configuration][:ruta]

    respond_to do |format|
      if @app_csv_configuration.save
        file_name_filesystem = GetCsvFileName(@CSV_File.original_filename)
        photo_path_on_filesystem = Rails.root.join('public','CSV', file_name_filesystem)
        File.open(photo_path_on_filesystem,'wb') do |file| 
          file.write(@CSV_File.read)
        end
        format.html { redirect_to @app_csv_configuration, notice: 'App csv configuration was successfully created.' }
        format.json { render :show, status: :created, location: @app_csv_configuration }
      else
        format.html { render :new }
        format.json { render json: @app_csv_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_csv_configurations/1
  # PATCH/PUT /app_csv_configurations/1.json
  def update
    @CSV_File = params[:app_csv_configuration][:ruta]
    respond_to do |format|
      if @app_csv_configuration.update(app_csv_configuration_params)
        file_name_filesystem = GetCsvFileName(@CSV_File.original_filename)
        photo_path_on_filesystem = Rails.root.join('public','CSV', file_name_filesystem)
        File.open(photo_path_on_filesystem,'wb') do |file| 
          file.write(@CSV_File.read)
        end
        format.html { redirect_to @app_csv_configuration, notice: 'App csv configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_csv_configuration }
      else
        format.html { render :edit }
        format.json { render json: @app_csv_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_csv_configurations/1
  # DELETE /app_csv_configurations/1.json
  def destroy
    @app_csv_configuration.destroy
    respond_to do |format|
      format.html { redirect_to app_csv_configurations_url, notice: 'App csv configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_csv_configuration
      @app_csv_configuration = AppCsvConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_csv_configuration_params
      params.require(:app_csv_configuration).permit(:name, :ruta)
    end

    def GetCsvFileName(nameCSV)
      nameFile = ""
      case nameCSV.to_s
      when "smadb.csv"
        nameFile = "db1.csv"
      when "scdb.csv"
        nameFile = "db2.csv" 
      when "smndb.csv"
        nameFile = "db3.csv"
      end
    end
end
