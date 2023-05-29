

#include    "life_peak_lib.h"

#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

EXPORT
TestStruct processTestStruct(TestStruct inp)
{
    return inp;
}

EXPORT
TestStruct* processTestArray(TestStruct inp[])
{
    auto *arr = new TestStruct[] {inp[0], inp[1]};
    return arr;
}
