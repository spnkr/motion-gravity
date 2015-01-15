
class UIView
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
  def pulse
    pu = CABasicAnimation.animationWithKeyPath("transform.scale").tap do |q|
        q.duration = 1.0
        q.toValue = 1.5
        q.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
        q.autoreverses = true
        q.repeatCount = 40
    end


    anl = self.layer.addAnimation(pu,forKey:nil)
    anl
  end

end