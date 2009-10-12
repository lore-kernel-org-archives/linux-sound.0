From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Oct 2009 06:46:10 +0000
Subject: Re: [PATCH] Add match for JMTek USB sound card
Message-Id: <s5h63alf6tp.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <s5hbpkdf7ft.wl%tiwai@suse.de>
	<1255329761-24449-1-git-send-email-lkundrak@v3.sk>
In-Reply-To: <1255329761-24449-1-git-send-email-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Mon, 12 Oct 2009 08:42:40 +0200,
Lubomir Rintel wrote:
> 
> Entry for JMTek LLC., SSS USB Headphone Set in the quirk table.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks, applied now.


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
> 1.6.2.5
> 
