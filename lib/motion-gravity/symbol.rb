class Symbol
  def color
    self.uicolor
  end
  def icolor
    self.uiimage.uicolor
  end
  def colori
    self.uiimage.uicolor
  end
  def image
    self.uiimage
  end
  def imagev
    v=self.uiimage.uiimageview
    v.setUserInteractionEnabled true
    v
  end
  def imageview
    v=self.uiimage.uiimageview
    v.setUserInteractionEnabled true
    v
  end
  def jpg
    "#{self}.jpg".uiimage
  end
  def button
    n = self.uiimage.button
  end
end