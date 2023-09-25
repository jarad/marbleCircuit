test_that("missing does not produce errors, warnings, messages, condition", {
  for (i in 1:64) {
    expect_no_error(    missing(i))
    expect_no_warning(  missing(i))
    expect_no_message(  missing(i))
    expect_no_condition(missing(i))
  }
})

test_that("missing is correct produces errors", {
  expect_error(missing(-1))
  expect_error(missing(11.5))
})

# test_that("permutations produces warnings", {
#   expect_warning(permutations(5))
#   expect_warning(permutations(rep(3,4)))
# })

test_that("missing calculates correctly",{
  nv <- c(`cross-over` = NA,
          `left exit` = NA,
          `right exit` = NA,
          split = NA)

  expect_equal(missing(1), replace(nv, names(nv), c(1,1,0,0)))
  expect_equal(missing(2), replace(nv, names(nv), c(0,1,1,0)))
})
