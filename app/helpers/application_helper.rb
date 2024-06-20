module ApplicationHelper
  def sort_link(column:, label:, path:)
    link_to(label, send(path, { column: column, direction: next_direction }))
  end

  def sort_indicator(direction)
    base_classes = "absolute w-0 h-0 ml-4 border-6 border-transparent"

    case direction
    when 'desc'
      classes = "#{base_classes} top-4 border-t-8 border-t-black dark:border-t-gray-400"
    when 'asc'
      classes = "#{base_classes} bottom-5 border-b-8 border-b-black dark:border-b-gray-400"
    else
      classes = base_classes
    end

    tag.span(class: classes)
  end

  def next_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end

end
