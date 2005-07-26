From: Zach Brown <zab@zabbo.net>
Date: Tue, 26 Jul 2005 16:27:07 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <42E6645B.30206@zabbo.net>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
In-Reply-To: <20050726150837.GT3160@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

Adrian Bunk wrote:
> This patch schedules obsolete OSS drivers (with ALSA drivers that 
> support the same hardware) for removal.

> I've Cc'ed the people listed in MAINTAINERS as being responsible for one 
> or more of these drivers, and I've also Cc'ed the ALSA people.

I haven't touched the maestro drivers in so long (for near-total lack of
docs, etc.) that I can't be considered authoritative for approving it's
removal.  If people are relying on it I certainly don't know who they
are.  In better news, Takashi should now have the pile of maestro
hardware that I used in the first pass to help him maintain the ALSA
driver..

- z
