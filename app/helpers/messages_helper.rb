module MessagesHelper
  def message_box(message, current_user_id)
    content_tag(:div, class: "message #{class_owner(message, current_user_id)}") do
      content_tag(:div, class: "avatar-icon #{class_pull(message, current_user_id)}") do
        image_tag("avatar-default.png", size: "50", alt: "avatar icon")
      end +
      content_tag(:div, class: "text-container #{class_triangle(message, current_user_id)} #{class_pull(message, current_user_id)}") do
        content_tag(:span, class: "card-text lead text") do
          message.content
        end
      end
    end
  end

  private
    def owner?(message, current_user_id)
      curr_user = User.find(current_user_id)
      message.user == curr_user
    end
    def class_owner(message, current_user_id)
      "owner" if owner?(message, current_user_id)
    end
    def class_pull(message, current_user_id)
      owner?(message, current_user_id) ? "float-right" : "float-left"
    end
    def class_triangle(message, current_user_id)
      owner?(message, current_user_id) ? "triangle-right right" : "triangle-right left"
    end
end
