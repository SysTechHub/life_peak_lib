
#pragma once

#include <cstring>

struct TestStruct
{
    bool   testBoolean;
    int    testInt;
    float  testFloat;
    double testDouble;
    char   *testStr;

    bool operator==(const TestStruct &other)
    {
        auto l1 = sizeof(testStr);
        auto l2 = sizeof(other.testStr);
        auto cmp = l1 != l2 ? false : 0 == std::strncmp(testStr, other.testStr, l1);
        return testBoolean == other.testBoolean && testFloat == other.testFloat &&
               testDouble == other.testDouble && testInt == other.testInt && cmp;

    }
};

TestStruct processTestStruct(TestStruct inp);
TestStruct* processTestArray(TestStruct inp[]);
