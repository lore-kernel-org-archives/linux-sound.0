From: Keith Duthie <psycho@albatross.co.nz>
Date: Wed, 17 Feb 1999 02:43:03 +0000
Subject: Re: mp3's not playing?
Message-Id: <marc-linux-sound-91921985832580@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91917509627068@msgid-missing>
In-Reply-To: <marc-linux-sound-91917509627068@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 16 Feb 1999, Rodrigo Castro wrote:

> Oh, I forget mentioning that but I already have dma16=5. That's not the
> problem. Maybe the guy who wrote the message I fowarded have forgetten
> but I haven't.
Aaargh! Try this : 
cat /etc/isapnp.conf | grep -v ^# >tmp.file
cat /etc/modules.conf >>tmp.file
cat tmp.file | mail -s aaargh -c psycho@albatross.co.nz linux-sound@vger.rutgers.edu

caviat: I'm not entirely sure the mail command will work as advertised,
but OTOH it should.

> > Besides which, the options should be in the /etc/modules.conf file. And
> > another thing: I believe the mpu should have an irq option, eg mpu_irq=9
> > (or mpuirq=9, whichever name the soundblaster uses)
> > 
> 
> No. MPU does not need IRQ when we are talking about Sound Blaster cards.
> The configuration, in compilation (of kernel or modules), must be filled
> with -1 when using SB cards. 
*SHRUG* That's a sb peculiarity, then.

> > If you use RedHat, then try the sndconfig utility. It doesn't work for me,
> > but it may work for you.
> 
> I use Debian distro.
And I use Slackware (which explains why sndconfig doesn't work for me).
-- 
.sig under deconstruction. Please watch out for falling stars.
