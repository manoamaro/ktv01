module ApplicationHelper

  def normalize_arff_type(type)
    case type
      when "Integer", "Double", "Decimal", "Float", "Fixnum"
        return "numeric"
      when "String", "Char", "Text"
        return "string"
      when "Datetime", "Date", "Time"
        return "date"
    end
  end
  
  def to_date_time(date)
    if date.is_a? Time
      date.strftime("%d/%m/%Y, %H:%M")
    else
      date
    end
  end
end
