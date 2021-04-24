# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
Unit.delete_all

YEAR = '2021'
MONTHS = {"Ene": '01',
        "Feb": '02'
    }
CSV.foreach("#{Rails.root}/db/UF2021.csv", headers: true, col_sep: ';') do |row|
    hash = row.to_h
    day = hash[hash.keys.first] #dia
    months = hash.keys[1..2] #ene-feb

    months.each do |m|
        month = MONTHS[m.to_sym]
        period = "#{YEAR}-#{month}-#{day}"
        value = hash[m]
        value.gsub!('.', '').gsub!(',', '.') unless value.nil?

        Unit.create(period: period, value: value)
    end
end