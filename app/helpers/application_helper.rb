module ApplicationHelper

  def normalize_arff_type(type)
    puts type
    case type
      when "integer", "double", "decimal", "float"
        return "numeric"
      when "string", "char", "text"
        return "string"
      when "datetime", "date", "time"
        return "date"
    end
  end
end
