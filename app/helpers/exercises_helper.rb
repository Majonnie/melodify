module ExercisesHelper
  def sort_link(column:, label:)
    link_to(label, list_exercises_path(column: column, direction: next_direction))
  end

  def next_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator(direction)
    base_classes = "relative w-0 h-0 left-1/2 border-6 border-transparent"

    case direction
      when 'desc'
        classes = "#{base_classes} top-3 border-t-8 border-t-black dark:border-t-gray-400"
      when 'asc'
        classes = "#{base_classes} bottom-3 border-b-8 border-b-black dark:border-b-gray-400"
      else
        classes = base_classes
      end

    tag.span(class: classes)
  end
end
