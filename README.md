# IATest

## Description

A tiny single-header test framework for C++

## How To Use

```cpp
#include <iatest.hpp>

namespace MyMathLib
{
    uint64_t multiply_by_2(uint64_t value) { return (value << 1); }
    uint64_t divide_by_2(uint64_t value) { return (value >> 1); }
}

IA_TEST_SET(MyMathLib_Multiply)
{
    IA_TEST_EQ(MyMathLib::multiply_by_2(90), 180);
    IA_TEST_EQ(MyMathLib::multiply_by_2(3), 6);
    IA_TEST_EQ(MyMathLib::multiply_by_2(8), 16);
}

IA_TEST_SET(MyMathLib_Divide)
{
    IA_TEST_EQ(MyMathLib::divide_by_2(8), 4);
    IA_TEST_EQ(MyMathLib::divide_by_2(6), 3);
}

int main()
{
    IATEST_EXECUTE_TEST_SET(MyMathLib_Multiply);
    IATEST_EXECUTE_TEST_SET(MyMathLib_Divide);

    return 0;
}
```

This should produce the following output.

![example_01_result](https://i-a-s.lk/res/images/git/iatest/example_01_result.png)


If you were to change this line from
```cpp
IA_TEST_EQ(MyMathLib::multiply_by_2(3), 6);
```
to
```cpp
IA_TEST_EQ(MyMathLib::multiply_by_2(3), 8);
```
it should produce the following output instead.

![example_02_result](https://i-a-s.lk/res/images/git/iatest/example_02_result.png)

## Building

No building is necessary, just include iatest.hpp in your project.

## Contributing

Please refer to the following guides:

1) [Contribution Guide](https://i-a-s.lk/documents/contributing/contribution_guide/)
2) [C++ Style Guide](https://i-a-s.lk/documents/contributing/style_guide_cpp/)

## License

IATest is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)
