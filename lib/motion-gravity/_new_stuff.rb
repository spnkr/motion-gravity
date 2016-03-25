class UIView
  
  def autoresize_hv
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
    self
  end
  def autoresize_h
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    self
  end
  def autoresize_v
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
    self
  end



  # void)jumpToPage:(NSNumber *)page{
  #     NSLog(@"jump to page");
  #     float offset=30;
  #     float height = self.scrollView.bounds.size.height;
  #     float width = 320 - (2*offset);
  #     int pagee = [page intValue] - 1;
  #     float x  = (320 * pagee) + offset;

  #     NSLog(@"X is %f",x);
  #     [self.scrollView scrollRectToVisible:CGRectMake(x, 0, width , height) animated:NO];

  # }



end
