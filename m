From: Michele Bini <mibin@tin.it>
Date: Thu, 12 Nov 1998 21:56:04 +0000
Subject: Re: Soundcard problem!
Message-Id: <marc-linux-sound-91099154427242@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91089445817213@msgid-missing>
In-Reply-To: <marc-linux-sound-91089445817213@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, Nov 12, 1998 at 06:27:12PM +0000, Nikolaos Margaritis wrote:

> When I use  "pnpdump -c -script=out", the file "out" contains
> the following
what pnptools version are you using? Mine (1.13) doesn't seem to like
these options.

[...]
> 	alias sound sb
> 	options -k sb io=0x220 irq=7 dma=3,5

I don't think the sb module can accept two values for dma,
you need to give separate "dma" and "dma16" options

FYI in my conf.modules I have these lines:
	alias sound sb
	options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
	alias midi opl3
	options opl3 io=0x388

(The same settings work fine on an old non-PNP sb16 card,
on an awe32 sb pnp, and on a friend's ess)

Unfortunately, in 2.1.127 a bug seems to make impossible
removing the sb module without rebooting.

Here is my isapnp.conf (to make my awe32 pnp sb card work):
	(READPORT 0x020b)
	(ISOLATE)
	(IDENTIFY *)
	(CONFIGURE CTL00c5/392940333 (LD 0
	  (INT 0 (IRQ 5 (MODE +E)))
	  (DMA 1 (CHANNEL 5))
	  (IO 0 (BASE 0x0220))
	  (IO 1 (BASE 0x0330))
	  (IO 2 (BASE 0x0388))
	  (ACT Y)
	))

-Michele
