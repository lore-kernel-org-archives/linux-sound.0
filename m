Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688272;
	b=vmWXF81h2tpJIKZiGLQv6NrjXS0nLr4YweN9f9hArObZxL9mG98rQIkAl7lpDlhqQQhb
	 UN48vWTW6EfnAFoTsMTGT9dOOO0gbBjG8cyju2v4rc9FBzLZFiyM3D0S1+mRLUGfSPGZF
	 25xuCn1NFxk2q4RMhai8PHRk8T+Ikd/XzQQBg16svuBAb1wzAvpX1945HR3ZV5XVqO9Ip
	 y0CrLnQjTjXqC2JBGsAfQWZUeKkT7FSRstNcCQGkqZVeYNDiNMna0o1hIrK7zltZaFqSg
	 x4zH3Bi9c4FfGRV779R53cxpede+dPzDd9l1A5knTmqjPu8uaFGbzQIFYZWuN4hod2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pMhE5rKqRoH+Hcng7+XzN03VFco2MPae6BrjIx8neUs=;
	b=bLkNFGe+X0VNQTNJ1EDuk+7XkJUb1yQb+dvLvKy+AabkaH2cPGmK+qrnrMwWLQ64Lq83
	 9N0a5avZ3bgMoTfTXMJ6nH4xaRGt0ZuKGTx6498XdGZTZiMZbVBSqpa4voXuj1lBDZrkv
	 RfLrv5OBNkSTkjrt9mPAuTyObWdz8CtmW7mpmzz8plW6VONnxvU0BrIrY/uOfXauNWGXJ
	 g3e7A720Pkd7kfVi7q5J5kehxEwRaIhVmdFUoVXWm6jUUeAk83WFoPkhyrzZmXvdB6UTl
	 IAbP534qchHIgQJsY5r2Mr417VGxMljUxYDa32Jupx17AV+hEnhGtXFXRSFtXjmIxFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnTlrHnL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF998606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnTlrHnL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF411F01825;
	Thu, 22 Oct 2026 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792688271;
	bh=pMhE5rKqRoH+Hcng7+XzN03VFco2MPae6BrjIx8neUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnTlrHnLwlK2NmDTPiJ6rPrMEpkS8CYpr4ln4sdI69OIZOgCHRzxqy9GM1Q0Ghr/9
	 Ie5FThJR1/SvSxTXoNNr/YF7NhTxt46Ykt+wR7rkL/rnq8D2fhTgxR6AwUmfMcfBtD
	 n/jWlBw03GoLjKfSzJFSkAOyDfUBpvpkwYFhNkTrQXTqITCQTsh2DpOo2skHGi01MB
	 5z2JGErYAHGTGTja2K6FeFBMArM4D07Jv5hoHDLMMdyQE7Tfka6+/oMZq9BJGbYQz2
	 HGMpytwyRgUlHcWsrhz79l/KN4YP7z995BfWfX80ifpkPHLRHu5x0AKrhmvFzDYJZR
	 b2tVmVzJBLxuQ==
Message-ID: <sashiko-outbox-181835@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add quirk for Novation UltraNova
 (1235:0011)
Reply-To: sashiko-reviews@lists.linux.dev
To: rainey.shawn+kaudio@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com>
References: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 16:57:50 +0000
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
- [Medium] ALSA: usb-audio: missing .ep_idx =3D 1 in UltraNova capture audi=
oformat
--

commit aa83c7ced6942ef370a66b06613c33f74107f796
Author: Shawn Rainey <rainey.shawn+kaudio@gmail.com>

ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)

This commit adds a composite USB audio quirk for the Novation UltraNova
(1235:0011) with fixed playback and capture audio formats on interface 0
and a raw MIDI quirk on interface 1, while leaving the vendor control
interfaces unbound.

> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 6343a50fb2732..0b8bea76eca5b 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> +{
> +	/*
> +	 * Novation UltraNova: vendor-specific class descriptors, fixed
> +	 * audio and MIDI layouts.  Only the audio and MIDI interfaces
> +	 * (0 and 1) are grabbed; the vendor control interfaces (2/3)
> +	 * are left unbound for userspace access.
> +	 */
> +	USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
> +	QUIRK_DRIVER_INFO {
> +		.vendor_name =3D "Novation",
> +		.product_name =3D "UltraNova",
> +		QUIRK_DATA_COMPOSITE {
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(0) {
> +					/* playback */
> +					.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> +					.channels =3D 4,
> +					.iface =3D 0,
> +					.altsetting =3D 1,
> +					.altset_idx =3D 1,
> +					.attributes =3D UAC_EP_CS_ATTR_SAMPLE_RATE,
> +					.endpoint =3D 0x01,
> +					.ep_attr =3D USB_ENDPOINT_XFER_ISOC |
> +						   USB_ENDPOINT_SYNC_SYNC,
> +					.maxpacksize =3D 392,
> +					.rates =3D SNDRV_PCM_RATE_44100 |
> +						 SNDRV_PCM_RATE_48000,
> +					.rate_min =3D 44100,
> +					.rate_max =3D 48000,
> +					.nr_rates =3D 2,
> +					.rate_table =3D (unsigned int[]) {
> +						44100, 48000
> +					}
> +				}
> +			},
> +			{
> +				QUIRK_DATA_AUDIOFORMAT(0) {
> +					/* capture */
> +					.formats =3D SNDRV_PCM_FMTBIT_S24_3LE,
> +					.channels =3D 2,
> +					.iface =3D 0,
> +					.altsetting =3D 1,
> +					.altset_idx =3D 1,
> +					.attributes =3D UAC_EP_CS_ATTR_SAMPLE_RATE,
> +					.endpoint =3D 0x82,
> +					.ep_attr =3D USB_ENDPOINT_XFER_ISOC |
> +						   USB_ENDPOINT_SYNC_SYNC,

[Severity: Medium]
Should the capture QUIRK_DATA_AUDIOFORMAT(0) entry in usb_audio_ids in
sound/usb/quirks-table.h also set .ep_idx =3D 1?

Since capture endpoint 0x82 shares interface 0 altsetting 1 with playback
endpoint 0x01, endpoint 0x82 is the second endpoint descriptor on that
altsetting. Leaving .ep_idx unset defaults fp->ep_idx to 0.

When usb_audio_probe() -> snd_usb_create_quirk() ->
create_composite_quirk() -> create_fixed_stream_quirk() runs in
sound/usb/quirks.c:

	alts =3D &iface->altsetting[fp->altset_idx];
	altsd =3D get_iface_desc(alts);
	if (altsd->bNumEndpoints <=3D fp->ep_idx) {
		err =3D -EINVAL;
		goto error;
	}

having fp->ep_idx =3D=3D 0 only checks altsd->bNumEndpoints <=3D 0 and does=
 not
verify that a second endpoint descriptor exists on altsetting 1.

Next, in create_fixed_stream_quirk() -> add_audio_stream_from_fixed_fmt() ->
snd_usb_audioformat_set_sync_ep() in sound/usb/pcm.c:

	if (fmt->ep_idx > 0 || altsd->bNumEndpoints < 2)
		return 0;

	is_playback =3D !(get_endpoint(alts, 0)->bEndpointAddress & USB_DIR_IN);
	attr =3D fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
	if ((is_playback && (attr =3D=3D USB_ENDPOINT_SYNC_SYNC ||
			     attr =3D=3D USB_ENDPOINT_SYNC_ADAPTIVE)) ||
	    (!is_playback && attr !=3D USB_ENDPOINT_SYNC_ADAPTIVE))
		return 0;

because fmt->ep_idx is 0 rather than 1, snd_usb_audioformat_set_sync_ep()
does not return early at fmt->ep_idx > 0 and instead checks
get_endpoint(alts, 0) (playback endpoint 0x01), treating the capture
audioformat as is_playback =3D true. That also appears to be why omitting
USB_ENDPOINT_SYNC_SYNC caused generic sync-EP detection to pair 0x82 as a
sync endpoint for the capture direction as described in the commit message.

Additionally, when opening the capture endpoint via snd_usb_hw_params() ->
snd_usb_endpoint_open() in sound/usb/endpoint.c:

		} else {
			ep->iface =3D fp->iface;
			ep->altsetting =3D fp->altsetting;
			ep->ep_idx =3D fp->ep_idx;
		}

ep->ep_idx for endpoint 0x82 is recorded as 0 instead of 1.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164340.7866=
4-1-rainey.shawn+kaudio@gmail.com?part=3D1
