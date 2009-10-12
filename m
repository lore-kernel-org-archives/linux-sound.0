From: Clemens Ladisch <clemens@ladisch.de>
Date: Mon, 12 Oct 2009 06:46:26 +0000
Subject: Re: [PATCH] [snd-usb-audio] Add match for JMTek USB sound	card
Message-Id: <4AD2D0C2.40307@ladisch.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1255173329-20485-1-git-send-email-lkundrak@v3.sk>
In-Reply-To: <1255173329-20485-1-git-send-email-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.de

Lubomir Rintel wrote:
> Entry for JMTek LLC., SSS USB Headphone Set in the quirk table.

Please add an explaination why this entry is needed.  At first glance,
this entry seems to describe a class-compliant device that should not
need a quirk.

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


Best regards,
Clemens
