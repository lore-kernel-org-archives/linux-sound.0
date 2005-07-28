From: Jaroslav Kysela <perex@suse.cz>
Date: Thu, 28 Jul 2005 13:43:49 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.LNX.4.61.0507281542420.8458@tm8103.perex-int.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>  <1122393073.18884.29.camel@mindpipe>
 <42E65D50.3040808@pobox.com>  <20050727182427.GH3160@stusta.de>
 <20050727203150.GF22686@tuxdriver.com>  <42E7F1F9.2050105@pobox.com>
 <1122559208.32126.8.camel@localhost.localdomain>
In-Reply-To: <1122559208.32126.8.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jeff Garzik <jgarzik@pobox.com>, "John W. Linville" <linville@tuxdriver.com>, Adrian Bunk <bunk@stusta.de>, Lee Revell <rlrevell@joe-job.com>, LKML <linux-kernel@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, Takashi Iwai <tiwai@suse.de>

On Thu, 28 Jul 2005, Alan Cox wrote:

> On Mer, 2005-07-27 at 16:43 -0400, Jeff Garzik wrote:
> > ISTR Alan saying there was some ALi hardware that either wasn't in ALSA, 
> > or most likely didn't work in ALSA.  If Alan says I'm smoking crack, 
> > then you all can ignore me :)
> 
> The only big thing I know that still needed OSS (and may still do so) is
> the support for AC97 wired touchscreens and the like. Has that been
> ported to ALSA ?

We're working on this issue right now.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
Linux Kernel Sound Maintainer
ALSA Project, SUSE Labs
