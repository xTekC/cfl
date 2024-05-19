#include <setjmp.h>
#include <stdarg.h>
#include <stddef.h>
#include <cmocka.h>

// The mock functions and tests go here
static void test_hello_from_c(void **state) {
  // Mock test content
  (void)state; // Unused
}

int main(void) {
  const struct CMUnitTest tests[] = {
      cmocka_unit_test(test_hello_from_c),
  };

  return cmocka_run_group_tests(tests, NULL, NULL);
}
