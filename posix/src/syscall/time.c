/* time.c
 * Time functions
 */

#include "globals.h"
#include <time.h>
#ifdef __BORLANDC__
#include <sys/timeb.h>
#include <dos.h>
#else
#include <unistd.h>
#endif

/* --- Returns the current time, in milliseconds --------------------------- */

/* We don't have a fixed reference. The first call may return 0 if it
 * likes. */

static uint mclock(void)
{
#ifdef __BORLANDC__
	struct timeb tb;
	static int32 seconds = -1;

	ftime(&tb);
	if (seconds<0)
		seconds = tb.time;

        return ((tb.time - seconds) * 1000) + tb.millitm;
#else
	struct timeval tv;

	gettimeofday(&tv, NULL);
	return ((tv.tv_sec * 1000) + (tv.tv_usec / 1000));
#endif
}

/* --- Gets the current time ----------------------------------------------- */

void sys_TimeNow(void)
{
	pushi(mclock());
}

/* --- Sleeps for a while -------------------------------------------------- */

void sys_TimeSleep(void)
{
	int32 t = popi();
	if (t>0)
#ifdef __BORLANDC__
		delay(t);
#else
		usleep(t * 1000);
#endif
}

/* --- Sleeps until a time ------------------------------------------------- */

void sys_TimeSleepUntil(void)
{
	int32 t = popi() - mclock();
	if (t>0)
#ifdef __BORLANDC__
		delay(t);
#else
		usleep(t * 1000);
#endif
}

