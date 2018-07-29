class Cbsa < ApplicationRecord

    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/sqlite3_adapter'

    def self.my_import(file)

        cbsas = []
        CSV.foreach(file.path, headers: true, header_converters: [:downcase, :symbol], encoding: 'ISO-8859-1') do |row|
            cbsa_hash = row.to_hash
            # if cbsa_hash[:cbsa] != ''
                cbsas << Cbsa.new({
                    cbsa: cbsa_hash[:cbsa],
                    mdiv: cbsa_hash[:mdiv],
                    name: cbsa_hash[:name],
                    lsad: cbsa_hash[:lsad],
                    popestimate2014: cbsa_hash[:popestimate2014],
                    popestimate2015: cbsa_hash[:popestimate2015]
                })
            # end
        end
        Cbsa.import cbsas
        
    end

end
