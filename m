From: Itai Nahshon <nahshon@actcom.co.il>
Date: Sun, 04 Oct 1998 00:52:25 +0000
Subject: Re: How do I use isapnp?
Message-Id: <marc-linux-sound-90746568019702@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90742331706312@msgid-missing>
In-Reply-To: <marc-linux-sound-90742331706312@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Ishaaq Chandy wrote:
> 
> Hi,
> 
> I've been trying to get my PnP OPTi931 card (supposedly Soundblaster Pro
> compatible) to work. Finally I managed to get it working by setting it
> to IO 0x0220, DMA 1, IRQ 7 in DOS and then using Loadlin to load Linux.
> 
> However as the sound quality is awful and I prefer using LILO I am quite
> unsatisfied with this compromise.
> 

You should not use that card in the Soundblaster pro mode. This gives
you only limited 8 bit sound. Better use the WSS driver with that card.

> I heard that one can get the card working by using pnpdump, configuring
> its output and lastly using isapnp on the configured output. I tried
> this but pnpdump's output goes way above my head. Can someone help?
> 

a. That's right. b. You have no reason at all to boot to Dos, isapnp
   and the sound driver will overwrite the dos settings anyway.

However, what you really need to do depends on the kernel
that you use and also on your bios.

The free driver for the OPTi 82C931 is using the card in it's non-PnP
mode. 

With older sound driver:
(Linux 2.0.34 and older. I'm not sure about 2.0.35).
There are several web sits that tell you how to set-up this card.
You need to set isapnp in a way that will disable PnP for the card.
Then, there is a user-mode program that patches some registers
and then you can use the card as if it were a 82C931.

With newer sound driver:
(recent development kernels, possibly 3.0.35 or patches available
from Alan Cox). Everything needed for configuration in the mad16 driver.
(actual sound processing is in the ad1848 driver).
Modularized sound driver is recommended. You may need to run isapnp
but later when the sound driver is loaded it reinitializes the card
with its own settings. Isapnp is needed to resolve the card only if
you do not have a PnP bios.

Write to me directly if you still have problems. Please give an exact
description of your hardware, which system you use, do you have any
experience with patching/configuring/compiling the Linux kernel?

Itai
-- 
Itai Nahshon   nahshon@actcom.co.il
        Also   nahshon@vnet.ibm.com
