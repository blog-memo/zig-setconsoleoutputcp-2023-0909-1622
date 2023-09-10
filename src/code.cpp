#include "code.h"

#ifdef _WIN32
#include <windows.h>
#endif

void
calling_c_from_zig(void)
{
#ifdef _WIN32
  SetConsoleOutputCP(CP_UTF8);
#endif
}
