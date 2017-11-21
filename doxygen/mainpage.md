## AliDPG Documentation

* Instruction to build AliDPG

### AliDPG build

* Export AliDPG variables,  e.g:
    ````
    export AliDPG_SRC=/data/aliceLustre/AliDPG/
    export AliDPG_BUILD=/data/aliceLustre/AliDPG_BUILD
    ````
* Run cmake
    ````
    cd $AliDPG_BUILD
    cmake $AliDPG_SRC
    ````
* Run test
    ````
    make test
    ````
    *  test output example
        ````
        Running tests...
        Test project /data/aliceLustre/AliDPG_BUILD
            Start 1: func_Utilis_Utilities
        1/1 Test #1: func_Utilis_Utilities ............   Passed    0.02 sec
        
        100% tests passed, 0 tests failed out of 1
        ````
* Make doxygen documentation
   ````
    make doxygen
   ````
   * output in the $AliDPG_BUILD/doxygen/html/index.html