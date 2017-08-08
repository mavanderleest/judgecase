module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Alpharetta, GA | Case Law, PLLC"
    expanded_title = "Georgia Personal Injury, Family, and DUI Lawyer | Alpharetta, GA | Case Law, PLLC"
    if page_title.empty?
      expanded_title
    else
      page_title + " | " + base_title
    end
  end
end
