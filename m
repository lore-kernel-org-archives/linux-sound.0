Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693213;
	b=xbGuVinrPkSDr8ODpVkXnNfVMj6GjkIM6H8uu1ZyDNnLszfegMRU/hPNsRAWukogBhUj
	 iWI28XgP0j0gA/QmnBl9UV+Evxu0cbSORTk+jUWRENtIthfVdiQ00sO0o4tY0i1M5qwV0
	 zZ7U8ZOaYagsvJobsHZ9SLihNX+w1H8dZh9ayWn6J/n0tvFKGYgc2e++78TkQD+nF6B2e
	 VInfXUg6BXw898fEpbAMpW1lKSOEGQNNqmJS6BUSsoUlgZlk+mw8WPWDqlbjtNaOPWsfN
	 9TtEtAYHbbZlBWEFQeQ8XltVUWPjvNCrYtd6RyCnDi/oSPUK5XAGquEF5OoL3RZQJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JclcvXHy2DXCC5hr3NEDabg+4Xh7w86pp4vxCaz1UXQ=;
	b=Z6uHfTVAVpSi3fEDvs6La8GUYv48PCR/hwZO6oE7HLKEw3JRzZMXhjeHq5bTiv/UQ4js
	 AgVIR6Hq6A5GHza/0Av0rYLUgqaDlbhaYmYzod0IP9MOpsjxehxH0k2on0tNUPPBBrlDv
	 v8ZDULo1msYg3ghPUlP12bciR5LTV554vq3uqzIUuhOaoaIV2NKUjqUbNH4BsWmfpsEi9
	 AVpYqGpVetf48eER7qFqA3wTLqRcT5GJ5VfXTAvZY2fkPwfhbTm7DI3wbndY/OUfpmSVZ
	 Sj5eTuGPOF5g0gVg6Ub6IP6BMtCY7eub/RERa5vZTcpRSpK3S4CPrcxWlrWQYDcalPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UC049uWl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1615606A324;
	Tue,  3 Nov 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UC049uWl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E3A1F000C1;
	Tue,  3 Nov 2026 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793693212;
	bh=JclcvXHy2DXCC5hr3NEDabg+4Xh7w86pp4vxCaz1UXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UC049uWlKlqC8ZjmF/KevDbY/n4oCitZ5wRDOm8Eq9gT4Ur+6D6vCMOdc7LdNxURt
	 wSYX6ZazDqXb3iy+HbcjgTd2iV6ggEpRrtPmVwAsdrbOXzuU+wlcw/1KX5Sc9tXFUK
	 4KzgiLDC5LMGwtxIW83NPOczdikKs+/S9TrLPeMXVlJ8lB+NXZSXbCVpaX/ocevLmH
	 bAcgM+yhFKgLm0IwVxjk30dOCGC7k2YVYYPyoacrvXSsBhY9wmab0kh5FfHH6dTumb
	 8kl3CWx4U/OLUBO4dEYf6oNuskMah7bn3gMJJJ/l7cWJTKShjQWIvNMwmNLHuu5eXf
	 wiy4FbghC0qEw==
Message-ID: <sashiko-outbox-194797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-6-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:06:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ASoC: ops: return value mismatch with kernel-doc in snd_soc_set_=
enum_kctl()
- [Low] ASoC: ops: commit subject names static helper instead of snd_soc_se=
t_enum_kctl()
--

commit 2c9f602d361cf2e55c7e8d05183ffda527ff209d
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: ops: Introduce 'soc_set_enum_kctl'

This commit introduces snd_soc_set_enum_kctl() and its internal helper
soc_set_enum_kctl() so machine drivers can set enumerated ALSA controls to a
desired string value, such as during fixup_controls.

>     ASoC: ops: Introduce 'soc_set_enum_kctl'
>    =20
>     The new function is to be used to set enumerated controls to desired
>     values. It is something a machine driver may call in fixup_controls.
>    =20
>     Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>     Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

[Severity: Low]
Should the commit subject refer to snd_soc_set_enum_kctl instead of
soc_set_enum_kctl?

In sound/soc/soc-ops.c, soc_set_enum_kctl() is a file-local static helper,
whereas snd_soc_set_enum_kctl() is the exported function declared in
include/sound/soc.h for machine drivers to call in fixup_controls.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 1d60e290e40e4..1cd7f1caefe4d 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
> =20
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *valu=
e)
> +{

[ ... ]

> +	for (i =3D 0; i < info->count; i++)
> +		evalue->value.enumerated.item[i] =3D sel;
> +
> +	return kctl->put(kctl, evalue);
> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +			  const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +
> +	kctl =3D snd_soc_card_get_kcontrol(card, name);
> +	if (!kctl) {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name=
, value);
> +		return -EINVAL;
> +	}
> +
> +	return soc_set_enum_kctl(kctl, value);
> +}

[Severity: Medium]
Does snd_soc_set_enum_kctl() return 1 instead of 0 when the control value is
updated, contradicting its kernel-doc comment?

When snd_soc_set_enum_kctl() calls soc_set_enum_kctl() to change an
enumerated control to a value different from its current state,
soc_set_enum_kctl() directly returns the result of kctl->put(kctl, evalue).
In ALSA and ASoC, snd_kcontrol_put_t callbacks such as
snd_soc_put_enum_double() and snd_soc_dapm_put_enum_double() return 1 when
the control value changes, 0 when it is unchanged, and a negative error code
on failure. Any caller checking for a non-zero return value based on the
documented contract would treat a changed control value as an error.

In the same file, snd_soc_clip_to_platform_max() normalizes the kctl->put()
return value to 0:

sound/soc/soc-ops.c:snd_soc_clip_to_platform_max() {
    ...
	ret =3D kctl->put(kctl, uctl);
	if (ret < 0)
		return ret;

	return 0;
}

whereas snd_soc_ctl_activate() documents the tri-state return value with a
colon after Return as expected by kernel-doc:

 * Return: 0 if unchanged, 1 if changed, or a negative error code on failur=
e.

Should soc_set_enum_kctl() clamp non-negative returns from kctl->put() to 0,
or should the kernel-doc Return: section for snd_soc_set_enum_kctl() docume=
nt
that it returns 0 if unchanged, 1 if changed, or a negative error code on
failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D6
