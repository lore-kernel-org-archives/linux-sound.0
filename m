From: Peter Rasmussen <plr@isgtec.com>
Date: Fri, 25 Jun 1999 12:59:27 +0000
Subject: Also problems with SB16 (Linux hangs)
Message-Id: <marc-linux-sound-93031672911113@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a SB16 (PNP) that I have used sucecssfully for a while. However, now
when I load the last 'sb' module my machine freezes totally.

I had Slackware 3.1 with updates until recently, but now installed 4.0 to see
if it would help, but it didn't.

I can run isapnp and it seems to be as successful as before. I then load the 
modules soundcore, sound, opl3, uart401 successfully (I have also tried to load
soundlow, but I can't see any difference). Until now I have always used insmod,
but now tried modprobe, however that one doesn't seem to actually load the
modules?

When I finally do: insmod sb io=0x220 irq=5 dma=0 dma16=6
(and yes, /etc/isapnp.conf is configured accordingly)

My system hangs and I can only reset it with the big red button.

This is with kernel version 2.2.9 and I am not able to find any clues in the
kernel source Documentation/soundblaster or in the Sound-HOWTO so I am now
turning to you guys.

I hadn't used the card for a while (I don't play games so it is only for other
experimental purposes :-) and I now wonder if the hardware has failed? The
isapnp tool seems to work fine, but that doesn't 100% exclude a hw-failure I
suppose, so if anyone has any way to figure that out I would appreciate it. Then
I would have a good excuse to go out and buy a new soundcard (should that be a
SB Live? :-)

Thank you very much,

Peter
