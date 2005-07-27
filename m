From: Jeff Garzik <jgarzik@pobox.com>
Date: Wed, 27 Jul 2005 20:43:37 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <42E7F1F9.2050105@pobox.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <1122393073.18884.29.camel@mindpipe> <42E65D50.3040808@pobox.com> <20050727182427.GH3160@stusta.de> <20050727203150.GF22686@tuxdriver.com>
In-Reply-To: <20050727203150.GF22686@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Adrian Bunk <bunk@stusta.de>, Lee Revell <rlrevell@joe-job.com>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

John W. Linville wrote:
> On Wed, Jul 27, 2005 at 08:24:28PM +0200, Adrian Bunk wrote:
> 
> 
>>I've grep'ed a second time for every single PCI ID in the OSS 
>>i810_audio, and I still haven't found WTF you are talking about.
> 
> 
> I looked as well, and I found nothing either.
> 
> Jeff, can you enlighten us?


ISTR Alan saying there was some ALi hardware that either wasn't in ALSA, 
or most likely didn't work in ALSA.  If Alan says I'm smoking crack, 
then you all can ignore me :)

	Jeff


