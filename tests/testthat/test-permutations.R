test_that("permutations produces errors", {
  expect_error(permutations(-1))
  expect_error(permutations(11.5))
})

test_that("permutations produces warnings", {
  expect_warning(permutations(5))
  expect_warning(permutations(rep(3,4)))
})

test_that("permutations calculates correctly",{
  expect_equal(permutations(1), 1)
  expect_equal(permutations(c(3,3,2,2)), 25200)
})
