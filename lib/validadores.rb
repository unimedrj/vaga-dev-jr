class Validadores
  def match_periodo(periodo)
    case periodo
    when /(^(19|20)\d{2})((0[1-9])|(1[0-2])$)/ # YYYYMM
      format_str = '%Y%m'
    when /(^(19|20)\d{2})[\-]((0?[1-9]|1[012]){1}$)/ # YYYY-mm
      format_str = '%Y-%m'
    end

    Date.strptime(periodo, format_str)
  end

  def self.data(data)
    /^((([1-2][0-9]{3})[\-](0[13578]|10|12)[\-](0[1-9]|1[0-9]|2[0-9]|30|31))|(([1-2][0-9]{3})[\-](0?[469]|11)[\-](0?[1-9]|1[0-9]|2[0-9]|30))|(([1-2][0-9](0[048]|1[26]|2[048]|3[26]|4[048]|5[26]|6[048]|7[26]|8[048]|9[26]))[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-9]))|(([1-2][0-9]{3})[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-8])))$/.match?(data)
  end

  def self.valor(valor)
    /([+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+))/.match?(valor)
  end

  def self.email(email)
    /([A-Za-z0-9]*((_*[\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,}))/.match?(email)
  end
end
