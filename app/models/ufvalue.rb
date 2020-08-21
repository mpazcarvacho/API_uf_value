class Ufvalue < ApplicationRecord
  validates :date, uniqueness: true

  def self.load_ufs
    require 'csv'

    csv_text = File.read('tmp/UF-2020.csv')
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")
    csv.each do |rows|
      rows.each_with_index do |row, index| 
        next if index.zero? || row[1].nil? || (3..12).include?(index) #sólo se consideran meses Enero y Febrero
        
        date = Date.new(2020, index, rows[0].to_i)
        uf = row[1].gsub(".","").gsub(",",".")

        Ufvalue.create(date: date, uf: uf.to_f)
        
        #puts "month: #{index} - day: #{rows[0]} - uf: #{row[1]}"
      end
    end
  end

end
