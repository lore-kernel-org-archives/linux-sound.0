From: Rodrigo Castro <rcastro@linux.ime.usp.br>
Date: Tue, 16 Feb 1999 15:05:17 +0000
Subject: Re: mp3's not playing?
Message-Id: <marc-linux-sound-91917775028978@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91917509627068@msgid-missing>
In-Reply-To: <marc-linux-sound-91917509627068@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 17 Feb 1999, Keith Duthie wrote:

> On Tue, 16 Feb 1999, Rodrigo Castro wrote:
> 
> > > I boot, isapnp loads and says it's configuring the card for dma's 1,5
> > > and irq5... then, I load the following modules as such...
> 
> > > /sbin/insmod sb io=0x220 irq=5 dma=1 mpu_io=0x330
> 
> > > Sound: DMA (output) timed out - IRQ/DRQ config error?
> 
> Read the excerpts. It reads like the other guy is a moron. Try adding in
> dma16=5 (or dma2=5 whichever the sb driver uses). That sounds like (one
> of) the problem(s).
> 

Oh, I forget mentioning that but I already have dma16=5. That's not the
problem. Maybe the guy who wrote the message I fowarded have forgetten
but I haven't.

> Besides which, the options should be in the /etc/modules.conf file. And
> another thing: I believe the mpu should have an irq option, eg mpu_irq=9
> (or mpuirq=9, whichever name the soundblaster uses)
> 

No. MPU does not need IRQ when we are talking about Sound Blaster cards.
The configuration, in compilation (of kernel or modules), must be filled
with -1 when using SB cards. 

> If you use RedHat, then try the sndconfig utility. It doesn't work for me,
> but it may work for you.

I use Debian distro.

Thank you anyway! ;-)
Rodrigo Castro   <rcastro@linux.ime.usp.br>
Computer Science undergraduate student - University of Sao Paulo
Rudeness is a weak man's imitation of strength.
