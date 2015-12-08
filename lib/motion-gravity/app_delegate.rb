class AppDelegate
  #hi!!
  def changeRootViewController(viewController)
    if !App.window.rootViewController
      App.window.rootViewController = viewController
      return
    end
    snapShot = App.window.snapshotViewAfterScreenUpdates(true)
    viewController.paste snapShot
    App.window.rootViewController = viewController
    UIView.animateWithDuration(1.25, delay:0, options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseInOut, animations: lambda{

      # sublayerTransform = CATransform3DIdentity
      # sublayerTransform.m34 = 10.0 / -1000.0
      # snapShot.layer.sublayerTransform = sublayerTransform


      snapShot.layer.opacity = 0
      snapShot.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
    }, completion:lambda{|finished|
      snapShot.removeFromSuperview
      })
  end
end
