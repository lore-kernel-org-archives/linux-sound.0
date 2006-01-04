From: Jaroslav Kysela <perex@suse.cz>
Date: Wed, 04 Jan 2006 12:41:41 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.LNX.4.61.0601041337340.9321@tm8103.perex-int.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk>
 <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk>
 <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <43BBBBFF.5020209@folkwang-hochschule.de> <20060104123538.GE7222@wotan.suse.de>
In-Reply-To: <20060104123538.GE7222@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Joern Nettingsmeier <nettings@folkwang-hochschule.de>, Tomasz K?oczko <kloczek@rudy.mif.pg.gda.pl>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Wed, 4 Jan 2006, Andi Kleen wrote:

> > this is like whining about the oh so complex networking infrastructure 
> > and iptables and constantly reminiscing how simple it used to be to set 
> > up a modem on /dev/ttyS0.
> 
> Can be nearly all CONFIGured out. With the removal of the sane
> sound drivers that would be impossible though.

The code reduction is possible also for the ALSA midlevel code.
For example, removing the verbose /proc support might save some bytes and 
so on.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
Linux Kernel Sound Maintainer
ALSA Project, SUSE Labs
