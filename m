Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720488;
	b=huteprdoTCO7y2n7W5VmLnLZfogpJufGL4mTB0hx7Ejz/OdViDW9cn2xU0ta57CYOurI
	 gOqKUT03zSxr3Ext7zK5wYH3tL7kNFKwMJoenNYagTfTwkAerDW5VVRjkiw2Z2yRjcKEF
	 9pI1wVWghPK0zHEg8Wm78ja5D2gjcH2ZNd/omBPTRoSCtqV5GrSmbBe8Po04tqyNQixiB
	 C/Ebz7C10SsZtEBYEbhO+urrG10AnDUugoOGZ/CjKBlAPoVsCVkcQyuCjYhYKj2wxn6uD
	 cIGxQZ1D+Y868ZzVnG4a8vuWCnpqoMeAmJkkDJKMcel/jnLhXCdF6bVnyBE+Oyrxfeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lNaKs6mL6jXHp90Uhnd8IiqodNzFM1+2me3Tqe1DYDI=;
	b=088KX90sPCJhlCNEoG7xX5blpCIeQuG1yrWwgAX2f42iqxUeVIHZtbrtV5p+Jk23Azql
	 GKftSLwDWUOMa/LyX/Yma4XAEpv6EE3vgCYMrOYcU5USP0qhOThwWXyRD+fF05Vxemfsi
	 1GlRRcA3u98cVC5xJPnGNGvVP6PKJdpwaOeTFX44sfP80M8u+V6MCFrMRN59OHObh3wQq
	 ig5bloy81aa1iO7ai51z6+uB2uDEsWAKAQr6ePdUEi7BG5XbSvQLMT7+5sGjU8rIFDOlN
	 BgRX1W6Pd+9o6bPR6hYEV4REpSPm4UxnaXMLGmj2g7AFF46Yuu+bNdtq+SmX1OSXTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2h+2CE9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C3606EE9D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2h+2CE9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335661F01577;
	Tue,  3 Nov 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720487;
	bh=lNaKs6mL6jXHp90Uhnd8IiqodNzFM1+2me3Tqe1DYDI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=j2h+2CE9xs50MuxBiPDqtQ6NANvcJ5VuNgPmG6n94Fsz7GJZ2BocmPGCXI7GpXI++
	 gx8jHb1eN4XHZghZiU6MhSsb2DBOWhju3afYghHdYjYpcSe32EuhKf+kvm+xSkwfGq
	 CdCkcRJ/rVfqnDbVha33GfGKvGj13bUoVruKmjX7ksyblyZSRq/qIDv+KYjluDTpL9
	 2tbnFGy5dM5kKOuSfrgjLvEm9uJcJxsvW8ta9xGRaLwe2FxPa6ULRmbgD/KU6Adq8/
	 YyjhUVBVxX1MKdmhj2/v45fm/BSNygTZl8dj6C/jQDjFfAcKizb9tPblaljrQU0gGQ
	 BFs4kBzAt9KfQ==
Message-ID: <sashiko-outbox-195634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Abort properly at errors for Extidy
 boot quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261103153123.112097-1-tiwai@suse.de>
References: <20261103153123.112097-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:41:26 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ALSA: usb-audio: short read and config leak in snd_usb_extigy_bo=
ot_quirk()
--

commit a1ee9b55505d63c42061631f3b97d61b782917c1
Author: Takashi Iwai <tiwai@suse.de>

ALSA: usb-audio: Abort properly at errors for Extidy boot quirk

This commit updates snd_usb_extigy_boot_quirk() to abort with -ENODEV and l=
og
with dev_err() when usb_get_descriptor() fails or returns a bNumConfigurati=
ons
value exceeding the original descriptor's count.

> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 05a9f6727a3a5..220ac9b10238c 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -575,13 +575,18 @@ static int snd_usb_extigy_boot_quirk(struct usb_dev=
ice *dev, struct usb_interfac
>  			return -ENOMEM;
>  		err =3D usb_get_descriptor(dev, USB_DT_DEVICE, 0,
>  				new_device_descriptor, sizeof(*new_device_descriptor));
> -		if (err < 0)
> -			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> -		if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumCo=
nfigurations)
> -			dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
> +		if (err < 0) {
> +			dev_err(&dev->dev, "error usb_get_descriptor: %d\n", err);
> +			return -ENODEV;
> +		}
> +
> +		if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumCo=
nfigurations) {
> +			dev_err(&dev->dev, "error too large bNumConfigurations: %d\n",
>  				new_device_descriptor->bNumConfigurations);
> -		else
> -			memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descripto=
r));
> +			return -ENODEV;
> +		}
> +
> +		memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor=
));

[Severity: Medium]
Can a short read from usb_get_descriptor() or a smaller bNumConfigurations
value cause dev->descriptor to be overwritten with a zero-padded descriptor
and leak per-configuration resources in usb_destroy_configuration()?

In drivers/usb/core/message.c:usb_get_descriptor(), the buffer is first zer=
oed
with memset() and the function returns the number of bytes transferred:

drivers/usb/core/message.c:usb_get_descriptor() {
	memset(buf, 0, size);	/* Make sure we parse really received data */

	for (i =3D 0; i < 3; ++i) {
		/* retry on length 0 or error; some devices are flakey */
		result =3D usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
				USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
				(type << 8) + index, 0, buf, size,
				USB_CTRL_GET_TIMEOUT);
		if (result <=3D 0 && result !=3D -ETIMEDOUT)
			continue;
		if (result > 1 && ((u8 *)buf)[1] !=3D type) {
			result =3D -ENODATA;
			continue;
		}
		break;
	}
	return result;
}

If the transfer returns 0 bytes on all retries, or returns a partial descri=
ptor
shorter than sizeof(*new_device_descriptor), usb_get_descriptor() returns a
non-negative byte count smaller than sizeof(*new_device_descriptor). Because
bNumConfigurations is the final byte of struct usb_device_descriptor, it
remains 0 on any short read, passing both the err < 0 check and the
new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurati=
ons
check before memcpy() overwrites dev->descriptor.

Similarly, if a full read returns a smaller bNumConfigurations than the
original dev->descriptor.bNumConfigurations used when usb_get_configuration=
()
allocated dev->config and dev->rawdescriptors, overwriting dev->descriptor
reduces dev->descriptor.bNumConfigurations. When the device is later cleaned
up in drivers/usb/core/config.c:usb_destroy_configuration():

drivers/usb/core/config.c:usb_destroy_configuration() {
	if (dev->rawdescriptors) {
		for (i =3D 0; i < dev->descriptor.bNumConfigurations; i++)
			kfree(dev->rawdescriptors[i]);

		kfree(dev->rawdescriptors);
		dev->rawdescriptors =3D NULL;
	}

	for (c =3D 0; c < dev->descriptor.bNumConfigurations; c++) {
		struct usb_host_config *cf =3D &dev->config[c];

		kfree(cf->string);
		for (i =3D 0; i < cf->desc.bNumInterfaces; i++) {
			if (cf->intf_cache[i])
				kref_put(&cf->intf_cache[i]->ref,
					  usb_release_interface_cache);
		}
	}
}

wouldn't this leak dev->rawdescriptors[i], cf->string, and cf->intf_cache[i]
for the remaining configurations? Should snd_usb_extigy_boot_quirk() check
err < sizeof(*new_device_descriptor) (or err !=3D sizeof(*new_device_descri=
ptor))
andnew_device_descriptor->bNumConfigurations !=3D dev->descriptor.bNumConfi=
gurations
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103153123.1120=
97-1-tiwai@suse.de?part=3D1
