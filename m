From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Oct 2009 06:32:54 +0000
Subject: Re: [alsa-devel] [PATCH] [snd-usb-audio] Add match for JMTek USB sound	card
Message-Id: <s5hbpkdf7ft.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1255173329-20485-1-git-send-email-lkundrak@v3.sk>
In-Reply-To: <1255173329-20485-1-git-send-email-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Sat, 10 Oct 2009 13:15:29 +0200,
Lubomir Rintel wrote:
> 
> Entry for JMTek LLC., SSS USB Headphone Set in the quirk table.

The change look OK (suppose it was tested :)

Could you give your sign-off to merge to the upstream?


thanks,

Takashi

> ---
>  sound/usb/usbquirks.h |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/usb/usbquirks.h b/sound/usb/usbquirks.h
> index f6f201e..e98ff4c 100644
> --- a/sound/usb/usbquirks.h
> +++ b/sound/usb/usbquirks.h
> @@ -80,6 +80,19 @@
>  	.bInterfaceClass = USB_CLASS_AUDIO,
>  },
>  
> +/* JMTek, LLC. SSS USB Headphone Set */
> +{
> +	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
> +		       USB_DEVICE_ID_MATCH_DEV_CLASS |
> +		       USB_DEVICE_ID_MATCH_INT_CLASS |
> +		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
> +	.idVendor = 0x0c76,
> +	.idProduct = 0x1605,
> +	.bDeviceClass = USB_CLASS_PER_INTERFACE,
> +	.bInterfaceClass = USB_CLASS_AUDIO,
> +	.bInterfaceSubClass = USB_SUBCLASS_AUDIO_CONTROL
> +},
> +
>  /*
>   * Logitech QuickCam: bDeviceClass is vendor-specific, so generic interface
>   * class matches do not take effect without an explicit ID match.
> -- 
> 1.6.5.rc2
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
