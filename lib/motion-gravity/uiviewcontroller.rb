class UIViewController
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