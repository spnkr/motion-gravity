

class UIViewController
  attr_accessor :gradient
  def paste_next(v,marginBottom=0)
    self.view.paste_next(v,marginBottom)
  end
  def paste_next(v,marginBottom:marginBottom)
    self.view.paste_next(v,marginBottom)
  end
  def paste_next_space(height=1)
    self.view.paste_next(UIView.alloc.initWithFrame([[0,0],[1,1]]),marginBottom:height)
  end
  def use_gradient_background
    @gradient = CAGradientLayer.layer
    @gradient.frame = self.view.bounds
    @gradient.colors = [:red.uicolor.cgcolor,"#0A86CB".uicolor.cgcolor]
    self.view.layer.insertSublayer(@gradient, atIndex:0)
  end
#   contributeViewController = vcs.mll
# blurEffect = UIBlurEffect.effectWithStyle(UIBlurEffectStyleLight)
# beView = UIVisualEffectView.alloc.initWithEffect(blurEffect)
# beView.frame = $w.view.bounds

# contributeViewController.view.frame = $w.view.bounds
# contributeViewController.view.backgroundColor = UIColor.clearColor
# a.insertSubview(vibev, atIndex:0)
# contributeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext

# $nc.presentViewController(contributeViewController, animated:true, completion:nil)

# blurEffect = UIBlurEffect.effectWithStyle(UIBlurEffectStyleLight)
# vibev = UIVisualEffectView.alloc.initWithEffect(UIVibrancyEffect.effectForBlurEffect(blurEffect))
# vibev.frame = [[0,0],[$w.width,200]]

# var vibrancyEffect = (forBlurEffect: blurEffect)
# var vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
# vibrancyEffectView.frame = view.bounds



# contributeViewController

# $nc.presentViewController(contributeViewController, animated:true, completion:nil)


  def addBlurModalSupport(viewcontroller,args={})
    style = args[:style] || UIBlurEffectStyleLight
    if style==:light
      style=UIBlurEffectStyleLight
    elsif style==:dark
      style=UIBlurEffectStyleDark
    end

    contributeViewController = viewcontroller
    blurEffect = UIBlurEffect.effectWithStyle(style)
    beView = UIVisualEffectView.alloc.initWithEffect(blurEffect)
    beView.frame = $nc.view.bounds
    contributeViewController.view.frame = $nc.view.bounds
    contributeViewController.view.backgroundColor = UIColor.clearColor
    contributeViewController.view.insertSubview(beView, atIndex:0)
    contributeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext
  end

  def presentBlurred
    raise "no"
    $nc.presentViewController(self, animated:true, completion:nil)
  end
  def dismissBlurred
    raise "no"
    self.dismiss_modal
    self.dismissViewControllerAnimated(true,completion:lambda{App.alert('dd')})
  end



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