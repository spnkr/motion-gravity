class StatusBar
    class << self
        def hide(animated=false)
            UIApplication.sharedApplication.setStatusBarHidden(true,animated:animated)
        end
        def show(animated=false)
            UIApplication.sharedApplication.setStatusBarHidden(false,animated:animated)
        end

    end
end