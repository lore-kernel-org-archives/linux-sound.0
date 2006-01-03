From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 03 Jan 2006 20:22:58 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <s5h1wzpnjrx.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	<200601031522.06898.s0348365@sms.ed.ac.uk>
	<20060103160502.GB5262@irc.pl>
	<200601031629.21765.s0348365@sms.ed.ac.uk>
	<20060103170316.GA12249@dspnet.fr.eu.org>
In-Reply-To: <20060103170316.GA12249@dspnet.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Galibert <galibert@pobox.com>
Cc: Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

At Tue, 3 Jan 2006 18:03:16 +0100,
Olivier Galibert wrote:
> 
> > This is exactly why the OSS emulation option in ALSA is really a last resort 
> > and should not be an excuse for people to ignore implementing ALSA support 
> > directly. More so, it is very good justification for ditching "everything 
> > OSS" as soon as possible, at least in new software.
> 
> Actually the crappy state of OSS emulation is a good reason to ditch
> ALSA in its current implementation.  As Linus reminded not so long
> ago, backwards compatibility is extremely important.

Well, we keep the compatibility exactly -- OSS drivers don't support
software mixing in the kernel, too :)


Takashi
