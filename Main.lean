def joinStringWith (d: String) (f: String) (s: String) :=
  String.append f (String.append d s)
example : String -> String -> String -> String := joinStringWith

#check (joinStringWith ": ")
#eval joinStringWith " " "some" "thing"

def volume (l: Nat) (w: Nat) (h: Nat) : Nat :=
  l * w * h
example : Nat -> Nat -> Nat -> Nat := volume

#check (volume)
#eval (volume 3 4 5)



def main : IO Unit := do
  IO.println "Hello World!"
