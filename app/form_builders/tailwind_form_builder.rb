class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  # Class sets:
  INPUT_CLASSES = %w[
    bg-gray-50
    border
    border-gray-300
    text-gray-900
    text-sm
    rounded-lg
    focus:ring-blue-500
    focus:border-blue-500
    block
    w-full
    p-3
    dark:bg-gray-700
    dark:border-gray-600
    dark:placeholder-gray-400
    dark:text-white
    dark:focus:ring-blue-500
    dark:focus:border-blue-500'
  ].freeze

  def text_field(method, options = {})
    options[:class] = [
      INPUT_CLASSES,
      options[:class]
    ].compact.join(" ")

    super
  end

  def collection_select(
    method,
    collection,
    value_method,
    text_method,
    options = {},
    html_options = {}
    )
    html_options[:class] = [
      INPUT_CLASSES,
      html_options[:class]
    ].compact.join(" ")

    super
  end

  def label(method, text = nil, options = {}, &block)
    options[:class] = [
      "block mb-2 text-lg font-medium text-gray-900 dark:text-gray-400",
      options[:class]
    ].compact.join(" ")

    super
  end

  # TODO
  def merge_classes(default_classes, custom_classes)
    [*default_classes, custom_classes].compact.join(" ")
  end

  # TODO, add custom styling for these form elements:
  # email_field, password_field, select, textarea, submit
  # Each time, check what parameters are required (is &block one of them?)
  # submit classes:
  # "mb-2 bg-blue-600 hover:bg-blue-800 w-fit-content text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
end