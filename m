From: Keith Duthie <psycho@albatross.co.nz>
Date: Tue, 16 Feb 1999 14:23:48 +0000
Subject: Re: mp3's not playing?
Message-Id: <marc-linux-sound-91917509627068@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 16 Feb 1999, Rodrigo Castro wrote:

> I have exactly the same problem as this guy. In my case, I have a SB32 PnP.
> 
> Any idea?
Yes

> P.S.: I put a SB16 non-PnP to test and it worked really fine. I guess the
> problem is in PnP, am I right?
Perhaps. OTOH, I doubt it.

> > I boot, isapnp loads and says it's configuring the card for dma's 1,5
> > and irq5... then, I load the following modules as such...

> > /sbin/insmod sb io=0x220 irq=5 dma=1 mpu_io=0x330

> > Sound: DMA (output) timed out - IRQ/DRQ config error?

Read the excerpts. It reads like the other guy is a moron. Try adding in
dma16=5 (or dma2=5 whichever the sb driver uses). That sounds like (one
of) the problem(s).

Besides which, the options should be in the /etc/modules.conf file. And
another thing: I believe the mpu should have an irq option, eg mpu_irq=9
(or mpuirq=9, whichever name the soundblaster uses)

If you use RedHat, then try the sndconfig utility. It doesn't work for me,
but it may work for you.
-- 
.sig under deconstruction. Please watch out for falling stars.
