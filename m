From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 26 Jul 2005 15:57:04 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <42E65D50.3040808@pobox.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <1122393073.18884.29.camel@mindpipe>
In-Reply-To: <1122393073.18884.29.camel@mindpipe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Adrian Bunk <bunk@stusta.de>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

Lee Revell wrote:
> On Tue, 2005-07-26 at 17:08 +0200, Adrian Bunk wrote:
> 
>>This patch schedules obsolete OSS drivers (with ALSA drivers that 
>>support the same hardware) for removal.
> 
> 
> How many non-obsolete OSS drivers were there?

someone needs to test the remaining PCI ID(s) that are in i810_audio but 
not ALSA.


