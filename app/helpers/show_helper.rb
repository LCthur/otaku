module ShowHelper
  MONTHS = %w[Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre]

  def which_month(string)
    month = string.split('-')[1].to_i
    return MONTHS[month - 1]
  end

  def which_year(string)
    string.split('-').first.to_i
  end
end
