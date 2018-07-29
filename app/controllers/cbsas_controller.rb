class CbsasController < ApplicationController
    def index
        @cbsas = Cbsa.all
    end

    def import
        Cbsa.my_import(params[:file])
        redirect_to root_url, notice: 'Successfully imported data'
    end
end
