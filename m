From: Andrew Haninger <ahaning@gmail.com>
Date: Tue, 26 Jul 2005 16:17:14 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <105c793f050726091722f3cbb2@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
In-Reply-To: <20050726150837.GT3160@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On 7/26/05, Adrian Bunk <bunk@stusta.de> wrote:
>  config SOUND_OPL3SA2
>         tristate "Yamaha OPL3-SA2 and SA3 based PnP cards"
> -       depends on SOUND_OSS
> +       depends on SOUND_OSS && OBSOLETE_OSS_DRIVER
>         help
>           Say Y or M if you have a card based on one of these Yamaha sound
>           chipsets or the "SAx", which is actually a SA3. Read
Forgive me if I'm misreading this (I'm hardly a coder and no kernel
hacker) but, as it stands, the OPL3SA2 driver provided by ALSA and the
main kernel tree work but are not correctly detected by ALSA's
detection routines (in alsaconf) on the 2.6 kernel. The OSS drivers
work, as well, but (AFAIK) there are no methods of automatic
configuration with the OSS drivers.

So, for people who don't feel like configuring ALSA with their OPL3SA2
card, the OSS modules may be easier to configure and thus should be
left in until the ALSA/2.6 kernel problems are worked out with the
OPL3SA2.

-Andy
