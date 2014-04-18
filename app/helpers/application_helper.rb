module ApplicationHelper

  def create_stars(rating)
    star = "<i class='fa fa-star'></i>"
    (star * rating).html_safe
  end
end
