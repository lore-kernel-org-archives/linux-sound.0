From: Benno Senoner <sbenno@gardena.net>
Date: Tue, 15 Jun 1999 21:52:31 +0000
Subject: New scheduling latencies during audio playing + heavy disk I/O on various kernels
Message-Id: <marc-linux-sound-92948447502258@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I performed new interesting tests of the scheduling latencies
while playing audio samples from RAM.

The test was mainly performed to see if Linux can
provide a stable low-latency ( <20ms) audio I/O enviroment,
on modern machines ( PII + UDMA / SCSI drives)
for realtime applications like MIDI software synthesizers,
audio FX, harddisk recording .. , DURING HIGH DISK ACTIVITY,
at applcation level.


Unfortunately the answer is NO, with current kernels.



The benchmark is scheduled with SCHED_FIFO , with max priority.
( schp.sched_priority=sched_get_priority_max(SCHED_FIFO);  )

My hardware: PII 400 Motherboard ASUS P2B , 256 MB RAM
HD IBM EDIE 16GB UDMA

---
Just for your information: under Windows I can play sound
using a *20ms* buffer and do a copy of a large file on the disk
without any dropout. ( the test was performed using 
th software synthesizer NI Generator).
This to ensure that the high scheduling latencies during
disk I/O are not a hardware limitation, but a Linux limitation.

I know that the Windows programs uses some hacks like IRQ programming,
but I think with the right process/disk scheduling policies, we could
archieve similar results under Linux using rt-scheduled user processes.
---



I wrote a new scheduling benchmark which measures the maximum
scheduling latencies between two write()s to /dev/dsp , and
the number of overruns (check if the time diff is > than the audio buffer size)

The benchmark runs with several different fragmentnum/fragmentsize numbers
and summarizes the results in form of a nice table.

I tested various kernel versions:  2.0.36 , 2.2.9 , 2.2.9+andrea-patch , 2.3.5



I stressed the system in 4 ways:

- running "top" with an update frequency of 0.01 sec
  (this is a mix of accessing to /proc filesystem and gfx output)
- writing a large file
- copying the file to a second file
- cat both files >/dev/null (to simulate disk read access)

( I did a separate test stressing my machine with "x11perf -all"
  and using a 3x1024 bytes audio buffer = 17.5ms buffer ,
  I let x11perf run for about 1 hour, and there were no dropouts, pretty good !)
(I know of some PCI gfx-cards, which freeze the PCI for too long time
during heavy graphics activity, causing sound dropouts)
Fortunately my Matrox G100 AGP, has not such problems. 



to summarize:

/proc (top) test:

2.0.36        no dropouts with buffer > 17ms
2.2.5         no dropouts with buffer > 69ms  *WORSE* than 2.0.36  :-(
2.2.9         no dropouts with buffer > 23ms  
2.2.9-arca    no dropouts with buffer > 46ms
2.3.5         no dropouts with buffer > 46ms


disk write test:

2.0.36      seems safe with buffer >  75ms
2.2.5       seems safe with buffer > 120ms
2.2.9       seems safe with buffer >  90ms
2.2.9-arca  seems safe with buffer > 50-60ms 
2.3.5       seems safe with buffer > 100ms

the arca patch seems to make the disk write situation a bit better

disk copy tests:

2.0.36      seems safe with buffer >  40-50ms
2.2.5       seems safe with buffer >  70-90ms
2.2.9       seems safe with buffer >  50-70ms
2.2.9-arca  seems safe with buffer >  60-70ms
2.3.5       seems safe with buffer >  60-80ms

disk read test:

2.0.36      seems safe with buffer >  180-200ms
2.2.5       seems safe with buffer >  100-140ms
2.2.9       seems safe with buffer >  90-120ms
2.2.9-arca  seems safe with buffer >  90-120ms
2.3.5       seems safe with buffer >  100-115ms


Detailed tables are included in the benchmark tgz (link below)


So it seems that must use at least 100-130ms of audio buffer,
during high disk activity , to ensure that there are no sound drop-outs.

I tested even a 2.2.9 kernel with a HZ@0 patch to increase scheduling
frequency , but there are no differences from a stock 2.2.9 kernel.

what helped alot is the remount of the disk in sync mode

( mount / -oremount,sync )

in this case the average scheduling latencies are very good
between 16-19ms during the disk stressing tests.


Unfortunately the disk performance sucks, the file operations are
several times slower than in async mode, therefore we can not
use the sync mode in real world.

Do you think that there exists a way to get these low scheduling latencies,
in async mode ?

I tested even the QLinux 2.2.0 , just for cursiousity,
and QLinux showed the worst latencies of all kernels,
about 200ms, maybe the cause of this was that the QLinux is a patch
for kernel 2.2.0 , and not 2.2.9 ?


If you send me some patches, I can test these on my machine,
to see if we made some progress by bringing down the 
scheduling latencies to the magic 20ms.


Do you think that to archieve these results, there are
some modifications necessary, to the locking-scheme
of the I/O layer ?

I'm not a kernel hacker but IMO the problem seems
the kernel which holds some locks for too much time 
during heavy disk I/O, which results in a blocking of the
write() call (to /dev/dsp).
Please correct me if I'm wrong.

Or could the locking be made more modular on a per device basis ?
( writing to /dev/dsp , has nothing to do with doing I/O on /dev/hd* ,
but it seems that some critical section locks the entire device layer
for too much time >100ms))
again, correct me if I'm wrong.

Just for curiousity, has someone made similar tests under
Solaris x86, just to have some numbers to compare ?



You can get my benchmark at

http://www.gardena.net/benno/linux/latencytest0.3.tgz


send me your results , comments and feedback, please !


regards,
Benno.


sbenno@gardena.net
