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
end