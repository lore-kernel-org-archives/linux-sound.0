From: Chris Rankin <Chris@zip.com.au>
Date: Sun, 02 May 1999 05:15:18 +0000
Subject: "kernel: Sound error: Couldn't allocate DMA buffer" - maybe PPP's fault
Message-Id: <marc-linux-sound-92562232419193@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
I installed Linux 2.2.7 last night; this afternoon, I tried to play an
Audio CD and heard nothing come out of the speakers. This in itself is
not so unusual - it usually happens when I first boot the machine and
sometimes after it has been suspended (APM) for a long time. The
normal cure is to load the sound drivers, and for this I usually run
my "worry" script which writes two .au files to /dev/audio.

This time, however, I received the following message:

$ worry
./worry: /dev/audio: Cannot allocate memory
./worry: /dev/audio: Cannot allocate memory

This bothers me, because I actually have quite a lot of memory available!

$ free -t
             total       used       free     shared    buffers     cached
Mem:         63516      62056       1460      35752       3404      36588
-/+ buffers/cache:      22064      41452
Swap:       260052       2192     257860
Total:      323568      64248     259320
$ worry
./worry: /dev/audio: Cannot allocate memory
./worry: /dev/audio: Cannot allocate memory
$ lsmod 
Module                  Size  Used by
sb                     33140   0  (autoclean) (unused)
uart401                 5968   0  (autoclean) [sb]
sound                  57196   0  (autoclean) [sb uart401]
soundcore               2372   6  (autoclean) [sb sound]
nls_iso8859-1           2020   2  (autoclean)
nls_cp437               3548   2  (autoclean)
vfat                   11388   2  (autoclean)
fat                    25696   2  (autoclean) [vfat]
$ cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  65040384 60850176  4190208 36634624  4767744 33574912
Swap: 266293248  2244608 264048640
MemTotal:     63516 kB
MemFree:       4092 kB
MemShared:    35776 kB
Buffers:       4656 kB
Cached:       32788 kB
SwapTotal:   260052 kB
SwapFree:    257860 kB


Well, I am now listening to U2 so the problem has "gone away". One
other thing, though - this is the output of my message log around the
time of the incident:

May  2 08:16:23 WellHouse pppd[607]: Hangup (SIGHUP)
May  2 08:16:23 WellHouse pppd[607]: Exit.
May  2 14:47:38 WellHouse apmd[105]: Resume after 06:31:05 (-1% 0:01)
May  2 14:49:09 WellHouse kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996 
May  2 14:49:09 WellHouse kernel: SB 4.13 detected OK (220) 
May  2 14:50:00 WellHouse kernel: PPP: ppp line discipline successfully unregistered 

You will notice that I was running PPP, and then suspended for
6:31:05. Cross reference this log with my console log:

May  2 01:21:33 WellHouse kernel: PPP BSD Compression module registered 
May  2 01:21:33 WellHouse kernel: PPP Deflate Compression module registered 
May  2 14:48:34 WellHouse kernel: VFS: Disk change detected on device ide1(22,0) 
May  2 14:49:09 WellHouse kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996 
May  2 14:49:09 WellHouse kernel: SB 4.13 detected OK (220) 
May  2 14:49:09 WellHouse kernel: Sound error: Couldn't allocate DMA buffer 
May  2 14:49:48 WellHouse last message repeated 2 times
May  2 14:49:48 WellHouse kernel: Sound error: Couldn't allocate DMA buffer 
May  2 14:50:00 WellHouse kernel: PPP: ppp line discipline successfully unregistered 

So you will see that the PPP module unregistered itself, and now I can
play audio again. So if this isn't a sound problem, maybe there is a
memory leak in the PPP code?

Has anyone else seen unusual results in either PPP or sound?

Cheers,
Chris.

PS, in case it is the sound, here is the sound-section from my .config
file:
#
# Sound
#
CONFIG_SOUND=m
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
CONFIG_SOUND_OSS=m
# CONFIG_SOUND_PAS is not set
CONFIG_SOUND_SB=m
CONFIG_SOUND_ADLIB=m
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_PSS is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_CS4232 is not set
# CONFIG_SOUND_OPL3SA2 is not set
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_AD1816 is not set
# CONFIG_SOUND_OPL3SA1 is not set
CONFIG_SOUND_SOFTOSS=m
CONFIG_SOUND_YM3812=m
CONFIG_SOUND_VMIDI=m
# CONFIG_SOUND_UART6850 is not set

If there's anything else you might need, then let me know.
