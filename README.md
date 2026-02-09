<div align="center">
  <img src="logo.png" alt="IATest Logo" width="400"/>
  <br/>
  
  <img src="https://img.shields.io/badge/license-apache_v2-blue.svg" alt="License"/>
  <img src="https://img.shields.io/badge/standard-C%2B%2B20-yellow.svg" alt="C++ Standard"/>
  <img src="https://img.shields.io/badge/platform-Windows%20%7C%20Linux-lightgrey.svg" alt="Platform"/>

  <p>
    <b>IA Single Header C++ Test Framework</b>
  </p>
</div>


## **About**

IATest is a lightweight, modern, single-header unit testing framework for C++20. It is designed to be simple to drop into any project, offering automatic test discovery, a clean macro-based API, and colorful console output.

## **Features**
- Single Header: Easy integration; just include iatest.hpp.
- Modern C++: Built with C++20 concepts and formatting.
- Auto-Registration: Tests are automatically discovered and registered via static initialization.
- Zero-Boilerplate: Minimal setup required to start writing test blocks.
- Expressive Assertions: Includes equality, inequality, and floating-point approximation checks.
- Readable Output: Color-coded console output for easy scanning of pass/fail states.

## **Dependencies**
- C++20 Compiler: (GCC or Clang) with support for concepts and std::format.
- Auxid: Needs Auxid for core types (String, Vec, Mut, Ref, etc.).

## **Installation**
1. Copy iatest.hpp into your project's include directory.
2. Ensure auxid is available in your project.
3. Include the header in your test files.

> [!NOTE]
>
> If you're using CMake, you can simply add this repository to your project using `FetchContent` or `add_subdirectory`, and just link against IATest and start coding with zero additional setup!

## **Quick Start**

1) Writing Tests

Create a test file (e.g., tests.cpp). You define tests inside a "Block" using IAT_BEGIN_BLOCK and IAT_END_BLOCK.

```cpp
#include <iatest.hpp>

// 1. Define a Test Block
// Usage: IAT_BEGIN_BLOCK(Group, Name)
IAT_BEGIN_BLOCK(Core, MathTests)

    // Define helper functions or member variables here if needed

    // Test functions must return bool
    bool test_addition() {
        int a = 5;
        int b = 10;
        
        // Use IAT macros to assert conditions
        IAT_CHECK_EQ(a + b, 15);
        IAT_CHECK_NEQ(a, b);
        
        return true;
    }

    bool test_float_math() {
        float x = 1.0f / 3.0f;
        // Check approx equality with default epsilon
        IAT_CHECK_APPROX(x * 3.0f, 1.0f); 
        return true;
    }

    // 2. Register tests within the block
    IAT_BEGIN_TEST_LIST()
        IAT_ADD_TEST(test_addition);
        IAT_ADD_TEST(test_float_math);
    IAT_END_TEST_LIST()

IAT_END_BLOCK()

// 3. Auto-register the block with the runner
// Usage: IAT_REGISTER_ENTRY(Group, Name)
IAT_REGISTER_ENTRY(Core, MathTests)

```

2) The Main Entry Point
You need a main function to trigger the runner.

```cpp
#include <iatest.hpp>

int main() {
    // Automatically runs all registered blocks
    return ia::test::TestRegistry::run_all();
}
```

## **Example Output**

```text
[IATest] Discovered 2 Test Blocks

Testing [Core::MathTests]...
  Testing test_addition...
  Testing test_float_math...

Testing [Core::StringTests]...
  Testing test_concatenation...
    "hello world" != "hello world!"... FAILED
      Expected: "hello world!"
      Actual:   "hello world"

-----------------------------------
              SUMMARY
-----------------------------------
1 OF 3 TESTS FAILED
Success Rate: 66.67%
Ran 3 test(s) across 2 block(s)
-----------------------------------
```

## **API Reference**

### **Assertions**

All assertions return false immediately if the check fails, stopping the current test function.

| Macro | Description |
| :---- | :---- |
| IAT\_CHECK(condition) | Fails if condition is false. |
| IAT\_CHECK\_NOT(condition) | Fails if condition is true. |
| IAT\_CHECK\_EQ(lhs, rhs) | Fails if lhs \!= rhs. Prints values on failure. |
| IAT\_CHECK\_NEQ(lhs, rhs) | Fails if lhs \== rhs. |
| IAT\_CHECK\_APPROX(lhs, rhs) | Fails if abs(lhs \- rhs) \> epsilon (default 0.001). |
| IAT\_CHECK\_APPROX\_EPS(lhs, rhs, eps) | Fails if abs(lhs \- rhs) \> eps. |

### **Block Management**

| Macro | Description |
| :---- | :---- |
| IAT\_BEGIN\_BLOCK(Group, Name) | Starts a new test class derived from ia::test::Block. |
| IAT\_END\_BLOCK() | Closes the class definition. |
| IAT\_REGISTER\_ENTRY(Group, Name) | Statically registers the block to be run by TestRegistry. |

### **Test Registration**

These macros must be used inside the IAT\_BEGIN\_TEST\_LIST() section.

| Macro | Description |
| :---- | :---- |
| IAT\_ADD\_TEST(func\_name) | Registers a member function as a test unit. |
| IAT\_NAMED\_UNIT(name, func\_name) | Registers a function with a custom display name. |

## **License**

Copyright (C) 2026 IAS. Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).