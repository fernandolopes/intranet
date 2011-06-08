# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'origem', 'origens'
   inflect.irregular 'setor', 'setores'
   inflect.irregular 'profissao', 'profissoes'
   inflect.irregular 'tipo_de_contratacao', 'tipo_de_contratacoes'
#   inflect.uncountable %w( fish sheep )
 end
