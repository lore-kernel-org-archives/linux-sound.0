From: "Alexey" <sl@nikaa.dnttm.ru>
Date: Wed, 30 Jan 2002 06:17:06 +0000
Subject: Re: ibm notebook RS/6000 860 sound/vga/trackpoint problems
Message-Id: <marc-linux-sound-101237256905519@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101233686922268@msgid-missing>
In-Reply-To: <marc-linux-sound-101233686922268@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> im using the module cs4232 from 2.4.7-pre6 from bitkeeper-tree
> i load the module with this parameters:
> cs4232 io=0x830 irq dma=6 dma2=7

This module is rather old, and, it seems to me, buggy. I have a card based
on CS4232 chipset, and I couldn't make it work propertly (it began playing
something, but not for a long time :)

A piece of advice: just try to use ALSA (advanced linux sound arch.) modules.
<www.alsa-project.org>. Take the stable version, compile it --with-oss,
--with-cards=cs4232 (may be there is another driver, a bit more suitable),
then edit your modules.conf file according to the INSTALL instructions,
run depmod.

modprobe snd-card-cs4232
modprobe snd-mixer-oss

Enjoy yourself.

Oh... you may want to use native ALSA mixer. Download alsa-lib and alsa-utils,
and you will be able to preset initial volume (ALSA's muted by default),
good luck.

Alexey.

