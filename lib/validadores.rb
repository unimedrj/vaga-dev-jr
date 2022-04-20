class Validadores
  def match_periodo(periodo)
    case periodo
    when /((19|20)\d{2})[\-](0[1-9])|(1[0-2])[\-]\d{2}/ # YYYY-MM-DD
      format_str = '%Y-%m-%d'
    when /((19|20)\d{2})[\-]((0[1-9])|(1[0-2])$)/ # YYYY-MM
      format_str = '%Y-%m'
    when /(\d{2})\/\d{2}\/((19|20)\d{2})/ #DD/MM/YYYY
      format_str = '%d/%M/%Y'
    end

    Date.strptime(periodo, format_str)
  end

  def self.data(data)
    /(((19|20)\d{2})[\-](0[1-9])|(1[0-2])[\-]\d{2}|((19|20)\d{2})[\-]((0[1-9])|(1[0-2])$)|(\d{2})\/\d{2}\/((19|20)\d{2}))/.match?(data)
  end

  def self.valor(valor)
    /([+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+))/.match?(valor)
  end

  def self.email(email)
    /([A-Za-z0-9]*((_*[\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,}))/.match?(email)
  end
end
