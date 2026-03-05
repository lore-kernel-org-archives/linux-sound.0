Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8429B22F;
	Thu,  5 Mar 2026 06:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691688; cv=none; b=uCjnfT/3BCOn9VMt0+HIAtPE0X1OnYAVlYoSlacTQCNbPaKHmM1pKZOKcylMrzrN2ebPat9nc2HawAUVSPwx2M8mSdobS2DSKiL8WScKWGJ/WvqCVw2seY44GiBMv4jEzyLqA3WcxFXYNFWhrx8kAQUuS5J9kp61z4SPynHiVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691688; c=relaxed/simple;
	bh=F7C4BRk18D0QQDUoxo6NttmALDgv2k9ynY+QQZdT1eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POhNbmwr37Gip+lYFSCrRnqiqp5VmGxsYj78tKnhBiG7Bc2KkMFJA662tA3F4ryb5xmd64OghPNKDGMqIU5GO1lKjtnMVgh6vYwrJcr1DE/hdwd1ThyQrFrsSE5ZYFlVkz9l0EC93tyDBJmTu5qLcTaec8RbYAGwxXH6DNzBMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (unknown [76.144.184.162])
	by host11.cruzio.com (Postfix) with ESMTPSA id DC7B81F0DB57;
	Wed,  4 Mar 2026 22:13:33 -0800 (PST)
Message-ID: <b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com>
Date: Wed, 4 Mar 2026 22:13:32 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based
 quirk table entry
To: Rong Zhang <i@rong.moe>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
 Arun Raghavan <arunr@valvesoftware.com>, linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
References: <20260301213726.428505-1-i@rong.moe>
 <20260301213726.428505-5-i@rong.moe>
Content-Language: en-US
From: Terry Junge <linuxsound@cosmicgizmosystems.com>
In-Reply-To: <20260301213726.428505-5-i@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/1/26 1:37 PM, Rong Zhang wrote:
> Some quirky devices do not have a unique VID/PID. Matching them using
> DEVICE_FLG() or VENDOR_FLG() may result in conflicts.
> 
> Add two new macros DEVICE_STRING_FLG() and VENDOR_STRING_FLG() to match
> USB string descriptors (manufacturer and/or product) in addition to VID
> and/or PID, so that we can deconflict these devices safely.
> 
> No functional change intended.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  sound/usb/quirks.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index c6a78efbcaa30..495dd46ce515c 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2,8 +2,10 @@
>  /*
>   */
>  
> +#include <linux/build_bug.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/usb.h>
>  #include <linux/usb/audio.h>
>  #include <linux/usb/midi.h>
> @@ -2135,16 +2137,39 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
>  /*
>   * driver behavior quirk flags
>   */
> +struct usb_string_match {
> +	const char *manufacturer;
> +	const char *product;
> +};
> +
>  struct usb_audio_quirk_flags_table {
>  	u32 id;
>  	u32 flags;
> +	const struct usb_string_match *usb_string_match;
>  };
>  
>  #define DEVICE_FLG(vid, pid, _flags) \
>  	{ .id = USB_ID(vid, pid), .flags = (_flags) }
>  #define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
>  
> +/* Use as a last resort if using DEVICE_FLG() is prone to VID/PID conflicts. */
> +#define DEVICE_STRING_FLG(vid, pid, _manufacturer, _product, _flags)	\
> +{									\
> +	.id = USB_ID(vid, pid),						\
> +	.usb_string_match = &(const struct usb_string_match) {		\
> +		.manufacturer = _manufacturer,				\
> +		.product = _product,					\
> +	},								\
> +	.flags = (_flags),						\
> +}
> +
> +/* Use as a last resort if using VENDOR_FLG() is prone to VID conflicts. */
> +#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
> +	DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
> +
>  static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> +	/* Device and string descriptor matches */
> +
>  	/* Device matches */
>  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
>  		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> @@ -2414,6 +2439,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
>  		   QUIRK_FLAG_ALIGN_TRANSFER),
>  
> +	/* Vendor and string descriptor matches */
> +
>  	/* Vendor matches */
>  	VENDOR_FLG(0x045e, /* MS Lifecam */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> @@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reason,
>  	}
>  }
>  
> +#define USB_STRING_SIZE 128
> +
> +static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
> +				      char *manufacturer, char *product)

Hi Rong,

This function is not necessary.
Both the manufacturer and product strings can be found in struct usb_device.

If the device has a manufacturer string then chip->dev->manufacturer points to it.
Otherwise chip->dev->manufacturer is null.

Likewise, chip->dev->product points to the product string if there is one, else null.

> +{
> +	int ret;
> +
> +	if (manufacturer) {
> +		ret = usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
> +				 manufacturer, USB_STRING_SIZE);
> +		if (ret < 0) {
> +			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (product) {
> +		ret = usb_string(chip->dev, chip->dev->descriptor.iProduct,
> +				 product, USB_STRING_SIZE);
> +		if (ret < 0) {
> +			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 1; /* ok */
> +}
> +
>  void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
>  {
>  	const struct usb_audio_quirk_flags_table *p;
> +	char manufacturer[USB_STRING_SIZE];
> +	char product[USB_STRING_SIZE];
> +	int got_usb_strings = 0; /* <0: error, 0: pending, >0: ok */
>  
>  	for (p = quirk_flags_table; p->id; p++) {
>  		if (chip->usb_id == p->id ||
>  		    (!USB_ID_PRODUCT(p->id) &&
>  		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
> +			if (!p->usb_string_match)
> +				goto apply; /* DEVICE_FLG or VENDOR_FLG */
> +
> +			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
> +			if (!got_usb_strings) {
> +				got_usb_strings = snd_usb_get_strings(chip,
> +					p->usb_string_match->manufacturer ? manufacturer : NULL,
> +					p->usb_string_match->product ? product : NULL);
> +			}

No need to get the strings as they can be found at chip->dev->manufacturer and chip->dev->product
if the device declared them.

> +
> +			BUILD_BUG_ON(!got_usb_strings);
> +
> +			if (got_usb_strings < 0)
> +				continue;
> +
> +			if (p->usb_string_match->manufacturer &&
> +			    strcmp(p->usb_string_match->manufacturer, manufacturer))
> +				continue;

Examples and intent:

DEVICE_STRING_FLG(vid, pid, "acme", "alpha", flags) // match vid, pid, "acme", and "alpha" strings
DEVICE_STRING_FLG(vid, pid, "acme", "", flags) // match vid, pid, "acme", and device has no product string
DEVICE_STRING_FLG(vid, pid, "acme", 0, flags) // match vid, pid, "acme", and any product string
DEVICE_STRING_FLG(vid, pid, 0, "alpha", flags) // match vid, pid, any manufacturer string, and "alpha"
DEVICE_STRING_FLG(vid, pid, "", "alpha", flags) // match vid, pid, no manufacturer string, and "alpha"
DEVICE_STRING_FLG(vid, pid, "", "", flags) // match vid, pid, no manufacturer, and no product strings

This test would change to something like

	if (p->usb_string_match->manufacturer &&
	    strcmp(p->usb_string_match->manufacturer, chip->dev->manufacturer ? chip->dev->manufacturer : ""))
		continue; 

> +
> +			if (p->usb_string_match->product &&
> +			    strcmp(p->usb_string_match->product, product))
> +				continue;

Same here but product instead of manufacturer.

Thanks,
Terry

> +
> +apply:
>  			snd_usb_apply_flag_dbg("builtin table", chip, p->flags);
>  			chip->quirk_flags |= p->flags;
>  			return;

