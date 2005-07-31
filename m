From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 31 Jul 2005 19:36:54 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050731193654.GH3608@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <42E6645B.30206@zabbo.net> <20050726233837.459A.3.NOFFLE@islands.iskon.hr>
In-Reply-To: <20050726233837.459A.3.NOFFLE@islands.iskon.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zoran Dzelajlija <jelly+news@srk.fer.hr>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

On Wed, Jul 27, 2005 at 01:38:37AM +0200, Zoran Dzelajlija wrote:
> Zach Brown <zab@zabbo.net> wrote:
> > Adrian Bunk wrote:
> > > This patch schedules obsolete OSS drivers (with ALSA drivers that 
> > > support the same hardware) for removal.
> 
> > > I've Cc'ed the people listed in MAINTAINERS as being responsible for one 
> > > or more of these drivers, and I've also Cc'ed the ALSA people.
> 
> > I haven't touched the maestro drivers in so long (for near-total lack of
> > docs, etc.) that I can't be considered authoritative for approving it's
> > removal. If people are relying on it I certainly don't know who they
> > are.  In better news, Takashi should now have the pile of maestro
> > hardware that I used in the first pass to help him maintain the ALSA
> > driver..
> 
> The OSS maestro driver works better on my old Armada E500 laptop.  I tried
> ALSA after switching to 2.6, but the computer hung with 2.6.8.1 or 2.6.10 if
> I touched the volume buttons.  With OSS they just work.  The four separate
> dsp devices also look kind of more useful.

I've left it on the list of OSS drivers scheduled for removal based on 
Takashi's comment that the volume button problem should be fixed now.

If this problem is still present in 2.6.13-rc4, please open a bug at the 
ALSA bug tracking system [1] and tell me the bug number so that I can 
track it.

> Zoran

cu
Adrian

[1] https://bugtrack.alsa-project.org/alsa-bug/

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

