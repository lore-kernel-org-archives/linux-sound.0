From: "lokesh setia" <lokesh_setia@hotmail.com>
Date: Wed, 03 Mar 1999 22:34:07 +0000
Subject: high dma not working in Creative VibraX16 PnP
Message-Id: <marc-linux-sound-92052951315049@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

We have a creative VibraX pnp sound card (compatible with sb16).
After configuring it as sb from sndconfig as well as manually from 
modprobe, we have only been able to get it working in 8-bit mode.

Trying to play in 16 bit mode gives:

dma timed out: irq/dma conflict.

We have tried dma16 to be 5,6, and 7, but none works.

In dos too, the card does not work in 5,6,7 dma but we have to give a 
high dma=low dma (i.e. 1) . 

but in modprobe we are not able to give high dma=1

modprobe io=0x240 irq=5 dma=1 dma16=1
error: dma16 not valid.

Any clues to get this card working in 16-bit mode.

Thanks,
Lokesh

______________________________________________________
Get Your Private, Free Email at http://www.hotmail.com
