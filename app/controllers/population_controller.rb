class PopulationController < ApplicationController

    def index

        # render file:
        # 'vendor/zip_to_cbsa.csv'

        require 'csv'

        zips = []
        CSV.foreach('vendor/zip_to_cbsa.csv', headers: true, header_converters: [:downcase, :symbol]) do |row|
            zip_hash = row.to_hash
            zips << Zip.new({zip: zip_hash[:zip], cbsa: zip_hash[:cbsa]})
        end
        Zip.import zips

    end

    def getCsv

        require 'csv'

        CSV.foreach('https://s3.amazonaws.com/peerstreet-static/engineering/zip_to_msa/zip_to_cbsa.csv', :headers => true) do |row|
            Moulding.create!(row.to_hash)
        end

    end

end
