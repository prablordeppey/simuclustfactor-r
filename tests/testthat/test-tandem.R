#context("tandem")  # Our file is called "test-tandem.R"
library(testthat)        # load testthat package
library(simuclustfactor)       # load our package

seed = 106382

# Test whether twcfta function produced the correct l2norm of centroids
test_that("fit.twcfta() returns l2norm of centroids", {
  X_i_jk = generate_dataset(seed=seed)$X_i_jk

  tandem_model = tandem(verbose=T, seed=seed, init = 'svd')
  O=fit.twcfta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 20.908)

  # fit with random initialization
  tandem_model = tandem(verbose=F, init = 'random', seed=seed)
  O=fit.twcfta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 20.908)

  # fit with parameters
  tandem_model = tandem(verbose=F, seed=seed, U_i_g=O@U_i_g, B_j_q=O@B_j_q, C_k_r=O@C_k_r)
  O=fit.twcfta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 20.908)

})

# Test whether twfcta function produced the correct l2norm of centroids
test_that("fit.twfcta() returns l2norm of centroids", {
  X_i_jk = generate_dataset(seed=106382)$X_i_jk

  tandem_model = tandem(verbose=T, seed = seed, init = 'svd')
  O=fit.twfcta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 18.572)

  # fit with random initialization
  tandem_model = tandem(verbose=F, init = 'random', seed=seed)
  O=fit.twfcta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 18.482)

  # fit with parameters
  tandem_model = tandem(verbose=F, seed=seed, U_i_g=O@U_i_g, B_j_q=O@B_j_q, C_k_r=O@C_k_r)
  O=fit.twfcta(tandem_model, X_i_jk, c(8,5,4), c(3,3,2))
  expect_equal(round(sum(X_i_jk^2),3), 61.864)
  expect_equal(round(sum(O@B_j_q^2),3), 3)
  expect_equal(round(sum(O@C_k_r^2),3), 2)
  expect_equal(which(O@U_i_g==1), c(1,8,10,13,14,15,19,20))
  expect_equal(round(sum(O@Y_g_qr^2),3), 18.233)

})
