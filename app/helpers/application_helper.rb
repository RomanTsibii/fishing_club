module ApplicationHelper
  def bool_translate(expression)
    return t 'true' if expression

    t 'false'
  end
end
