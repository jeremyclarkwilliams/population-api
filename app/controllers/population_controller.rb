class PopulationController < ApplicationController

    def index
        @zips = Zip.all
        @cbsas = Cbsa.all
    end

    def get_csv
        zip_file = File.new('vendor/zip_to_cbsa.csv')
        cbsa_file = File.new('vendor/cbsa_to_msa.csv')

        Zip.my_import(zip_file)
        Cbsa.my_import(cbsa_file)
        redirect_to action: 'index'
    end

    def get_pop
        zips = Zip.all
        cbsas = Cbsa.all

        redirect_to action: 'index', @data => zips
    end

end
