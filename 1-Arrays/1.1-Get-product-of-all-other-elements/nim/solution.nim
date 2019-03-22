import unittest, algorithm, random

proc product_of_others*(numbers: seq[int]): seq[int] =
  result = @[]
  var
    prefixProducts: seq[int] = @[]
    suffixProducts: seq[int] = @[]
    acc = 1

  # Compute prefix products
  for number in numbers:
    prefixProducts.add(acc)
    acc *= number

  # Compute suffix products
  acc = 1
  for number in numbers.reversed:
    suffixProducts.add(acc)
    acc *= number

  suffixProducts.reverse

  for i in 0..numbers.high:
    result.add(prefixProducts[i] * suffixProducts[i])

when isMainModule:

  suite "Basic examples from book":

    test "@[1, 2, 3, 4, 5]":
      check product_of_others(@[1, 2, 3, 4, 5]) == @[120, 60, 40, 30, 24]

    test "@[3, 2, 1]":
      check product_of_others(@[3, 2, 1]) == @[2, 3, 6]

  suite "Test zeros":

    test "@[1, 2, 3, 0, 5]":
      check product_of_others(@[1, 2, 3, 0, 5]) == @[0, 0, 0, 30, 0]

    test "@[0, 2, 1]":
      check product_of_others(@[0, 2, 1]) == @[2, 0, 0]

  suite "Test negative numbers":

    test "@[1, -2, 3, 4, 5]":
      check product_of_others(@[1, -2, 3, 4, 5]) == @[-120, 60, -40, -30, -24]

    test "@[3, -2, 1]":
      check product_of_others(@[3, -2, 1]) == @[-2, 3, -6]

  suite "Long sequence of random numbers (perf tests)":

    test "Random 1":
      var
        length = rand(1_000_000..3_000_000)
        input = newSeq[int](length)
      for i in 0..<length:
        input[i] = rand(-10..10)
      discard product_of_others(input)

    test "Random 2":
      var
        length = rand(2_000_000..4_000_000)
        input = newSeq[int](length)
      for i in 0..<length:
        input[i] = rand(-10..10)
      discard product_of_others(input)

    test "Random 3":
      var
        length = rand(3_000_000..5_000_000)
        input = newSeq[int](length)
      for i in 0..<length:
        input[i] = rand(-10..10)
      discard product_of_others(input)
