module Route exposing (Route(..), fromUrl, href, replaceUrl)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (..)
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string)

-- ROUTING

type Route
  = Home
  | Queue

parser : Parser (Route -> a) a
parser =
  oneOf
    [ map Home Parser.top
    , map Queue (s "queue")
    ]

-- PUBLIC HELPERS

href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    -- The RealWorld spec treats the fragment like a path.
    -- This makes it *literally* the path, so we can proceed
    -- with parsing as if it had been a normal path all along.
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser


-- INTERNAL

routeToString : Route -> String
routeToString page =
  let
    pieces =
      case page of
        Home ->
          []
        Queue ->
          [ "/queue" ]
  in
  "#/" ++ String.join "/" pieces