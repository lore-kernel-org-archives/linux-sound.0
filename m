From: Britton <fsblk@aurora.uaf.edu>
Date: Tue, 07 Mar 2000 07:24:20 +0000
Subject: Sound Blaster PCI 128 autodetected as Creative Enconiq Audio PCI?
Message-Id: <marc-linux-sound-95241437401207@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


This card is listed as one of those that works in Sound-Howto, but without
and particular instructions what to do to make it work.  I assume it is
still based on Creative Ensoniq Audio PCI (1370 or 1371) driver?  I have
tried compiling into the kernel 1371 support, and dmesg tells me the card
initialization is begun and completed, but /dev/mixer can't be
opened.  On the card itself, I see:

MODEL: CT4700

and a chip with the following:

Creative
5507
5507000101
A A8D0571
9906  TAIWAN

Am I trying the right driver?  If so, does anyone know of any additional
tricks that might apply to this card in particular?  

Thanks,
Britton Kerin
