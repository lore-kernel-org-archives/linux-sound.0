From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 04 Jan 2006 17:48:28 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <s5hu0cj995f.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	<20060104123538.GE7222@wotan.suse.de>
	<Pine.LNX.4.61.0601041337340.9321@tm8103.perex-int.cz>
	<200601041731.18344.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601041731.18344.s0348365@sms.ed.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: Jaroslav Kysela <perex@suse.cz>, Andi Kleen <ak@suse.de>, Joern Nettingsmeier <nettings@folkwang-hochschule.de>, Tomasz K?oczko <kloczek@rudy.mif.pg.gda.pl>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

At Wed, 4 Jan 2006 17:31:18 +0000,
Alistair John Strachan wrote:
> 
> On Wednesday 04 January 2006 12:41, Jaroslav Kysela wrote:
> > On Wed, 4 Jan 2006, Andi Kleen wrote:
> > > > this is like whining about the oh so complex networking infrastructure
> > > > and iptables and constantly reminiscing how simple it used to be to set
> > > > up a modem on /dev/ttyS0.
> > >
> > > Can be nearly all CONFIGured out. With the removal of the sane
> > > sound drivers that would be impossible though.
> >
> > The code reduction is possible also for the ALSA midlevel code.
> > For example, removing the verbose /proc support might save some bytes and
> > so on.
> 
> But can more be done? Andi's not pointed anything out in particular (unless I 
> am mistaken), but could more of ALSA be configurable, even if it is at the 
> expense of userspace API features?

For example, we can make supported ac97 codecs selectable so that not
all codes are compiled in.  The middle layer may contain functions
which are not used by your drivers.  They can be reduced, too.


Takashi
