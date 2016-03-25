class UIView
  def no_touch
    self.setUserInteractionEnabled(false)
  end
  def yes_touch
    self.setUserInteractionEnabled(true)
  end
  def make_text_for_pasting(text,args={})
    label = UILabel.alloc.initWithFrame([[(args[:padding] || 20), 0], [self.width-((args[:padding] || 20)*2), 9999]]).tap do |z|
      z.lineBreakMode = NSLineBreakByWordWrapping
      z.text = text
      z.font = args[:font] || UIFont.medium((args[:size] || 18)) 
      z.color = (args[:color] || :black.uicolor)
      z.numberOfLines = 0
      z.textAlignment = (args[:align] || :center).uialignment
      old_frame = z.frame
      z.sizeToFit 
      new_height = z.frame.size.height
      z.frame = [[args[:padding] || 20,0],[self.width-((args[:padding] || 20)*2),new_height]]
    end
    label
  end
  def paste_text(text,args={})
    label = make_text_for_pasting(text,args)
    paste_next label
    label
  end












  # center this uiview in the passed UIView
  def hCenteredInView(inview,args={})
    topMargin = args[:topMargin] || 0
    uiv = self
    uiv.frame = uiv.frame.centered_in(CGRectMake(0,0,inview.width,uiv.height))
    uiv.frame = uiv.frame.down(topMargin)
    uiv
  end
  def hvCenteredInView(inview,args={})
    topMargin = args[:topMargin] || 0
    uiv = self
    uiv.frame = uiv.frame.centered_in(CGRectMake(0,0,inview.width,inview.height))
    uiv.frame = uiv.frame.down(topMargin)
    uiv
  end
  def topRightInView(inview,topo,righto)
    uiv = self
    uiv.frame = [[inview.frame.width - uiv.frame.width - righto,topo],[uiv.frame.width,uiv.frame.height]]
    mx = UIView.alloc.initWithFrame(uiv.frame).tap do |z|
      z.setUserInteractionEnabled true
      uiv.frame = [[0,0],[uiv.frame.width,uiv.frame.height]]
      z.paste uiv
    end
    mx
  end
  def topLeftInView(inview,topo,lefto)
    uiv = self
    
    uiv.bcolor = :white.uicolor(0)
    uiv.frame = [[lefto,topo],[uiv.frame.width,uiv.frame.height]]
    uiv
  end


  attr_accessor :pasted_content_height
  def paste_next(v,marginBottom:marginBottom)
    self.paste_next(v,marginBottom)
  end
  def paste_next_space(height=1)
    self.paste_next(UIView.alloc.initWithFrame([[0,0],[1,1]]),marginBottom:height)
  end
  def paste_next(v,marginBottom=0)
    @pasted_content_height ||= 0
    v.frame = v.frame.down(@pasted_content_height)
    pre_pasted_ch = @pasted_content_height
    @pasted_content_height += v.frame.height
    self.frame = self.frame.taller(@pasted_content_height - pre_pasted_ch)
    @pasted_content_height += marginBottom
    self.frame = self.frame.taller(marginBottom)
    paste v
  end
  def paste_next_hcentered(v)
    
  end
  def paste_next_hvcentered(v)
    
  end



  attr_accessor :blur_overlay_view
  def blur_with_effect(effect)
    ev = UIVisualEffectView.alloc.initWithEffect(effect)
    ev.frame = self.bounds
    self.paste ev
    self.blur_overlay_view = ev
    ev
  end
  def blur_extra_light
    blur_with_effect UIBlurEffect.effectWithStyle(UIBlurEffectStyleExtraLight)
  end
  def blur_light
    blur_with_effect UIBlurEffect.effectWithStyle(UIBlurEffectStyleLight)
  end
  def blur_dark
    blur_with_effect UIBlurEffect.effectWithStyle(UIBlurEffectStyleDark)
  end
  def un_blur
    if !self.blur_overlay_view.nil?
      self.blur_overlay_view.lift
      self.blur_overlay_view = nil
    end
  end

  

  
  def add_motion(dx=10,dy=10)
    x = UIInterpolatingMotionEffect.alloc.initWithKeyPath("center.x", type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis)
        x.minimumRelativeValue = -dx
        x.maximumRelativeValue = dx
        
        y = UIInterpolatingMotionEffect.alloc.initWithKeyPath("center.y", type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis)
        y.minimumRelativeValue = -dy
        y.maximumRelativeValue = dy
        
        self.addMotionEffect(x)
        self.addMotionEffect(y)
  end
  def interact!(m=true)
    self.setUserInteractionEnabled m
  end
  # def wiggle
  # #     self.shake(offset: 0.1, repeat: 2, duration: 0.5, keypath: 'transform.rotation')
  # # end
  def nod
      self.shake(offset: 20, repeat: 10, duration: 5, keypath: 'transform.translation.y')
  end
  def addBottomBorderWithColor(color,andWidth:borderWidth)
      border = CALayer.layer
      border.backgroundColor = color.CGColor

      border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth)
      self.layer.addSublayer(border)
  end
  def paste(uiview)
      self.addSubview(uiview)
      uiview
  end
  def views
      subviews
  end
  def lift
      removeFromSuperview
  end
  def bcolor=(uicolor)
      self.backgroundColor = uicolor
  end
  def bcolor
      self.backgroundColor
  end
  def zoom(args={})
    vw = args[:view] || self
    scale=args[:scale] || 1.0
    alpha=args[:alpha] || 1.0
    duration=args[:duration] || 0.5
    damping = args[:damping] || 0.99
    UIView.animateWithDuration(duration, delay:0, usingSpringWithDamping:damping,initialSpringVelocity:0, options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseInOut, animations: lambda{vw.transform = CGAffineTransform.make(scale: scale); vw.alpha=alpha}, completion:nil)
  end
  def round!(rad=5)
      self.layer.cornerRadius = rad
      self.layer.masksToBounds = false
  end
  def shrink(args={})
      scale=args[:scale] || 0.1
      scale=args[:alpha] || 0
      zoom scale:scale, alpha:alpha
  end
  def explode
      zoom scale:4, alpha:0
  end
  def restore
      zoom scale:1, alpha:1
  end
  def pulse(args={})
    duration = args[:duration] || 1.0
    max_scale = args[:max_scale] || 1.5
    times = args[:times] || 5
    pu = CABasicAnimation.animationWithKeyPath("transform.scale").tap do |q|
        q.duration = duration
        q.toValue = max_scale
        q.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
        q.autoreverses = true
        q.repeatCount = times
    end


    anl = self.layer.addAnimation(pu,forKey:nil)
    @animation_underlying = anl
  end
  def unpulse
    unless @animation_underlying.nil?
      @animation_underlying.removeAllAnimations
    end
  end
  def shadow(args={})
      self.layer.shadowOpacity = 1.0
      self.layer.shadowRadius = args[:radius] || 5
      self.layer.shadowOffset = [0,0]
      self.layer.shadowColor = :black.uicolor.CGColor
      # self.layer.shouldRasterize = true
  end

end




class UIView
    attr_accessor :spinner
    def spin(scolor=:white,sdimens=30)
        if !self.spinner.nil?
            self.spinner.stopAnimating
            self.spinner.lift
            self.spinner = nil
        end
        self.spinner = MMMaterialDesignSpinner.alloc.initWithFrame([[0, 33.5], [sdimens, sdimens]])
        self.spinner.lineWidth = 4.5
        self.spinner.tintColor = scolor.uicolor
        self.spinner.hvCenteredInView(self)
        self.paste self.spinner
        self.spinner.startAnimating
        self.spinner
    end
    def dont_spin
      un_spin
    end
    def unspin
      un_spin
    end
    def spin!
      un_spin
    end
    def un_spin
        if !self.spinner.nil?
            self.spinner.stopAnimating
            self.spinner.lift
            self.spinner = nil
        end
    end
end