motion-gravity
==============

Helpers for RubyMotion.

Todo: document more of this

# Examples
## Animate switching root view controllers
`App.delegate.changeRootViewController(new_root)`

## UIView
- add/remove a spinner: view.spin and view.spin!
- present as a blurred modal (using uieffectviews)
- add gradients to the background: view.addBackgroundGradient([:red.uicolor,:green.uicolor,:black.uicolor])
- and more

``` ruby
view = UIView.alloc.init

view.paste(foo)         #instead of view.addSubview(foo)
view.lift               #instead of view.removeFromSuperview

view.round!             #rounds the view. pass an integer to set radius (default = 5)
view.interact!(true)    #instead of view.setUserInteractionEnabled(true)
view.interact!(false)   #instead of view.setUserInteractionEnabled(false)
```



##UIViewController
``` ruby
controller = UIViewController.alloc.init

controller.paste(foo)        #instead of controller.view.addSubview(foo)
controller.bcolor = foo      #instead of controller.view.backgroundColor = foo
```



##UIColor
```ruby
:orange.color