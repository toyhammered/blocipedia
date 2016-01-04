module HomeHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def header_type
    if current_page?(root_path) && !user_signed_in?
      '<header role="banner" id="fh5co-header">'.html_safe
    else
      '<header role="banner" id="fh5co-header-other" class="navbar-fixed-top">'.html_safe
    end
  end

end
