module ApplicationHelper

  def normalize_arff_type(type)
    case type
      when "integer", "double", "decimal", "float"
        return "numeric"
      when "string", "char", "text"
        return "string"
      when "datetime", "date", "time"
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
