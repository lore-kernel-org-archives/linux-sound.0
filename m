Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984012;
	b=IZ+kX6MdTv4NAHmsUCDZ6U4MOTY2gDuBAiROx42XWm69KBLgKo5HCDXS7ax99enpWlBV
	 3MfjQzB33+CitkbRnFPqCDJvvu6fX6JkDIkxNKEaJ1yPxlWWqiq1hvZ5z/VU6g5aRY7is
	 PLYr5Biqej2koj664FefDO9j4KueoZvy4THdUleU1ZFSl6eSqLcnWfKlO/GI54OnAfIwZ
	 LAwYqUdgfKThwiUmtPdOUeuHKFZYKFw3zS3k9oVoZm3fk3u3IcAb1F2OlcVZsz4Rl3Jm+
	 8brNVnLmSRObF8ZaLcHzFHO+6OCRzKGoTsSvubJ0ULJvT1Fa2OgPT+xljc7IyU+TLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BbdGsid/zl8fNNW7thUdtmlETF+pLGktNne+TeVvdC4=;
	b=MqlnBuBDtcIkzb0yxzA2R8pm7v4zWLmcOD4lS6qKHLmXQ88exHedNnOkGtBE/fF2UTC+
	 I+uXDNeHsTdCjFZGVbsP27szp47pV4WjcDbYJ77zeCHAKLDCMgLpaRu1CTxgALywJuBUz
	 n/QpD9qtf9nwnM8LnuqUjU16lOrjLi6vcn25OYDZAzfzdtAyPZAPHSUDAqwzKQ1Y0nvsY
	 eqC6EX31B/yLJapI1UBFrJq8JJEFj4s2PBaz59tbJ+lu02Qr9BBbKiqE3huip71mc/2tn
	 PI+rXbfkBGWAukQVDOVlAilmi8KZHO3YtLe8AuWA1QVn8l2xCcJdpWhq1146ON7ntMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nap2AyFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F73606A32D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nap2AyFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062A71F0089F;
	Fri,  6 Nov 2026 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984012;
	bh=BbdGsid/zl8fNNW7thUdtmlETF+pLGktNne+TeVvdC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nap2AyFIGe+OXbpWpnDC67T24c2yyzFU0qCvd8497ZuUHLx45DZ0O1OoJu1rpQVvr
	 lDqxmsDjj7Ey0lFjeQP/sHeXTdWiGSOqeUwBWrn6gjHdZ/+2QI+8nZLnpkHdiJFnRI
	 DlVpIMOmaZp5OxVYttipIlf1CXGPd9eM4xTwIMz4C1Pzbe5UcrdgEjfODIbu7YLpxh
	 iJfwW4wdoQHgFCb45wGWkURYxrhfgmQv47X8wPzKdMBZ0dz/c4tyLSwHR6/cen33ya
	 iLB1T8grKYbRMSzhIpKVXfS0Tx0m3aw8pCvCLecMYpmTPoEItPwHlssfOdGMLqEnhv
	 wQCszeX/C2DRQ==
Message-ID: <sashiko-outbox-201869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Will Porter" <mrwillporter@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106163129.1006907-14-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
 <20261106163129.1006907-14-mrwillporter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:53:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: mixer_audient: unselectable enum item in
  snd_ctl_audient_info() breaks UAPI
--

commit 11b395622645c1753139b078b4521e003601a600
Author: Will Porter <mrwillporter@gmail.com>

ALSA: mixer_audient: Add enumerated controls

This commit adds support for enumerated mixer controls in the Audient USB
mixer driver, including a trailing read-only item for unknown or unconfirmed
device values.

> diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
> index c4ce2340f8bba..3e6cd8981b4f1 100644
> --- a/sound/usb/mixer_audient.c
> +++ b/sound/usb/mixer_audient.c

[ ... ]

> @@ -560,12 +582,116 @@ static int snd_ctl_audient_integer_set(struct snd_=
kcontrol *kctl,

[ ... ]

> +static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
> +				    struct snd_ctl_elem_value *ctl_val)
> +{
> +	struct usb_mixer_elem_info *const elem =3D snd_kcontrol_chip(kctl);
> +	struct usb_mixer_interface *const mixer =3D elem->head.mixer;
> +
> +	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
> +	const struct snd_audient_ctrl_type *const ctype
> +						=3D snd_audient_kctl_type(kctl);
> +	const struct snd_audient_enum *const e =3D ctype->enumeration;
> +	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
> +
> +	unsigned int i;
> +	int changed =3D 0;
> +
> +	for (i =3D 0; i < hwchan; i++)
> +		if (ctl_val->value.enumerated.item[i] >=3D e->items)
> +			return -EINVAL;

[ ... ]

>  static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
>  			    struct snd_ctl_elem_info *uinfo)
>  {
>  	const struct snd_audient_ctrl_type *const ctype
>  						=3D snd_audient_kctl_type(kctl);
> =20
> +	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
> +					 ctype->enumeration->items + 1,
> +					 ctype->enumeration->texts);

[Severity: Medium]
Does advertising ctype->enumeration->items + 1 items in snd_ctl_audient_inf=
o()
while rejecting item index e->items with -EINVAL in snd_ctl_audient_enum_se=
t()
break the ALSA control UAPI contract for writable enumerated controls?

For a SNDRV_CTL_ELEM_ACCESS_READWRITE enumerated control, userspace expects
all advertised item indices (0 .. uinfo->value.enumerated.items - 1) to be
valid on write. Rejecting the last advertised item causes the ALSA mixer-te=
st
kselftest (test_ctl_write_valid_enumerated() and test_ctl_write_side_effect=
s())
to fail on every enumerated control, and breaks alsactl store/restore or
multi-channel read-modify-write updates whenever snd_ctl_audient_enum_get()
returns e->items.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106163129.1006=
907-1-mrwillporter@gmail.com?part=3D13
