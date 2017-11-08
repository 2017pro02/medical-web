module ApplicationHelper
  def field_class(resource, field_name)
    if resource.errors[field_name].present?
      "is-invalid"
    else
      ""
    end
  end
end
