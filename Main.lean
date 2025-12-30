def addl (n : Nat) : Nat := n + 1

def main : IO Unit := do
  IO.println "functions go brr"
  IO.println (addl 2)
