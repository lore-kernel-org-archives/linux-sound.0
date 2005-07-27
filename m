From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 27 Jul 2005 18:24:28 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050727182427.GH3160@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <1122393073.18884.29.camel@mindpipe> <42E65D50.3040808@pobox.com>
In-Reply-To: <42E65D50.3040808@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Lee Revell <rlrevell@joe-job.com>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On Tue, Jul 26, 2005 at 11:57:04AM -0400, Jeff Garzik wrote:
> Lee Revell wrote:
> >On Tue, 2005-07-26 at 17:08 +0200, Adrian Bunk wrote:
> >
> >>This patch schedules obsolete OSS drivers (with ALSA drivers that 
> >>support the same hardware) for removal.
> >
> >
> >How many non-obsolete OSS drivers were there?
> 
> someone needs to test the remaining PCI ID(s) that are in i810_audio but 
> not ALSA.

I've grep'ed a second time for every single PCI ID in the OSS 
i810_audio, and I still haven't found WTF you are talking about.

Once again my question:

I though I found every single PCI ID from this driver in ALSA.
Which PCI IDs did I miss?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

