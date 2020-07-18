class PagesController < ApplicationController
    require 'csv'
    require 'json'

    def show
        #Verificar parametro de configuracion
        configuration_id = 1
        #Obtener parametro si no esta vacio
        if params[:id] != nil         
            case params[:id].to_i
            when 1
                #puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Set time to 5 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                configuration_id = 1
            when 2
                #puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Set time to 10 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                configuration_id = 2
            when 3
                #puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Set time to 5 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                configuration_id = 3
            end
        end
        puts "<<<<<<<<<<<<<<<<<<<   #{ readCSV()} >>>>>>>>>>>>>>>>>>>>>" 
        @sorteo = AppConfiguration.find(configuration_id)
        @banners = [AppConfiguration.find(1).sorteo_banner_url, AppConfiguration.find(2).sorteo_banner_url]
        @databaseName = "db#{configuration_id}.csv"
        if valid_page?
            render template: "pages/#{params[:page]}"
        else
            render file: "public/404.html", status: :not_found
        end
    end

    private
    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

    def readCSV
        
    end
end