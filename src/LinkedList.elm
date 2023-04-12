module LinkedList exposing (..)

-- struct LList {
-- value: Int
-- next: Quizes
--}


type LList a
    = Node a (LList a)
    | Null


empty : LList a
empty =
    Null


insert : a -> LList a -> LList a
insert a list =
    case list of
        Null ->
            Node a Null

        _ ->
            Node a list


head : LList a -> Maybe a
head list =
    case list of
        Null ->
            Nothing

        Node a _ ->
            Just a


tail : LList a -> Maybe (LList a)
tail list =
    case list of
        Null ->
            Nothing

        Node _ rest ->
            Just rest


map : (a -> b) -> LList a -> LList b
map f xs =
    case xs of
        Null ->
            Null

        Node a rest ->
            Node (f a) (map f rest)


mapWithFold : (a -> b) -> LList a -> LList b
mapWithFold func xs =
    fold (\x ll -> Node (func x) ll) Null xs


filter : (a -> Bool) -> LList a -> LList a
filter pred xs =
    case xs of
        Null ->
            Null

        Node a rest ->
            if pred a then
                Node a (filter pred rest)

            else
                filter pred rest


toList : LList a -> List a
toList xs =
    case xs of
        Null ->
            []

        Node a rest ->
            a :: toList rest


toListWithFold : LList a -> List a
toListWithFold ll =
    fold (::) [] ll


fromList : List a -> LList a
fromList xs =
    case xs of
        [] ->
            Null

        x :: rest ->
            Node x (fromList rest)


fromListWithFold : List a -> LList a
fromListWithFold xs =
    List.foldr Node Null xs


fold : (a -> b -> b) -> b -> LList a -> b
fold func b ll =
    case ll of
        Null ->
            b

        Node a rest ->
            fold func (func a b) rest


all : (a -> Bool) -> LList a -> Bool
all pred ll =
    fold (\item result -> pred item && result) True ll


all2 : (a -> Bool) -> LList a -> Bool
all2 pred ll =
    map pred ll |> fold (&&) True


any : (a -> Bool) -> LList a -> Bool
any pred ll =
    map pred ll |> fold (||) False
