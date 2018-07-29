class ZipsController < ApplicationController
    def index
        @zips = Zip.all
    end

    def import
        Zip.my_import(params[:file])
        redirect_to root_url, notice: 'Successfully imported data'
    end
end
