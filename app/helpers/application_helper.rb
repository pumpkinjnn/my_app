module ApplicationHelper

  # Returns the full titleon a per-page basis
  def full_title(page_title = '')
    base_title = "Nannan"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
