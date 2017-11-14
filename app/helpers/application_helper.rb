module ApplicationHelper
  def number_to_currency_by_store_currency(value)
    number_to_currency value,
      unit: current_corporate.money_unit,
      separator: current_corporate.money_separator,
      delimiter: current_corporate.money_delimiter
  end
end
