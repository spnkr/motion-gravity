class UIScrollView
  def paste_next(v,marginBottom=0)
    @pasted_content_height ||= 0
    v.frame = v.frame.down(@pasted_content_height)
    pre_pasted_ch = @pasted_content_height
    @pasted_content_height += v.frame.height
    self.contentSize = self.contentSize.taller(@pasted_content_height - pre_pasted_ch)
    @pasted_content_height += marginBottom
    self.contentSize = self.contentSize.taller(marginBottom)
    paste v
  end
end