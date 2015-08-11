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
    uiv
  end
  def topLeftInView(inview,topo,lefto)
    uiv = self.uiimageview
    uiv.frame = [[lefto,topo],[uiv.frame.width,uiv.frame.height]]
    uiv
  end
end