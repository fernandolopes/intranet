# encoding: utf-8
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
orgao = Frequencia::Orgao.create([ {:orgao => 'PGM', :descricao => 'Procuradoria Geral do Município de Fortaleza'} ])

setor = Frequencia::Setor.create([ { :orgao_id => '1', :setor => 'CPD', :descricao => 'Central de Processamentos de Dados' } ])

setorpja = Frequencia::Setor.create([ { :orgao_id => '2', :setor => 'PJA', :descricao => 'Procuradoria Juridico Administrativo' } ])

profissao = Frequencia::Profissao.create([ { :profissao => 'Programador', :descricao => 'Desenvolvedor Web em Ruby'} ])

cargo = Frequencia::TipoDeContratacao.create([{:titulo => 'TERCERIZADO', :descricao => 'Cargo tercerizado'}, {:titulo => 'COMISSIONADO', :descricao => 'Cargo comissionado'}])

user = User.create( {:email => 'fernandolopes.s@gmail.com',
                          :password =>'master',
                          :password_confirmation => 'master',
                          :nome => 'Fernando',
                          :setor_id => 2,
                          :profissao_id => 1,
                          :matricula => '789672',
                          :role => 'moderador',
                          :tipo_de_contratacao_id => 2} )

user = User.create( {:email => 'herminio.torres@pgm.fortaleza.ce.gov.br',
                           :password =>'master',
                           :password_confirmation => 'master',
                           :nome => 'Herminio',
                           :setor_id => 2,
                           :profissao_id => 1,
                           :matricula => '84411',
                           :role => 'administrador',
                           :tipo_de_contratacao_id => 2} )





















