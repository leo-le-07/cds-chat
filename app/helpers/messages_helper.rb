module MessagesHelper
  def owner?(message)
    message.user == current_user
  end
  def class_owner(message)
    "owner" if owner?(message)
  end
  def class_pull(message)
    owner?(message) ? "float-right" : "float-left"
  end
  def class_triangle(message)
    owner?(message) ? "triangle-right right" : "triangle-right left"
  end
  def message_box(message)
    content_tag(:div, class: "message #{class_owner(message)}") do
      content_tag(:div, class: "avatar-icon #{class_pull(message)}") do
        image_tag("avatar-default.png", size: "50", alt: "avatar icon")
      end +
      content_tag(:div, class: "text-container #{class_triangle(message)} #{class_pull(message)}") do
        content_tag(:span, class: "card-text lead text") do
          message.content
        end
      end
    end
  end
end
