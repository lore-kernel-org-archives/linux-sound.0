From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Wed, 04 Jan 2006 09:03:12 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.LNX.4.61.0601040956270.29257@yvahk01.tjqt.qr>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk>
 <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk>
 <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org


> 2) ALSA API is to complicated: most applications opens single sound
> stream.

Seconded.

> 3) ALSA kernel architecture is to complicated. This main reason why
> configuring sound on Linux is SO COMPLICATED. From my system:
>
> # lsmod | grep ^snd | wc -l
> 19
>

Why would you, or the "Desktop User Joe" using Torvalds-advertised KDE,
care about how many modules are loaded?

Splitting code up to make things more modular is A Good Choice most
of the times. There is, however, one point in which you have reason:
if the overall modular structure is bigger than a mono one, then it's
indeed "complicated".

> ALSA is also requires much more bigger code size than OSS variant
> (count all snd* modules size, jackd and libasound and compare this with
> OSS modules and user space OSS library size). Simillar is on allocated
> memory in all system sound components.
>
jackd does not count - ALSA works without it.

> Many task switches incurred by the current ALSA architecture
> add quickly up to perceivalble deleys during processing. In many cases
> sound must be handled with RT piorites so all code sise must possible
> small for handle this with minimal latency.
>
> 4) ALSA mixing model is UNSECURE by design because all mixing sound
> streams (for example with diffrent sampling rates) are performed
> in user space.
>
I'd rather have libasound segfault rather than my kernel oopsing, in case
someone forgot a NULL check.

> Also using jackd also "creates problems" with RTing this proccess and
> much more bigger problems on configure stage (for joe user).
> All this can be handled in secure and proprer RT prioprities
> ONLY on kernel space (so all gaming mith jackd or so is plain waste
> of time). Only on kernel level is possible correctly handle all this.
> With ALSA you can't extend in esy way for example SELinux for prevent
> intercept sound streem from microphone by remote user. Current OSS API
> is much more better for SELinux.
> Why ? because all mixing on OSS is performed on kernel level.
>
AFAICS, OSS does not do mixing at all in its current state.



Jan Engelhardt
-- 
