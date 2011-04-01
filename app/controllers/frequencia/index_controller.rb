class Frequencia::IndexController < TemplateController
    before_filter :authenticate_usuario!
end
