Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365434;
	b=BCOH2e/w+69FYkw9UMZo4apQnJjuG8yx2to2AGTBFo75EdCLWbidGChUd2wu/ic9wbpm
	 aI2cjsSwqkatwMZpn27Y2IKFvQB39kkQsUcvoY9uUmuHB9Z1vMkAs5FrNdzH0WVCx7Epk
	 NrDYFV2gtxlcLl3gXPOgRGmfZRF4Pw583t0sDlDF03o96WNdm5TDmNEFUsl0Dq5GPyna+
	 hbgHn9+uFQDvHHtWyxt76u6m1NkaSHabp0NMuGy3/Hkh/V86CbmCl+yQMfY9OHb3RER2X
	 B7wUWjkFFbQhDV4JpuaRjDyA+LE5eSf1EybCUG5emKPG0G2eMtO7+P/3Yvk6zHx2UJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GWAglO+5a4u/5RewBNuoI5oFRHjla/0a2x/fQ/FR7Qs=;
	b=nHM3dBvkA+nwDpcFZ18+SZ9xTSG3O+TlUKTx8oXqaXb9v1xfJVbX4wxvbLNz5HrA6w/o
	 3cCjSJYvPDJS7orMAuf3bnQsh0boOOiz5gh7CPoSXRgD0fgBOM4ZQhaIoymX+juM6mtFj
	 14bLBIHLM9xIn5qmpUn61IFGwf0bQW9rQgK7jlMfj8RBk7Z93boH6KL/+a8nIdGsovgKr
	 HXD6OvBEkSN7GAY8r7T1FMIwv7vyIAg8Wy74PFEZzOcKb1zEpsRMYc9DKpfwvuOgCN5Gt
	 H4pOwmy38u+w6XCnfMLkMUrQAV1NcG0evlnCjM06pwEn5Uxzc0UUAgGqi3Hb0rIWsRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKlKmn4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB04C606A320;
	Sun, 22 Nov 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKlKmn4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7721F000CA;
	Sun, 22 Nov 2026 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365434;
	bh=GWAglO+5a4u/5RewBNuoI5oFRHjla/0a2x/fQ/FR7Qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKlKmn4WpswSO5WmrnivF73DhK4v1tgyp5+E9fszQk/84w9Jd/mD6y6DPzsqu4Nyq
	 SrY4msmjCRCmMAMV0h0a1hYokzUz+4vbndVG1+SJt6w957tr28e1+SbFqO++cIM/LX
	 AYi++j63EDjwo7dIThFoB0vXZKe83u+pKd+cnYDanUCVezcSf+tR6uejgWZ2rVbAEn
	 /YgdQkEywEtAmaH7/U4j9qJeO66yp+66qHmG2np3j1CKObtWjupbwrnB5l2ST61S3N
	 EpMiwAGVcK9QQIJicFB4yiITBSeeDLHdCF13KT+3aQ6YouUjMNzsnRHbeBav+e1r0i
	 jwV512WLBvUHw==
Message-ID: <sashiko-outbox-228109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker
 temperature (T0) readback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:37:13 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: qcom: audioreach: raw 64-bit division in
  audioreach_get_sp_vi_t0() breaks 32-bit builds
- [Medium] ASoC: qcom: audioreach: T0 read in
  audioreach_vi_calibration_event() while PA is active
--

commit 3728c7efdae7573a4ea88b27f3a3cef2f0452415
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: qcom: audioreach: add live speaker temperature (T0) readback

This commit allows the machine driver to register speaker thermal zones in
VI channel order, exposes their Q6 temperatures via a read-only "Speaker
Protection T0" ALSA control, and records T0 alongside R0 when calibration
completes.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 97d8585a287ba..2bb56933b9de4 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
[ ... ]
> @@ -1605,6 +1613,50 @@ void audioreach_get_sp_vi_r0t0(long *vals, unsigne=
d int count)
>  	}
>  }
> =20
> +int audioreach_sp_register_speaker_map(struct thermal_zone_device * cons=
t *tzs,
> +				       unsigned int num)
> +{
[ ... ]
> +}
> +EXPORT_SYMBOL_GPL(audioreach_sp_register_speaker_map);
> +
> +/* Read each speaker's T0 in Q6 (degC * 64), 0 if its zone cannot be rea=
d */
> +int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
> +{
> +	unsigned int i, n;
> +
> +	guard(mutex)(&sp_speaker_map_lock);
> +
> +	n =3D min(count, sp_speaker_map.num);
> +	for (i =3D 0; i < n; i++) {
> +		int mdeg;
> +
> +		if (sp_speaker_map.tz[i] &&
> +		    !thermal_zone_get_temp(sp_speaker_map.tz[i], &mdeg))
> +			vals[i] =3D ((s64)mdeg * 64) / 1000;

[Severity: High]
Does dividing ((s64)mdeg * 64) with the plain / operator break 32-bit
builds (where SND_SOC_QDSP6 is reachable under ARCH_QCOM || COMPILE_TEST)
with an undefined reference to __aeabi_ldivmod or __divdi3?  Using
div_s64((s64)mdeg * 64, 1000) avoids the 64-bit division helper.

[ ... ]

> @@ -1730,12 +1783,20 @@ void audioreach_vi_calibration_event(struct devic=
e *dev,
>  			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
>  	}
> =20
> -	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
> +	/*
> +	 * Only a run where every speaker succeeded gives a usable R0/T0 set.
> +	 * The DSP reports only R0, so pair it with the speakers' last T0
> +	 * reading; a zone that cannot be read gives T0 =3D 0.
> +	 */
>  	if (success) {
> +		audioreach_get_sp_vi_t0(t0_live, num_ch);
> +
>  		guard(mutex)(&sp_vi_r0t0_cfg_lock);
>  		sp_vi_r0t0_cfg.num_ch =3D num_ch;
> -		for (i =3D 0; i < num_ch; i++)
> +		for (i =3D 0; i < num_ch; i++) {
>  			sp_vi_r0t0_cfg.r0_cali_q24[i] =3D cali->cali_param[i].r0_cali_q24;
> +			sp_vi_r0t0_cfg.t0_cali_q6[i] =3D (s16)t0_live[i];
> +		}
>  	}

[Severity: Medium]
Can audioreach_get_sp_vi_t0() here record 0 (0.000 degC in Q6) into
sp_vi_r0t0_cfg.t0_cali_q6[] on WSA884x speaker amplifiers because the PA is
still active when the calibration completion event arrives?

wsa884x_get_temp() cannot read hardware temperature registers while
wsa884x->pa_on is true and returns -EAGAIN unless wsa884x->temperature was
previously cached while the PA was off:

sound/soc/codecs/wsa884x.c:wsa884x_get_temp() {
    ...
	if (wsa884x->pa_on) {
		/*
		 * Reading temperature is possible only when Power Amplifier is
		 * off. Report last cached data if we have one, -EAGAIN otherwise.
		 */
		if (!wsa884x->temperature)
			return -EAGAIN;
		*temp =3D wsa884x->temperature * 1000;
		return 0;
	}
    ...
}

Because wsa884x_probe() enables its tripless thermal zone before SoundWire
attachment (while wsa884x->hw_init is false), wsa884x->temperature starts
at 0 and is not polled.  If calibration runs before anything reads the
thermal zone with the PA off, thermal_zone_get_temp() fails during
audioreach_vi_calibration_event() and t0_cali_q6[i] is set to 0, which lies
within [SP_VI_T0_MIN_Q6, SP_VI_T0_MAX_Q6] and is sent to the DSP as a 0 degC
calibration reference on subsequent normal playback.  Sampling
audioreach_get_sp_vi_t0() when arming calibration in DAI prepare (before
DAPM powers on the PA) would prime the reading while the PA is still off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D18
