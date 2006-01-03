From: Olivier Galibert <galibert@pobox.com>
Date: Tue, 03 Jan 2006 19:24:49 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060103192449.GA26030@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601031716.13409.s0348365@sms.ed.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tue, Jan 03, 2006 at 05:16:13PM +0000, Alistair John Strachan wrote:
> This argument is basically watered down with devfs, udev, sysfs, etc. which 
> all have exactly the same issues. Should a crippled OSS API be the way 
> forward for Linux? I think not.

And they're getting some real backlash because of that now.  Hell,
Linus' message was about udev in the first place.

As for the OSS API being crippled, I'd take the 3 ioctl calls you need
to setup a simple stereo 16bits output with OSS than the 13 ALSA
library calls anyday.  Especially with the impressive lack of
documentation you get about what the hell is a period, or what you can
do except aborting when you get an error.


> > Also, not everybody wants to depend on a shared library.  I find this
> > "the alsa lib must be kept in lockstep with the kernel version" quite
> > annoying.  I'd rather not have the windows dll hell on linux, TYVM.
> > Or in other words, the public API of a kernel interface should _NEVER_
> > be a library only.  At least OSS, with all its issues, had that right.
> 
> Okay, I agree it's not ideal. But if you want software mixing, and it's a 
> genuinely useful feature, you either have to go down the road of running some 
> crappy daemon like arts or esound, or just link against libasound and get it 
> for free. I know I'd rather not have mixing routines in my kernel, thanks.

Duh, then don't put the mixing in the kernel, put the data routing
there.  That's a large part of what the kernel is about, moving data
around, and Linus' new magic pipes are perfect for that kind of use.

Then at system startup and through udev you can start whatever mixers,
sequencers, virtual interfaces and stuff you want.  Applications don't
need to care, and you don't have the amusing security issues around
what happens when different users want to use the sound card at the
same time.

  OG.
