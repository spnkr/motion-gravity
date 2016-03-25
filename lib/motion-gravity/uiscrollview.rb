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

  def paste_next_h(iv,marginRight=0,&block)
    v = UIView.alloc.initWithFrame(self.frame)
    v.frame.width = $w.width
    v.frame.y = 0
    v.paste iv
    iv.autoresize_hv
    block.call(v) if block_given?

    @pasted_content_width ||= 0
    v.frame = v.frame.right(@pasted_content_width)
    pre_pasted_ch = @pasted_content_width
    @pasted_content_width += v.frame.width
    self.contentSize = self.contentSize.wider(@pasted_content_width - pre_pasted_ch)
    @pasted_content_width += marginRight
    self.contentSize = self.contentSize.wider(marginRight)
    paste v
  end
end