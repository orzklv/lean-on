structure Something where
  Some : String
  Thing : String

def Str : Type := String
def something : Str := "something"

def FNumber : Type := Nat
def number : FNumber := (38 : Nat)

abbrev FdNumber : Type := Nat
def fnumber : FdNumber := 29

def main : IO Unit := do
  IO.println "Hello World!"
