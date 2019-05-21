module ShowHelper
  MONTHS = %w[Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre]

  def which_month(number)
    return MONTHS[number-1]
  end
end
