From: "Ken Bradshaw" <lickety@baloney.dyndns.org>
Date: Sat, 27 Dec 2003 22:53:11 +0000
Subject: opl3sa2
Message-Id: <marc-linux-sound-107258739424864@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a yamaha ISA sound card that uses the opl3sa2 module.  This card is
(still!) operational.  The module in 2.4.x works fine.  I haven't attempted
to update to alsa and probably won't anytime soon.  Everything works fine in
2.6.0 save this one module.  Here is the relevant dmesg info.. 

ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
pnp: Device 00:01.00 activated.
ad1848: PnP reports 'OPL3-SAX Sound Board' at i/o 0x530, irq 5, dma 0, 1
opl3sa2: probe of 00:01.00 failed with error -16
opl3sa2: No PnP cards found
pnp: Device 00:01.01 activated.

Thanks for any help you can provide.

Ken

