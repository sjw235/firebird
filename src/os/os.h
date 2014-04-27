#include <stdlib.h>

int os_kbhit();
int os_getch();

void *os_reserve(size_t size);
void *os_commit(void *addr, size_t size);
void *os_sparse_commit(void *page, size_t size);
void os_sparse_decommit(void *page, size_t size);
void *os_alloc_executable(size_t size);


// TODO: This in windows
// typedef LARGE_INTEGER os_time_t;
// #define os_query_time(p) QueryPerformanceCounter(&p)
// #define os_time_diff(x, y) (x.QuadPart - y.QuadPart)
typedef struct timeval os_time_t;
void os_query_time(os_time_t *t);
double os_time_diff(os_time_t x, os_time_t y);
// TODO: This in windows
//typedef LARGE_INTEGER os_frequency_t;
//typedef long os_frequency_t;
//#define os_query_frequency(p) QueryPerformanceFrequency(&p)
//#define os_frequency_hz(p) (p.QuadPart)

void throttle_timer_on();
void throttle_timer_wait();
void throttle_timer_off();

/*
Useful links for this section:
http://blog.nervus.org/managing-virtual-address-spaces-with-mmap/
http://msdn.microsoft.com/en-us/library/windows/desktop/aa366887%28v=vs.85%29.aspx

#define os_free_executable(ptr) VirtualFree(ptr, 0, MEM_RELEASE)

gui 
//extern HWND hwndMain, hwndGfx;
#define os_redraw_screen() InvalidateRect(hwndGfx, NULL, FALSE);
#define os_set_window_title(buf) SetWindowText(hwndMain, buf)

Address cache 
typedef struct { void *prev, *function; } os_exception_frame_t;
void addr_cache_init(os_exception_frame_t *frame);

void throttle_timer_wait();

*/