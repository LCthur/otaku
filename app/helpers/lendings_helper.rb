module LendingsHelper
  # take the string date given by flatpickr
  def returning_date(date_string, duration)
    # add loan_duration to the booking date and turn it into a string
    (Date.iso8601(date_string) + duration).to_s
  end

  def date_concat(date_string, duration)
    return_date = returning_date(date_string, duration)
    year = which_year(return_date)
    month = 'essai'
    day = which_day(return_date)
    "#{day} #{month} #{year}"
  end
end
