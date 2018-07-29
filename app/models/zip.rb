class Zip < ApplicationRecord

    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/sqlite3_adapter'

    def self.my_import(file)

        zips = []
        CSV.foreach(file.path, headers: true, header_converters: [:downcase, :symbol], encoding: 'ISO-8859-1') do |row|
            zip_hash = row.to_hash
            zips << Zip.new({
                zip: zip_hash[:zip],
                cbsa: zip_hash[:cbsa]
            })
        end
        Zip.import zips
        
    end

end
