From: Rodrigo Castro <rodsc@bigfoot.com>
Date: Wed, 17 Feb 1999 04:01:00 +0000
Subject: Sound Card Problems
Message-Id: <marc-linux-sound-91922152200751@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

    Here the files go:

--------------- isapnp.conf -------------------

(READPORT 0x0203)
(ISOLATE)
(IDENTIFY *)
(VERIFYLD N)
(CONFIGURE CTL0044/19829 (LD 0
 (INT 0 (IRQ 5 (MODE +E)))
 (DMA 0 (CHANNEL 1))
 (DMA 1 (CHANNEL 5))
 (IO 0 (BASE 0x0220))
 (IO 1 (BASE 0x0330))
 (IO 2 (BASE 0x0388))
 (ACT Y)
))
(CONFIGURE CTL0044/19829 (LD 1
 (INT 0 (IRQ 10 (MODE +E)))
 (IO 0 (BASE 0x0168))
 (IO 1 (BASE 0x036e))
 (ACT Y)
))
(CONFIGURE CTL0044/19829 (LD 2
 (IO 0 (BASE 0x0620))
 (IO 1 (BASE 0x0A20))
 (IO 2 (BASE 0x0E20))
 (ACT Y)
))
(CONFIGURE CTL0044/19829 (LD 3
 (IO 0 (BASE 0x0200))
 (ACT Y)
))
(CONFIGURE CTL0044/19829 (LD 4
 (IO 0 (BASE 0x0100))
 (ACT Y)
))
(WAITFORKEY)

--------- conf.modules -----------------

alias char-major-14 sb
post-install sb /sbin/modprobe "-k" "adlib_card"
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
options adlib_card io=0x388     # FM synthesizer
