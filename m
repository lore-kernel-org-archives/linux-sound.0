From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 28 Jul 2005 15:46:19 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050728154619.GM3528@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de>
In-Reply-To: <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thorsten Knabe <linux@thorsten-knabe.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Thu, Jul 28, 2005 at 05:04:20PM +0200, Thorsten Knabe wrote:
> On Tue, 26 Jul 2005, Adrian Bunk wrote:
> 
> >This patch schedules obsolete OSS drivers (with ALSA drivers that
> >support the same hardware) for removal.
> 
> Hello Adrian.

Hi Thorsten,

> I'm the maintainer of the OSS AD1816 sound driver. I'm aware of two 
> problems of the ALSA AD1816 driver, that do not show up with the OSS 
> driver:
> - According to my own experience and user reports audio is choppy with 
> some VoIP Softphones like gnophone at least when used with the ALSA OSS 
> emulation layer, whereas the OSS driver is crystal clear.
> - Users reported, that on some HP Kayak systems the on-board AD1816A 
> was not properly detected by the ALSA driver or was detected, but 
> there was no audio output. I'm not sure if the problem is still present in 
> the current ALSA driver, as I do not own such a system.
> 
> Maybe the OSS driver should stay in the kernel, until those problems are 
> fixed in the ALSA driver.

thanks for this note, I'll drop the AD1816 driver from my list.

> Regards
> Thorsten

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

