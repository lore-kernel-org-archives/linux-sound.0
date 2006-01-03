From: Lee Revell <rlrevell@joe-job.com>
Date: Tue, 03 Jan 2006 18:28:20 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1136312901.24703.59.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <200601031522.06898.s0348365@sms.ed.ac.uk> <20060103160502.GB5262@irc.pl>
	 <200601031629.21765.s0348365@sms.ed.ac.uk>
	 <20060103170316.GA12249@dspnet.fr.eu.org>
In-Reply-To: <20060103170316.GA12249@dspnet.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Galibert <galibert@pobox.com>
Cc: Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tue, 2006-01-03 at 18:03 +0100, Olivier Galibert wrote:
> On Tue, Jan 03, 2006 at 04:29:21PM +0000, Alistair John Strachan wrote:
> > This has nothing to do with the kernel option CONFIG_SND_OSSEMUL which Jan 
> > referred to, and to which I was responding. "aoss" is also not compatible 
> > with every conceivable program.
> 
> Especially not with plugins.  Flashplayer anybody?

Yes it's a known issue that the aoss emulation is not perfect, it's not
a reason to ditch ALSA, it's a reason to fix it.

Please provide a reproducible test case where an app *that we have the
source code for* works with native OSS or the in kernel /dev/dsp OSS
emulation and fails with the aoss/alsa-lib/userspace OSS emulation and
it will be fixed ASAP.

Lee

