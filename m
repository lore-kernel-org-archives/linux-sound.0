From: Olivier Galibert <galibert@pobox.com>
Date: Tue, 03 Jan 2006 21:40:18 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060103214018.GA41446@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk> <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de>
In-Reply-To: <20060103193736.GG3831@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tue, Jan 03, 2006 at 08:37:36PM +0100, Adrian Bunk wrote:
> The udev breakages might not have been nice, but OSS/ALSA is a 
> completely different issue:
> 
> OSS has been deprecated since ALSA was merged into the Linux kernel 
> _four years ago_.

OSS _drivers_ yes, OSS _api_ no.


> And I'm only talking about removing drivers _with ALSA drivers for the 
> same hardware available_.

Sure, and I have no problem with that.  OTOH you'll notice that this
particular subthread was specifically about the OSS api, not the
drivers.


> For a general OSS<->ALSA discussion, you are five years too late.

I couldn't predict 5 years ago that the ALSA API quality would be
somewhat lacking.

  OG.
