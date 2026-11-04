Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781544;
	b=nzj5mtyMD3YI6hKT7fk/B2mIqmkKXiI6uXLNzMfN97gQEWYteG3vX7Hjtsz/NtQfidsU
	 +HWz4q+yQ8yKHF4ADufMyM7dVkz3Feazf6+ejOD+6Pvzw3/LkxDURiUTT+tNevwLG73Pa
	 B+HhdT3MqEhvG1bt87kM6RWu1QIG0lDLViUvmtAdYmM4eKts+NmInJlBVbZJqfeOTvhS6
	 40mWvjrFrrDQYztRUFzLRPhBv8n+//aVsqt8yxt/XLfGy/6EUJZfv+6OBgzvJMrN9Ei01
	 YMWEz8qbzrlSalUXY+T7TF0KEMGjeebaKnpVDsETkh7IUnCf7uMZ7deIlZiq+df9/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781544;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+SFAmIgJkrYqhYDgAl3dZELKR8vej0Oc6F1sUMciH/g=;
	b=AHzAS7vYpQ0a8eM+19sdYLTsMlWPV0GnnVGRvdWW86fYb05F6hxGm3yaIMEQCWTBetAI
	 6xpsAh54RILPfxy9blfKJ78RA09o4+NQBKwodK4AtChq7g6sdn6pwjM9W3bDD+/UxrH2Q
	 6GBUf+7BYrKMxdvTwP6Edt34XKmW22YS0LExKfugVQc58y7blZg7bPho77K7UsvTT0Ihp
	 nbXK/UjQqMQIGe+16judi45rk1G5xXWVheTew85NBkTAJOCFBtinMcC16dGSWe8OfvbQG
	 3kwuY2P9tgWG0HF0mVHEsPbX9ra0kz9qBFFQMr2/g4R+4YClz3NGr8K3nGPQBoSC/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itbeR0nv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0A606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itbeR0nv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B701F000C1;
	Wed,  4 Nov 2026 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793781543;
	bh=+SFAmIgJkrYqhYDgAl3dZELKR8vej0Oc6F1sUMciH/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=itbeR0nviziSuBDTHNu4iLcjkAw4n7mQFXhZD+/fREY2/mnEgu9ebdhZ1Tow+f6fI
	 mFV2/swYU/4c1/8ziLn19FnQEMQw2/5qFlGwApOXbQLNDnvQCdd7E2Hvl36xP1QVSV
	 36qhBZT1yviYEEhjVjy0jZy2k7zcAiqETAyhT6IZY7gW9PYRbAhlgX3/v3tUuZPyKF
	 7BWXJYpmw3dkj+JGmM9IjTyLLatp6fuJGbdYjV1gV6pGR/XmHNOz3FwIOvdqomCbQe
	 /4Ncc0c+q9jBlsQRlwFzD1gXe2ZW5lpvem8GWAOyXMRDNrTTZ0lSRuOQT9fvOGkC+F
	 wDOWCMGskOC5A==
Message-ID: <sashiko-outbox-196882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hdsp: Fix divide-by-zero in DDS offset control
Reply-To: sashiko-reviews@lists.linux.dev
To: songxiebing <songxiebing@kylinos.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104083045.1939479-1-songxiebing@kylinos.cn>
References: <20261104083045.1939479-1-songxiebing@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:39:03 +0000
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
- [Medium] ALSA: hdsp: incomplete offset validation in hdsp_set_dds_offset()
--

commit a91b0358087c1f7f09a07e8d353cc380f3a7e223
Author: Bob Song <songxiebing@kylinos.cn>

ALSA: hdsp: Fix divide-by-zero in DDS offset control

This commit updates hdsp_set_dds_offset() to reject non-positive target
sample rates with -EINVAL before calling hdsp_set_dds_value() to prevent a
divide-by-zero in div_u64().

> diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
> index 7dce548b9f363..694816f966d29 100644
> --- a/sound/pci/rme9652/hdsp.c
> +++ b/sound/pci/rme9652/hdsp.c
> @@ -2802,6 +2802,9 @@ static int hdsp_dds_offset(struct hdsp *hdsp)
>  static int hdsp_set_dds_offset(struct hdsp *hdsp, int offset_hz)
>  {
>  	int rate =3D hdsp->system_sample_rate + offset_hz;
> +
> +	if (rate <=3D 0)
> +		return -EINVAL;

[Severity: Medium]
Is checking rate <=3D 0 sufficient to validate offset_hz here?

When snd_hdsp_put_dds_offset() calls hdsp_set_dds_offset(), offset_hz comes
from ucontrol->value.integer.value[0] without enforcing the [-5000, 5000]
range declared in snd_hdsp_info_dds_offset():

sound/pci/rme9652/hdsp.c:snd_hdsp_info_dds_offset() {
	...
	uinfo->value.integer.min =3D -5000;
	uinfo->value.integer.max =3D 5000;
	return 0;
}

First, adding an unvalidated positive offset_hz to hdsp->system_sample_rate
can overflow a signed 32-bit int.

Second, a positive rate in the range 1..24414 (for example, passing
offset_hz =3D 1 - hdsp->system_sample_rate) still passes the rate <=3D 0 ch=
eck
and reaches hdsp_set_dds_value():

sound/pci/rme9652/hdsp.c:hdsp_set_dds_value() {
	...
	n =3D DDS_NUMERATOR;
	n =3D div_u64(n, rate);
	/* n should be less than 2^32 for being written to FREQ register */
	snd_BUG_ON(n >> 32);
	/* HDSP_freqReg and HDSP_resetPointer are the same, so keep the DDS
	   value to write it after a reset */
	hdsp->dds_value =3D n;
	hdsp_write(hdsp, HDSP_freqReg, hdsp->dds_value);
}

Because DDS_NUMERATOR is 104857600000000ULL, any rate in 1..24414 produces
n >=3D 2^32, which triggers snd_BUG_ON(n >> 32) and truncates n when writing
hdsp->dds_value and HDSP_freqReg. Offsets outside [-5000, 5000] can also
cross the 56000 or 112000 thresholds in hdsp_set_dds_value(), whereas
hdsp_dds_offset() chooses the 2x or 4x multiplier based on
hdsp->system_sample_rate.

In addition, when hdsp_set_dds_offset() returns -EINVAL, its caller
snd_hdsp_put_dds_offset() drops the error code:

sound/pci/rme9652/hdsp.c:snd_hdsp_put_dds_offset() {
	...
	if (val !=3D hdsp_dds_offset(hdsp))
		change =3D (hdsp_set_dds_offset(hdsp, val) =3D=3D 0) ? 1 : 0;
	...
	return change;
}

Should hdsp_set_dds_offset() validate that offset_hz is within
[-5000, 5000] before computing rate, and should snd_hdsp_put_dds_offset()
propagate negative error codes from hdsp_set_dds_offset()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104083045.1939=
479-1-songxiebing@kylinos.cn?part=3D1
