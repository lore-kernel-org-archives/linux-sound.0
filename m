From: James Courtier-Dutton <James@superbug.demon.co.uk>
Date: Sun, 31 Jul 2005 13:38:34 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <42ECD45A.50803@superbug.demon.co.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
In-Reply-To: <20050726150837.GT3160@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

Adrian Bunk wrote:
> This patch schedules obsolete OSS drivers (with ALSA drivers that 
> support the same hardware) for removal.
> 
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> ---
> 
> I've Cc'ed the people listed in MAINTAINERS as being responsible for one 
> or more of these drivers, and I've also Cc'ed the ALSA people.
> 

I am happy for the emu10k1 OSS driver to go.
The ALSA driver has considerably more features now.

James
