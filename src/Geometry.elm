module Geometry exposing (..)

import Html.Attributes exposing (shape)


type Point
    = Point ( Float, Float )


type Vector
    = Vector ( Float, Float )


type Rect
    = Rect Point Point


type Circle
    = Circle Point Distance


type Distance
    = Meters Float


type Area
    = Meters2 Float


type Shape
    = Circle_ Circle
    | Rect_ Rect


area : Shape -> Area
area shape =
    case shape of
        Circle_ c ->
            circleArea c

        Rect_ r ->
            rectArea r


circleArea : Circle -> Area
circleArea (Circle _ (Meters r)) =
    Meters2 (2 * pi * r * r)


rectArea : Rect -> Area
rectArea (Rect (Point ( x, y )) (Point ( u, z ))) =
    -- A (x,y)   .----------.
    --           |          |
    --           |          |
    --           `----------` B (u, z)
    Meters2 (abs (x - u) * abs (y - z))


origin : Point
origin =
    Point ( 0, 0 )


pointA : Point
pointA =
    Point ( 2, 1 )


pointB : Point
pointB =
    Point ( 2, 3 )


newVec : Point -> Point -> Vector
newVec (Point ( ax, ay )) (Point ( bx, by )) =
    Vector ( bx - ax, by - ay )


translate : Vector -> Point -> Point
translate (Vector ( vx, vy )) (Point ( px, py )) =
    Point ( vx + px, vy + py )


newPointA : Point
newPointA =
    translate (newVec origin pointB) pointA
