From: kenneth topp <caught@prodigy.net>
Date: Mon, 11 Jan 1999 16:17:03 +0000
Subject: machine hangs w/ Recording Overrun.
Message-Id: <marc-linux-sound-91610802905891@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hello, i'm having problems when I quit cthuga 1.3 my machine prints
something like "Sound: recording overruns" infinetly, doesn't panic, and i
have to hit the reset button. cthuga works normally, except when it exits.

Now, at my level of skill, I could track this down by going to an older
kernel, or try to rip apart cthuga till I get just the code that causes
this problem.

Please let me know what I can do?  And apologies if this isn't the correct
forum for these types of problems.

Thanks,

Kenneth
--------------------------

Hardware: 
pentium mmx overclocked to 266
pci soundblaster awe32

output of ver_linux script (included in recent kernels):
Linux dynasty 2.2.0-pre6 #6 Sat Jan 9 04:28:44 EST 1999 i586 unknown
Kernel modules         2.1.121
Gnu C                  2.7.2.3
Binutils               2.9.1.0.4
Linux C Library        2.0.108
Dynamic linker         ldd (GNU libc) 2.0.108
Linux C++ Library      2.8.0
Procps                 1.2.7
Mount                  2.7l
Net-tools              (1998-12-05)
Kbd                    0.94
Sh-utils               1.16

relevant /etc/conf.modules:
options sb io=0x220 irq=5 dma=1 dma16=5 
options adlib_card io=0x388
post-install sb modprobe awe_wave
pre-remove sb modprobe -r awe_wave

/etc/isapnp.conf:
(READPORT 0x020b)
(ISOLATE)
(IDENTIFY *)

(CONFIGURE CTL00c5/379659683 (LD 0

(INT 0 (IRQ 5 (MODE +E)))
(DMA 0 (CHANNEL 1))
(DMA 1 (CHANNEL 5))
(IO 0 (BASE 0x0220))
(IO 1 (BASE 0x0330))
(IO 2 (BASE 0x0388))

(ACT Y)
))

(CONFIGURE CTL00c5/379659683 (LD 1

(IO 0 (BASE 0x0200))

(ACT Y)
))

(CONFIGURE CTL00c5/379659683 (LD 2

(IO 0 (BASE 0x0620))
(IO 1 (BASE 0x0A20))
(IO 2 (BASE 0x0E20))

(ACT Y)
))

(WAITFORKEY)
