# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Classificacao.create(:id => 1, :descricao => "Livre para todos os publicos")
Classificacao.create(:id => 2, :descricao => "Inadequado para menores de 10 anos")
Classificacao.create(:id => 3, :descricao => "Inadequado para menores de 12 anos")
Classificacao.create(:id => 4, :descricao => "Inadequado para menores de 14 anos")
Classificacao.create(:id => 5, :descricao => "Inadequado para menores de 16 anos")
Classificacao.create(:id => 6, :descricao => "Inadequado para menores de 18 anos")
