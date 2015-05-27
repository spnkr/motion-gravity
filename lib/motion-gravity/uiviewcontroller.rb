class UIViewController
  def hide_nav
     self.setNavigationBarHidden(true)
  end
  def show_nav
     self.setNavigationBarHidden(false)
  end
  def paste(uiview)
    self.view.paste(uiview)
    uiview
  end
  def views
    self.view.views
  end
  def bcolor=(uicolor)
    self.view.backgroundColor = uicolor
  end
  def bcolor
    self.view.backgroundColor
  end
end