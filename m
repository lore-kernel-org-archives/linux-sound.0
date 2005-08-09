From: Adrian Bunk <bunk@stusta.de>
Date: Tue, 09 Aug 2005 17:49:06 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal (version 2)
Message-Id: <20050809174906.GA4006@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050729153226.GE3563@stusta.de> <1123607633.5601.7.camel@mindpipe>
In-Reply-To: <1123607633.5601.7.camel@mindpipe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>, gregkh@suse.de, NAGANO Daisuke <breeze.nagano@nifty.ne.jp>, alan@lxorguk.ukuu.org.uk, sailer@ife.ee.ethz.ch
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zaitcev@yahoo.com, Christoph Eckert <ce@christeck.de>, linux-usb-devel@lists.sourceforge.net

On Tue, Aug 09, 2005 at 01:13:51PM -0400, Lee Revell wrote:
> On Fri, 2005-07-29 at 17:32 +0200, Adrian Bunk wrote:
> > This patch schedules obsolete OSS drivers (with ALSA drivers that 
> > support the same hardware) for removal.
> > 
> > Scheduling the via82cxxx driver for removal was ACK'ed by Jeff Garzik.
> > 
> 
> Someone on linux-audio-user just pointed out that the OSS USB audio and
> midi modules were never deprecated, much less scheduled to be removed.
> 
> Maybe the best way to deprecate them is to move them to Sound -> OSS,
> that's where they belong anyway.

I'd deprecate them without moving them.

I'll send a patch unless someone tells that any functionality of these 
drivers is lacking in ALSA.

> Lee

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

