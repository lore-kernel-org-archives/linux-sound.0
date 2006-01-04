From: Olivier Galibert <galibert@pobox.com>
Date: Wed, 04 Jan 2006 01:48:15 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060104014814.GA64416@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk> <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <1136334807.4106.51.camel@unreal>
In-Reply-To: <1136334807.4106.51.camel@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Cc: Tomasz K?oczko <kloczek@rudy.mif.pg.gda.pl>, linux-kernel@vger.kernel.org, zaitcev@yahoo.com, zwane@commfireservices.com, Thorsten Knabe <linux@thorsten-knabe.de>, jgarzik@pobox.com, parisc-linux@lists.parisc-linux.org, kyle@parisc-linux.org, zab@zabbo.net, linux-sound@vger.kernel.org, sailer@ife.ee.ethz.ch, James@superbug.demon.co.uk, alsa-devel@alsa-project.org, perex@suse.cz, Andi Kleen <ak@suse.de>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Tomasz Torcz <zdzichu@irc.pl>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>

On Wed, Jan 04, 2006 at 01:33:27AM +0100, Thomas Sailer wrote:
> On Wed, 2006-01-04 at 00:10 +0100, Tomasz K?oczko wrote:
> 
> > 1) ALSA API forces not use devices files and many things on sound managing
> >    level are handled on user space library. This dissallow civilized
> 
> Huh? Why's that? Actually, I welcome that ALSA does quite a lot in
> userspace, it could even do more. The whole format conversion and
> sampling rate conversion has no business in the kernel, IMO.

Doing things in userspace does not necessarily mean doing them in a
library, especially when it is required that the library be shared,
also known as "things _will_ break".

Especially since it tends to hide the real, user-accessible kernel
interface which has very, very annoying security implications.  At
that point, the ALSA kernel-userspace interface seems entirely
un-reviewed by the kernel people who have an eye for race conditions,
wandering userland pointers, information leaks, out-of-range accesses
and this kind of things (no patches from Al Viro on alsa?) and that
does not really give me a warm and fuzzy feeling.  And even if it is
reviewed at time t, it looks like it may change anytime a driver
author thinks it would help.  Not good at all.

  OG.

