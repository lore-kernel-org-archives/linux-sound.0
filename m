From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 23 Aug 1999 13:20:34 +0000
Subject: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93541443318803@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
I'm doing experiments of high performance data streaming from disk,
in my case streaming 60 audio tracks (44khz mono 16bit)  from disk.

This works quite well, but it has one BIG DRAWBACK: 
it makes the rest of  the system unusable.
If I run this app which reads huge files from disks continuously,
all other regular files and executables buffered in the file buffer cache,
are evicted from the filebuffer, and every time I want to launch an executable,
which was previously launched, the kernel has to load the entire executable
from disk, since it's not longer buffered and therefore it degrades the
performance of my streaming app too.
I could use a second disk dedicated for streaming, but the first disk
(on which the Linux distro and apps do reside), will become very slow,
since it will pratically RUN IN AN UNBUFFERED fashion all the time,
since the LRU buffering algorithm will remove all buffered regular
files and executable because the kernel caches the huge streaming files.

Is there a way to limit filebuffering on a per-process basis ?
For example let's say, I want that my streaming process can't use more than 5MB
of the kernel filebuffers, so that regular files/executables can be buffered
witout being removed from the buffers due to the huge filestreaming activity.
SGI's had the O_DIRECT flag to pass to the open() call to avoid buffering.
But linux is missing this flag , and IMHO  O_SYNC would not help, since it syncs
only on disk writes, disk reads will still be cached.

I found nothing usable in the /proc/sys/*  tuneable values, and setlimit()
has no tunable buffers in it's structure.
The setbuffer() of stdio seems not to solve the problem since the kernel uses
his own buffering.
Is there a solution for this buffer cache problem ?

Will future kernels ave an O_DIRECT like flag to avoid caching ?
I think without some buffer-cache usage limiting, or buffering disabling,
Linux is actually UNSUITABLE for streaming applications which do run
concurrently with other apps.

comments ?

PS: the easiest way to test this bad behavior is to run in background a script
which copies 5-10 files of 50-100MB in size simultaneously, let it run a while
and then try to open and xterm .. it will take SEVERAL seconds.

regards,
Benno.
