motion-gravity
==============


##UIView
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
