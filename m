From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 30 Oct 2009 10:32:26 +0000
Subject: Re: [PATCH] SND_CS5535AUDIO: Remove the X86 platform dependency
Message-Id: <s5hr5slyxxh.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1255190029-17584-1-git-send-email-wuzhangjin@gmail.com>
	<1255573374.7638.22.camel@falcon>
In-Reply-To: <1255573374.7638.22.camel@falcon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wuzhangjin@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mips <linux-mips@linux-mips.org>, loongson-dev@googlegroups.com, Jaya Kumar <jayakumar.lkml@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Linus Torvalds <torvalds@linux-foundation.org>, linux-sound@vger.kernel.org

At Thu, 15 Oct 2009 10:22:54 +0800,
Wu Zhangjin wrote:
> 
> Add CC to: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
> 
> SND_CS5535AUDIO is available on Loongson(MIPS compatible) family
> machines, and checked it with ARCH=x86_64, no relative compiling
> warnings & errors, so, remove the platform dependency directly.
> 
> Reported-by: rixed@happyleptic.org
> Acked-by: Andres Salomon <dilinger@collabora.co.uk>
> Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>

Thanks, applied now.


Takashi

> ---
>  sound/pci/Kconfig |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
> index fb5ee3c..75c602b 100644
> --- a/sound/pci/Kconfig
> +++ b/sound/pci/Kconfig
> @@ -259,7 +259,6 @@ config SND_CS5530
>  
>  config SND_CS5535AUDIO
>  	tristate "CS5535/CS5536 Audio"
> -	depends on X86 && !X86_64
>  	select SND_PCM
>  	select SND_AC97_CODEC
>  	help
> -- 
> 1.6.2.1
> 
> 
