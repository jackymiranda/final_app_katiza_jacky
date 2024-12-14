class MiscController < ApplicationController
  def home
    render({ :template => "misc_templates/home"})
  end

  def about
    render({ :template => "misc_templates/about"})
  end

  def contact
    render({ :template => "misc_templates/contact"})
  end
end
