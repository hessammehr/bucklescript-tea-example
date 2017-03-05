open Tea.App
open Tea.Html

type msg =
  | Increment  (* This will be our message to increment the counter *)
  | Decrement  (* This will be our message to decrement the counter *)
  | Reset      (* This will be our message to reset the counter to 0 *)
  | Set of int (* This will be out message to set the counter to a specific value *)
  [@@bs.deriving {accessors}]

let init () = 12

(* This is the central message handler, it takes the model as the first argument *)
let update model = function (* These should be simple enough to be self-explanatory, mutate the model based on the message, easy to read and follow *)
  | Increment -> model + 1
  | Decrement -> model - 1
  | Reset -> 0
  | Set v -> v

  (* This is just a helper function for the view, a simple function that returns a button based on some argument *)
let view_button title msg =
  button
    [ onClick msg
    ]
    [ text title
    ]

(* This is the main callback to generate the virtual-dom.
  This returns a virtual-dom node that becomes the view, only changes from call-to-call are set on the real DOM for efficiency, this is also only called once per frame even with many messages sent in within that frame, otherwise does nothing *)
let view model =
  div
    []
    [ span
        [ style "text-weight" "bold" ]
        [ text (string_of_int model) ]
    ; br []
    ; view_button "Increment" Increment
    ; br []
    ; view_button "Decrement" Decrement
    ; br []
    ; view_button "Set to 42" (Set 42)
    ; br []
    ; if model <> 0 then view_button "Reset" Reset else noNode
    ]

let main =
  beginnerProgram { (* The beginnerProgram just takes a set model state and the update and view functions *)
    model = init (); (* Since model is a set value here, we call our init function to generate that value *)
    update;
    view;
  }

let () = 
  let app = main (Web.Document.getElementById "b") in
  app ()
  |> ignore