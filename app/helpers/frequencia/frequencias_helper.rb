module Frequencia::FrequenciasHelper

  def meu_valor(ponto, quant)
    verdade = true
    for i in (1..quant)
       if ponto["hora#{i}".to_sym].blank?
         verdade = false
       end
    end

    if  (ponto[:total_geral].blank? and ponto[:justificativa].blank?) or (!verdade and ponto[:justificativa].blank?)
      valor = 'Inconsistente'
    elsif !ponto[:justificativa].blank?
      valor = ponto[:justificativa]
    else
      valor = ponto[:total_geral]
    end
    return valor

  end
end
