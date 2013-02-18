module SiteHelpers

  def page_title
    title = "Gedankenwerk. Agentur f&uuml;r neue Medien"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Beschreibung"
    end
    description
  end

end
