# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

origens = Fichario::Origem.create([  { :descricao => 'AMC' },
                                     { :descricao => 'FUNCET' },
                                     { :descricao => 'FUNCI' },
                                     { :descricao => 'GABINETE' },
                                     { :descricao => 'GUARDA MUNICIPAL' },
                                     { :descricao => 'IJF'},
                                     { :descricao => 'IMPARH'},
                                     { :descricao => 'IPEM'},
                                     { :descricao => 'IPM'},
                                     { :descricao => 'PGM'},
                                     { :descricao => 'SAM'},
                                     { :descricao => 'SDE'},
                                     { :descricao => 'SEFIN'},
                                     { :descricao => 'SEINF'},
                                     { :descricao => 'SEMAM'},
                                     { :descricao => 'SEPLA'},
                                     { :descricao => 'SER I'},
                                     { :descricao => 'SER II'},
                                     { :descricao => 'SER III'},
                                     { :descricao => 'SER IV'},
                                     { :descricao => 'SER V'},
                                     { :descricao => 'SER VI'},
                                     { :descricao => 'SME'},
                                     { :descricao => 'SMS'} ])

assuntos = Fichario::Assunto.create([ {:descricao => 'Aposentadoria volun. p/ tempo de contri.'},
                                      {:descricao => 'Aposentadoria p/ idade'},
                                      {:descricao => 'Aposentadoria compulsória'},
                                      {:descricao => 'Aposentadoria p/ invalidez'} ])

tipo_andamentos = Fichario::Andamento.create([ {:descricao =>	'Distribuído p/ Dr.(a)'},
                                               {:descricao => 'Redistribuído p/ Dr.(a)'},
                                               {:descricao => 'Em diligência a(ao)'},
                                               {:descricao =>	'Retornou de diligência'},
                                               {:descricao =>	'Ao Proc. Geral c/ Parecer N'},
                                               {:descricao =>	'Ao Proc. Geral c/ Despacho'},
                                               {:descricao =>	'Retornou p/ reexame'},
                                               {:descricao =>	'Retornou do IMP p/ reexame'} ])






















