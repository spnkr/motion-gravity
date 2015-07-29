class Tools
  class << self
    def json_resource_to_object(path="preloaded/book_catalog.json")
      json_string = path.resource_url.nsdata.nsstring.dataUsingEncoding(NSUTF8StringEncoding)
      e = Pointer.new(:object)
      json_hash = NSJSONSerialization.JSONObjectWithData(json_string, options:0, error: e)
    end
  end
end