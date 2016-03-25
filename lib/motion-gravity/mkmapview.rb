
# class MKMapView
#   def ne_sw_coord_visible_map_rect
#     mRect = self.visibleMapRect
#     neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y)
#     swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect))
#     neCoord = MKCoordinateForMapPoint(neMapPoint)
#     swCoord = MKCoordinateForMapPoint(swMapPoint)
#   end
# end