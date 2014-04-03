module ApplicationHelper
  def entry_types
    Reference.entry_types.map { |et| et.singularize }
  end
end

