From: otisg@ivillage.com
Date: Fri, 07 Sep 2001 17:39:41 +0000
Subject: SB16: Bad or missing 16 bit DMA channel
Message-Id: <marc-linux-sound-99988458525824@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I have a SB sound card, model CT4170 plugged into an ISA slot of a Epox mother board, model EP-MVP3G5.

Every hour or so I see this in /var/log/messages:

modprobe: modprobe: Can't locate module sound-service-0-0
kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
kernel: sb: Creative ViBRA16X PnP detected
kernel: sb: ISAPnP reports 'Creative ViBRA16X PnP' at i/o 0x220, irq 5, dma 1, 3
kernel: SB 4.16 detected OK (220)
kernel: SB16: Bad or missing 16 bit DMA channel
kernel: sb: 1 Soundblaster PnP card(s) found.


I'm wondering why the kernel needs sound-service-0-0 module, which fails to load, when my sound works just fine without it, apparently?

I am also wondering what is causing "SB16: Bad or missing 16 bit DMA channel" warnings?

This is what I have in /etc/modules.conf:

alias sound-slot-0 sb 
post-install sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -L >/dev/null 2>&1 || : 
pre-remove sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -S >/dev/null 2>&1 || :

Should I remove or change this?
I can't remember why I put this in modules.conf nor what it does, any more. :(

Thanks,
Otis

_________________________________________________________________
iVillage.com: Solutions for Your Life 
Check out the most exciting women's community on the Web   
http://www.ivillage.com
