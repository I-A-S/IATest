include(FetchContent)

FetchContent_Declare(
    Auxid
    GIT_REPOSITORY https://github.com/I-A-S/Auxid
    GIT_TAG        main
    OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable(Auxid)
