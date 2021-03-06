class UIImage
  def hCenteredInView(inview,args={})
    topMargin = args[:topMargin] || 0
    uiv = self.uiimageview
    uiv.frame = uiv.frame.centered_in(CGRectMake(0,0,inview.width,uiv.height))
    uiv.frame = uiv.frame.down(topMargin)
    uiv
  end
  def hvCenteredInView(inview,args={})
    topMargin = args[:topMargin] || 0
    uiv = self.uiimageview
    uiv.frame = uiv.frame.centered_in(CGRectMake(0,0,inview.width,inview.height))
    uiv.frame = uiv.frame.down(topMargin)
    uiv
  end
  def topRightInView(inview,topo,righto)
    uiv = self.uiimageview
    uiv.frame = [[inview.frame.width - uiv.frame.width - righto,topo],[uiv.frame.width,uiv.frame.height]]
    mx = UIView.alloc.initWithFrame(uiv.frame).tap do |z|
      z.setUserInteractionEnabled true
      uiv.frame = [[0,0],[uiv.frame.width,uiv.frame.height]]
      z.paste uiv
    end
    mx
  end
  def topLeftInView(inview,topo,lefto)
    uiv = self.uiimageview
    uiv.bcolor = :white.uicolor(0)
    uiv.frame = [[lefto,topo],[uiv.frame.width,uiv.frame.height]]
    uiv
  end

  def autoscale(args={})
    twidth = args[:width] || 0
    theight = args[:height] || 0
    if twidth > 0
      factor = if self.width > twidth
        twidth.to_f/self.width
      else
        twidth.to_f/self.width
      end
      self.scale_to(self.size * factor)
    else
      App.alert("no height for autoscale yet!")
      self
    end
  end
end