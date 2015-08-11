
class UIView
  attr_accessor :pasted_content_height
  def paste_next(v,marginBottom:marginBottom)
    self.paste_next(v,marginBottom)
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
  def wiggle
      self.shake(offset: 0.1, repeat: 2, duration: 0.5, keypath: 'transform.rotation')
  end
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
  def pulse(duration=1.0,max=1.5)
    pu = CABasicAnimation.animationWithKeyPath("transform.scale").tap do |q|
        q.duration = duration
        q.toValue = max
        q.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
        q.autoreverses = true
        q.repeatCount = 40
    end


    anl = self.layer.addAnimation(pu,forKey:nil)
    anl
  end

end
