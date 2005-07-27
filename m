From: Kyle McMartin <kyle@parisc-linux.org>
Date: Wed, 27 Jul 2005 18:39:42 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050727183942.GA2964@roadwarrior.mcmartin.ca>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
In-Reply-To: <20050726150837.GT3160@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On Tue, Jul 26, 2005 at 05:08:37PM +0200, Adrian Bunk wrote:
> This patch schedules obsolete OSS drivers (with ALSA drivers that 
> support the same hardware) for removal.

oss/harmony.c can probably go, unless someone from parisc-linux
objects. I've written a (working) replacement[1] for oss/ad1889.c
which is in our cvs, and will go upstream shortly. oss/ad1889.c
doesn't (and hasn't ever) worked, so it should probably be removed.

Stuart, Randolph, comments?

1. http://cvs.parisc-linux.org/linux-2.6/sound/pci/ad1889.c?rev=1.30&view=markup

Cheers,
-- 
Kyle McMartin
