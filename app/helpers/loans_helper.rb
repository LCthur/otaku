module LoansHelper
  MONTHS_DOWNCASE = %w[janvier février mars avril mai juin juillet août septembre octobre novembre décembre]
  def which_month_downcased(string)
    month = string.split('-')[1].to_i
    return MONTHS_DOWNCASE[month - 1]
  end

  def which_year(string)
    string.split('-').first.to_i
  end

  def which_day(string)
    string.split('-').last.to_i
  end
end
