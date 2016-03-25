class StatusBar
    class << self
      def bar
        UIApplication.sharedApplication.statusBar
      end
      def window
        UIApplication.sharedApplication.statusBarWindow
      end
        def hide(animated=false)
            UIApplication.sharedApplication.setStatusBarHidden(true,animated:animated)
        end
        def show(animated=false)
            UIApplication.sharedApplication.setStatusBarHidden(false,animated:animated)
        end

    end
end