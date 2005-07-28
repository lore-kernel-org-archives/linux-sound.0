From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 28 Jul 2005 13:44:10 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <1122559208.32126.8.camel@localhost.localdomain>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <1122393073.18884.29.camel@mindpipe> <42E65D50.3040808@pobox.com>
	 <20050727182427.GH3160@stusta.de> <20050727203150.GF22686@tuxdriver.com>
	 <42E7F1F9.2050105@pobox.com>
In-Reply-To: <42E7F1F9.2050105@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Adrian Bunk <bunk@stusta.de>, Lee Revell <rlrevell@joe-job.com>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On Mer, 2005-07-27 at 16:43 -0400, Jeff Garzik wrote:
> ISTR Alan saying there was some ALi hardware that either wasn't in ALSA, 
> or most likely didn't work in ALSA.  If Alan says I'm smoking crack, 
> then you all can ignore me :)

The only big thing I know that still needed OSS (and may still do so) is
the support for AC97 wired touchscreens and the like. Has that been
ported to ALSA ?

