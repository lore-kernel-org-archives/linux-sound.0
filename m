From: "John W. Linville" <linville@tuxdriver.com>
Date: Tue, 26 Jul 2005 17:49:33 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050726174931.GD6974@tuxdriver.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <42E65B34.9080700@pobox.com> <1122396587.18884.34.camel@mindpipe>
In-Reply-To: <1122396587.18884.34.camel@mindpipe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, Adrian Bunk <bunk@stusta.de>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On Tue, Jul 26, 2005 at 12:49:46PM -0400, Lee Revell wrote:
> On Tue, 2005-07-26 at 11:48 -0400, Jeff Garzik wrote:
> > NAK for i810_audio:  ALSA doesn't have all the PCI IDs (which must be 
> > verified -- you cannot just add the PCI IDs for some hardware)
> 
> Some of them might be in snd-hda-intel in addition to snd-intel8x0.

Hmmm...I don't think that would work.  If there are IDs listed in
both i810_audio and snd-hda-intel, it is probably a mistake.

John
-- 
John W. Linville
linville@tuxdriver.com
