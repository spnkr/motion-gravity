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
  def add_background_gradient(colors=[])
    @_background_gradients = [] if @_background_gradients.nil?
    gradient = CAGradientLayer.layer
    gradient.frame = self.view.bounds
    gradient.colors = colors.map{|col| col.uicolor.cgcolor}
    @_background_gradients.push gradient
    self.view.layer.insertSublayer(gradient, atIndex:0)
  end
end