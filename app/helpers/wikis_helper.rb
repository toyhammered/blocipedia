module WikisHelper

  def creator_or_editor?(names)
    return "" if names.empty?
    if names.is_a?(String)
      content_tag :tr do
        content_tag(:td, names, class: 'text-center')
      end
    else
        content_tag :tr do
           names.collect {|name| concat content_tag(:td, User.find(name.user_id).email, class: 'text-center') }
        end

    end
  end

end
