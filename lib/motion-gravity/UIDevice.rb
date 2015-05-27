class UIDevice
  class << self
    def identifierForVendor
      UIDevice.currentDevice.identifierForVendor.UUIDString
    end
    alias_method :pseudo_id, :identifierForVendor
  end
end