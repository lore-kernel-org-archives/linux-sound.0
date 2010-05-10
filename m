From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 May 2010 08:29:31 +0000
Subject: Re: [PATCH] snd-hda-intel: add support for Lenovo ThinkPad X100e in conexant codec
Message-Id: <s5hsk60xiqc.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <4BE716C1.3030305@udo.edu>
In-Reply-To: <4BE716C1.3030305@udo.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Cc: alex.pototskiy@gmail.com, tdavis@dsl-only.net, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

At Sun, 09 May 2010 22:10:41 +0200,
Andrej Gelenberg wrote:
> 
> Ideapad quirks working for my ThinkPad X100e (microphone is not tested).
> 
> Signed-off-by: Andrej Gelenberg <andrej.gelenberg@udo.edu>

Thanks, applied now with a slight modification (coding-style, the list
sorting and a more intuitive string).


Takashi

> ---
>   sound/pci/hda/patch_conexant.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index 56e5207..b56c52a 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -2847,6 +2847,7 @@ static struct snd_pci_quirk cxt5066_cfg_tbl[] = {
>          SND_PCI_QUIRK(0x1179, 0xff50, "Toshiba Satellite 
> P500-PSPGSC-01800T", CXT5066_OLPC_XO_1_5),
>          SND_PCI_QUIRK(0x1179, 0xffe0, "Toshiba Satellite Pro T130-15F", 
> CXT5066_OLPC_XO_1_5),
>          SND_PCI_QUIRK(0x17aa, 0x3a0d, "ideapad", CXT5066_IDEAPAD),
> +       SND_PCI_QUIRK(0x17aa, 0x21b2, "ideapad", CXT5066_IDEAPAD), // X100e
>          {}
>   };
> 
> -- 
> 1.7.1
> 
