From: Pete Zaitcev <zaitcev@redhat.com>
Date: Wed, 04 Jan 2006 11:00:34 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060104030034.6b780485.zaitcev@redhat.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	<20060103193736.GG3831@stusta.de>
	<Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
	<mailman.1136368805.14661.linux-kernel2news@redhat.com>
In-Reply-To: <mailman.1136368805.14661.linux-kernel2news@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>, kloczek@rudy.mif.pg.gda.pl
Cc: Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@redhat.com, linux-kernel@vger.kernel.org

On Wed, 4 Jan 2006 09:37:55 +0000, Alistair John Strachan <s0348365@sms.ed.ac.uk> wrote:

> > 2) ALSA API is to complicated: most applications opens single sound
> >    stream.
> 
> FUD and nonsense. []
> http://devzero.co.uk/~alistair/alsa/

That's the kicker, isn't it? Once you get used to it, it's a workable
API, if kinky and verbose. I have a real life example, too:
 http://people.redhat.com/zaitcev/linux/mpg123-0.59r-p3.diff
But arriving on the solution costed a lot of torn hair. Look at this
bald head here! And who is going to pay my medical bills when ALSA
causes me ulcers, Jaroslav?

-- Pete
