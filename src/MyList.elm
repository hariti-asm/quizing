module MyList exposing (..)

import Html exposing (a)
import List exposing (filter)


head : List a -> Maybe a
head xs =
    case xs of
        x :: _ ->
            Just x

        [] ->
            Nothing


tail : List a -> Maybe (List a)
tail xs =
    case xs of
        --  1 :: [2, 3]
        _ :: others ->
            Just others

        [] ->
            Nothing


member : a -> List a -> Bool
member x xs =
    case xs of
        [] ->
            False

        first :: others ->
            x == first || member x others


drop : Int -> List a -> List a
drop n xs =
    case ( n, xs ) of
        ( 0, _ ) ->
            xs

        ( _, [] ) ->
            []

        ( _, _ :: others ) ->
            drop (n - 1) others


take : Int -> List a -> List a
take n xs =
    case ( n, xs ) of
        ( _, [] ) ->
            []

        ( 0, _ ) ->
            []

        ( _, first :: others ) ->
            if n < 0 then
                []

            else
                first :: take (n - 1) others


filter : (a -> Bool) -> List a -> List a
filter f xs =
    case xs of
        [] ->
            []

        first :: others ->
            if f first then
                first :: filter f others

            else
                filter f others


not_ bool =
    if bool then
        False

    else
        True


partition : (a -> Bool) -> List a -> ( List a, List a )
partition f xs =
    ( filter f xs
    , filter (not << f) xs
    )


partition2 : (a -> Bool) -> List a -> ( List a, List a )
partition2 f xs =
    partitionHeler f xs ( [], [] )


partitionHeler : (a -> Bool) -> List a -> ( List a, List a ) -> ( List a, List a )
partitionHeler f xs ( winners, losers ) =
    case xs of
        [] ->
            ( reverse winners, reverse losers )

        first :: others ->
            if f first then
                partitionHeler f others ( first :: winners, losers )

            else
                partitionHeler f others ( winners, first :: losers )


reverse : List a -> List a
reverse xs =
    case xs of
        [] ->
            []

        first :: others ->
            reverse others ++ [ first ]


range : Int -> Int -> List Int
range start end =
    if start > end then
        []

    else
        start :: range (start + 1) end


max : List comparable -> Maybe comparable
max xs =
    case xs of
        [] ->
            Nothing

        first :: [] ->
            Just first

        first :: second :: others ->
            if first > second then
                max (first :: others)

            else
                max (second :: others)


minimum : comparable -> comparable -> Maybe comparable
minimum a b =
    if a < b then
        Just a

    else
        Just b



-- sum : List number -> number
-- sum numbers =
--     List.foldl (+) 0 numbers


sum : List number -> number
sum a =
    case a of
        [] ->
            0

        x :: xs ->
            x + sum xs


sum_ xs =
    List.foldl (\x acc -> x) 1 xs


product xs =
    List.foldl (*) 0 xs


append : List a -> List a -> List a
append xs_ ys_ =
    case ( xs_, ys_ ) of
        ( [], [] ) ->
            []

        ( xs, [] ) ->
            xs

        ( [], ys ) ->
            ys

        ( x :: xs, ys ) ->
            x :: append xs ys


append_ : List a -> List a -> List a
append_ xs ys =
    List.foldr (\x acc -> x :: acc) ys xs


concat : List (List a) -> List a
concat xs =
    case xs of
        [] ->
            []

        first :: [] ->
            first

        first :: second :: others ->
            append (append first second) (concat others)


concat2 xs =
    List.foldr append [] xs


map_ f xs =
    List.foldr (\x acc -> f x :: acc) [] xs


concatMap : (a -> List b) -> List a -> List b
concatMap f xs =
    concat (map f xs)


map : (a -> b) -> List a -> List b
map f xs =
    case xs of
        [] ->
            []

        first :: others ->
            f first :: map f others


all : (a -> Bool) -> List a -> Bool
all f xss =
    case xss of
        [] ->
            True

        first :: others ->
            if f first then
                all f others

            else
                False


any : (a -> Bool) -> List a -> Bool
any f xss =
    case xss of
        [] ->
            False

        first :: others ->
            if f first then
                True

            else
                any f others
