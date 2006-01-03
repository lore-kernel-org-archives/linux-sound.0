From: Olivier Galibert <galibert@pobox.com>
Date: Tue, 03 Jan 2006 17:03:16 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060103170316.GA12249@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031522.06898.s0348365@sms.ed.ac.uk> <20060103160502.GB5262@irc.pl> <200601031629.21765.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601031629.21765.s0348365@sms.ed.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tue, Jan 03, 2006 at 04:29:21PM +0000, Alistair John Strachan wrote:
> This has nothing to do with the kernel option CONFIG_SND_OSSEMUL which Jan 
> referred to, and to which I was responding. "aoss" is also not compatible 
> with every conceivable program.

Especially not with plugins.  Flashplayer anybody?


> This is exactly why the OSS emulation option in ALSA is really a last resort 
> and should not be an excuse for people to ignore implementing ALSA support 
> directly. More so, it is very good justification for ditching "everything 
> OSS" as soon as possible, at least in new software.

Actually the crappy state of OSS emulation is a good reason to ditch
ALSA in its current implementation.  As Linus reminded not so long
ago, backwards compatibility is extremely important.

Also, not everybody wants to depend on a shared library.  I find this
"the alsa lib must be kept in lockstep with the kernel version" quite
annoying.  I'd rather not have the windows dll hell on linux, TYVM.
Or in other words, the public API of a kernel interface should _NEVER_
be a library only.  At least OSS, with all its issues, had that right.

  OG.

