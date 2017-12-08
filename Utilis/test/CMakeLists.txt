enable_testing()
# Run test - in case of problem in make test - run verbose mode:
#            ctest --extra-verbose
add_test( "func_Utilis_Utilities" bash -c "(source ${CMAKE_CURRENT_SOURCE_DIR}/utilities.test.sh  |tee test_all.log; exit   `cat test_all.log | grep -c ERROR`)")
