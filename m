From: Olivier Galibert <galibert@pobox.com>
Date: Thu, 05 Jan 2006 11:41:01 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060105114101.GA43299@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <200601041423.43206.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601041423.43206.s0348365@sms.ed.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, kloczek@rudy.mif.pg.gda.pl, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, linux-kernel@vger.kernel.org

On Wed, Jan 04, 2006 at 02:23:42PM +0000, Alistair John Strachan wrote:
> Or, take an ioctl approach (which people here seem to love; urgh):

I'm afraid you missed the point there.  ioctl or not ioctl is not
important, and yes, ioctls have a lot of problems.  The problem is
having a library define the public interface for kernel services.  I
don't see how come Linus accepted that, unless he doesn't really use
sound and just doesn't care, which is my current interpretation.

  OG.

