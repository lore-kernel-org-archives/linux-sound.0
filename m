From: Dave Caswell <davec@asylum.apocalypse.org>
Date: Sat, 18 Mar 2000 06:01:58 +0000
Subject: sound fails after suspend  2.3.99-pre1
Message-Id: <marc-linux-sound-95338768517804@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org




Playing a sound works fine just after I re-boot with kernel
2.3.99-pre1, but after a suspend-resume I don't have any sound
anymore.

The only lines I found in the logs related to sound are:

Mar 17 22:17:08 krypton kernel: ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996 
Mar 17 22:17:08 krypton kernel: Found OPL3-SA3 (YMF715) 
Mar 17 22:17:08 krypton kernel: <MS Sound System (CS4231)> at 0x534 irq 5 dma 1,0 
Mar 17 22:17:08 krypton kernel: <MPU-401 0.0  Midi interface #1> at 0x330 irq 5 dma 1,0 


gom still shows the mixer controls, but tweaking them produces no
changes.

Thanks,
	davec
