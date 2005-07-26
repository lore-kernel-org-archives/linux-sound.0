From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 26 Jul 2005 15:41:31 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <9a8748490507260841698859e4@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
In-Reply-To: <20050726150837.GT3160@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On 7/26/05, Adrian Bunk <bunk@stusta.de> wrote:
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
> Please tell if any my driver selections is wrong.
> 
>  Documentation/feature-removal-schedule.txt |    7 +
>  sound/oss/Kconfig                          |   79 ++++++++++++---------
>  2 files changed, 54 insertions(+), 32 deletions(-)
> 
> --- linux-2.6.13-rc3-mm1-full/Documentation/feature-removal-schedule.txt.old    2005-07-26 16:50:05.000000000 +0200
> +++ linux-2.6.13-rc3-mm1-full/Documentation/feature-removal-schedule.txt        2005-07-26 16:51:24.000000000 +0200
> @@ -44,0 +45,7 @@
> +What:  drivers depending on OBSOLETE_OSS_DRIVER
> +When:  October 2005
> +Why:   OSS drivers with ALSA replacements
> +Who:   Adrian Bunk <bunk@stusta.de>
> +
> +---------------------------
> +
> --- linux-2.6.13-rc3-mm1-modular/sound/oss/Kconfig.old  2005-07-23 21:04:56.000000000 +0200
> +++ linux-2.6.13-rc3-mm1-modular/sound/oss/Kconfig      2005-07-24 01:22:11.000000000 +0200
> @@ -4,9 +4,24 @@
>  # More hacking for modularisation.
>  #
>  # Prompt user for primary drivers.
> +
> +config OBSOLETE_OSS_DRIVER
> +       bool "Obsolete OSS drivers"
> +       depends on SOUND_PRIME
> +       help
> +         This patch enables support for obsolete OSS drivers that

                      s/patch/option/  ???

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
