
class UILabel
  def headlineForView(inview,args={})
    ns = self.tap do |z|
      z.font = args[:font] || UIFont.title(16) 
      z.color = args[:color].uicolor || :black.uicolor
      z.numberOfLines = 1
      z.adjustsFontSizeToFitWidth = true
      z.textAlignment = :center.uialignment
      z.frame = [[0,0],[(args[:width] || $w.width),500]]
      z
    end

    ns.sizeToFit
    # ns.sizeThatFits(CGRect)
    theight = ns.frame.height
    ns.frame = ns.frame.centered_in(CGRectMake(0,0,(args[:width] || $w.width),theight))
    

    # ns.frame = ns.frame.taller(-(ns.frame.height - theight))
    ns
  end
end
