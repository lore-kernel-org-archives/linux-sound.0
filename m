From: David Whysong <dwhysong@physics.ucsb.edu>
Date: Thu, 21 Oct 1999 10:17:04 +0000
Subject: 2.3.22 Tropez+ PCM audio, DMA timed out messages
Message-Id: <marc-linux-sound-94050198200496@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi, I'm not on this mailing list so please cc me any replies. Here is a
description of my system and the problem.

[dwhysong@sleepy dwhysong]$ uname -a
Linux sleepy 2.3.22 #3 SMP Sat Oct 16 00:17:16 PDT 1999 i686 unknown

Hardware is a dual Celeron 300A, 256 meg ECC RAM, Tyan Tiger 100
mainboard, IDE disks, NCR 810A SCSI, Turtle Beach Tropez+, Soundblaster
Live (not in use), Matrox G400 video.

Loaded kernel modules:
[root@sleepy to_venus_and_back]# lsmod
Module                  Size  Used by
serial                 33140   1  (autoclean)
opl3                   11336   0  (autoclean)
wavefront              46736   0 
cs4232                  2632   0 
uart401                 6288   0  [cs4232]
ad1848                 16336   0  [cs4232]
sound                  62988   0  [opl3 wavefront cs4232 uart401 ad1848]
soundcore               3204   8  [wavefront sound]
sd_mod                 17436   0  (autoclean) (unused)
ncr53c8xx              51604   0 
scsi_mod               64664   2  (autoclean) [sd_mod ncr53c8xx]
3c59x                  19208   1  (autoclean)
nls_iso8859-1           2020   2  (autoclean)
nls_cp437               3548   2  (autoclean)
vfat                    9276   2  (autoclean)
fat                    31744   2  (autoclean) [vfat]
unix                   17084  37  (autoclean)

Problem:

Tropez+ audio is configured via isapnp and works correctly upon bootup.
The system is stressed by simultaneously running:
	2 threads of rc5des
	Monte-Carlo stellar dynamics/galaxy distribution program
	Radio astronomy process (CLEAN deconvolution, CPU/memory intensive)
	minicom

At the same time I'm using "play" to play a .wav file. During peak load,
the sound stopped playing nicely. Instead it plays a short (perhaps
several tens of milliseconds) burst at a very regular 2 second interval.

My /var/log/messages file contains the following:

Oct 21 01:54:46 sleepy kernel: Sound: DMA (output) timed out - IRQ/DRQ
config error? 
Oct 21 02:10:25 sleepy kernel: Serial driver version 4.30 with SHARE_IRQ
SERIAL_PCI PCI_IOMEM enabled 
Oct 21 02:10:25 sleepy kernel: ttyS00 at 0x03f8 (irq = 4) is a 16550A 
Oct 21 02:22:36 sleepy kernel: Sound: DMA (output) timed out - IRQ/DRQ
config error? 
Oct 21 02:23:18 sleepy last message repeated 19 times
[many more "last message repeated N times"]

Unloading and reinstalling the driver modules does not fix the problem.
Unloading the driver modules, running isapnp again, and reloading the
drivers does not fix the problem.

Except for the serial module, no new devices were accessed around the time
when the problem was triggered.

[root@sleepy to_venus_and_back]# cat /proc/interrupts 
           CPU0       CPU1       
  0:    9989364   12306414    IO-APIC-edge  timer
  1:      48361      61336    IO-APIC-edge  keyboard
  2:          0          0          XT-PIC  cascade
  4:     168358     210445    IO-APIC-edge  serial
  5:      72302      17309    IO-APIC-edge  wavefront midi
  7:     485022     663480    IO-APIC-edge  Crystal audio controller
  8:          2          0    IO-APIC-edge  rtc
 12:      48661      89628    IO-APIC-edge  PS/2 Mouse
 13:          1          0          XT-PIC  fpu
 14:      75466      71738    IO-APIC-edge  ide0
 15:      43188      53230    IO-APIC-edge  ide1
 17:      61522      60516   IO-APIC-level  ncr53c8xx
 19:       1675       2042   IO-APIC-level  eth0
NMI:   22295915   22295915 
LOC:   22274567   22279624 
ERR:          0

[root@sleepy to_venus_and_back]# cat /proc/dma
 1: Crystal audio controller
 3: Crystal audio controller
 4: cascade

I don't think it's an IRQ or DMA configuration problem, since it works at
bootup.

Dave

David Whysong                                       dwhysong@physics.ucsb.edu
Astrophysics graduate student         University of California, Santa Barbara
My public PGP keys are on my web page - http://www.physics.ucsb.edu/~dwhysong
DSS PGP Key 0x903F5BD6  :  FE78 91FE 4508 106F 7C88  1706 B792 6995 903F 5BD6
D-H PGP key 0x5DAB0F91  :  BC33 0F36 FCCD E72C 441F  663A 72ED 7FB7 5DAB 0F91
