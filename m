From: Keith Duthie <psycho@albatross.co.nz>
Date: Wed, 17 Feb 1999 04:53:01 +0000
Subject: Re: Sound Card Problems
Message-Id: <marc-linux-sound-91922741704199@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91922152200751@msgid-missing>
In-Reply-To: <marc-linux-sound-91922152200751@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Okay, time to embarrass myself totally ;-)

On Wed, 17 Feb 1999, Rodrigo Castro wrote:

>     Here the files go:
> 
> --------------- isapnp.conf -------------------
> 
> (READPORT 0x0203)
> (ISOLATE)
> (IDENTIFY *)
> (VERIFYLD N)
> (CONFIGURE CTL0044/19829 (LD 0
>  (INT 0 (IRQ 5 (MODE +E)))
>  (DMA 0 (CHANNEL 1))
>  (DMA 1 (CHANNEL 5))
Try changing this to (DMA 1 (CHANNEL 3))

> --------- conf.modules -----------------
> 
> alias char-major-14 sb
> post-install sb /sbin/modprobe "-k" "adlib_card"
> options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
With, of course, the corresponding change here. Another thing you might
look at: does anything change if you do a pre-install of the adlib_card,
instead of a post-install? (not that I think it will, but...)

Also, what chipset are you using? I've read reports of the same problem on
the ESS1688 which went away after "esstype88" was given as an option 
when loading the sb module. If none of this works, send me the entire
isapnp.conf (with comments), and I'll see what I can see.

And finally, I suggest you might like to get sndconfig, and see if that'll
work for you (even though you use Debian, and not RedHat).
-- 
.sig under deconstruction. Please watch out for falling stars.
