import algorithm

proc locateSmallestWindow*[T](inputs: seq[T]): (int, int) =
  var sortedInputs = inputs.sorted

  if sortedInputs == inputs:
    (-1, -1)
  else:
    var
      left = 0
      right = inputs.high
    while sortedInputs[left] == inputs[left]:
      left += 1
    while sortedInputs[right] == inputs[right]:
      right -= 1
    (left, right)

################################################################################

when isMainModule:
  import unittest, random

  suite "1.2 Locate the smallest window to be sorted":

    test "Book example: [3, 7, 5, 6, 9] -> (1, 3)":
      check @[3, 7, 5, 6, 9].locateSmallestWindow == (1, 3)

    test "Another simple example: [1, 2, 4, 3, 5, 6, 7] -> (2, 3)":
      check @[1, 2, 4, 3, 5, 6, 7].locateSmallestWindow == (2, 3)

    test "Already sorted: [1, 2, 3, 4, 5, 6, 7] -> (-1, -1)":
      check @[1, 2, 3, 4, 5, 6, 7].locateSmallestWindow == (-1, -1)
