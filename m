From: "Dr. Michael Weller" <eowmob@exp-math.uni-essen.de>
Date: Fri, 09 Jun 2000 11:42:45 +0000
Subject: ESS Maestro 3i support status
Message-Id: <marc-linux-sound-96055090722587@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dear List,

I've a Dell Laptop here with an ESS Maestro 3i Sound card build in. I
cannot get the card to work. The card seems to be sb compatible
(iobase 0x220, irq 5, dma 1, 0x388 for adlib emulation, no 16bit dma).
The BIOS even prints these settings during boot as used for DOS sound
support.

I had to modify the pcmcia setup to not claim the ioports as used and
since then the sb driver does not whine about their missing.

However, it cannot initialize the card. All I get is a message the sb
module fails to reset the dsp. Then EBUSY error from insmod (I would have
found ENODEV more intuitive, btw.) 

Now, question: Is this a configuration problem (and how can I fix it) or
is the card simply incompatible and their is no chance to make it work.
The ess137[01] drivers did also fail but made no comment about the
reasons, BTW.

All this is with kernel 2.2.14, btw.

Any comments are appreciated, thank you in advance,
Michael.

--

Michael Weller: eowmob@exp-math.uni-essen.de, eowmob@ms.exp-math.uni-essen.de,
or even mat42b@spi.power.uni-essen.de. If you encounter an eowmob account on
any machine in the net, it's very likely it's me.
