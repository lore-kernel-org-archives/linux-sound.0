Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046900;
	b=tECQL/E2r8F43dj5Hm1xqs4YGD6kHzHKcl89ZBmOttRG17b0KN3pprcWTaKi11copAIS
	 +UK+jbzIqJWum8rBQGlcXyrTW2v7ouOWxiaC9PLNpqsPhcBFu8V/QP+VM8Pq3I+Xo7SlS
	 kzna3bg0p++0YR84/VuBrIfh8AzdhZnnh/95t9aMYd5zYN27GSZndM/AGZZP+xIoUUm1y
	 8LVbGDuq6DoabqAx8e3p1RIQGkosQIM9xO3Qx8xwWP2Hi7ZvC3WNJUeM3uk+NMRvbT308
	 hppeGd+4gFRwmWwmj3fwgMX6ROfkuRP8ajKCCgsSTdETMsttZOGKMQtVMVtvoK/Z47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046900;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2vGcnCc2s6uKC2STHY56BY1aoxZaeW0IyFOwQidWTKc=;
	b=wW2hSIT8Ljs7rb2gFNg+9LU+YeBAkFB2NM+ytkJx7/XM7o+knSUYges8JUmDgR7E0mor
	 tY68RLrjqaJw0RYfF0VOISVxEyADbg9kJmfZ4Iopro74RFMtyRBqLTYKfpe1WRgxhF1VV
	 AZVVxvheUyvybw9uf4SHv7xUCWE8r/vI+1+05CBh1C/ZqEDDBFW11a1m//pw7uePeFvM/
	 ysQ0V+7yimuzoAx2CNtM3oNxQeA9NR6Hvi078AeYtZLy2qjATWQQFwZ0RjOfhNe3aJK3J
	 RJMGuHzCehU0QZ2L8OwCBjc8eqtiKaS7scHZTDbAxG6aF2KxuN8EYqbpPvdY3RTTLZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtWbUgsK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD263606A31D
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtWbUgsK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8328F1F031E1;
	Mon, 26 Oct 2026 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793046899;
	bh=2vGcnCc2s6uKC2STHY56BY1aoxZaeW0IyFOwQidWTKc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gtWbUgsKTPVJiqfPYi9s0+d5KeTQC4aSJG9qesSXg+xhi5qSD51xOGNWysbADXCf0
	 Gzd7JokHE1m+i7ZLkxOq9OMP7DOGPGKqaBG6gRCwE/JOh9Pn/i2t5eoKx1ilKtEzD7
	 a7NihONmkL3UCCXaqysMI/Q8XH/lC54RRXPX5vO7+OaDqJkAI0vXCcUqAFADSdWu0O
	 h2kt4VDtaUROD6P0kHTRGaHTcUkghJYK5d68KADlnbEMlk5C9zU3TG5rjQYXHVBhtW
	 bGLsTwlxZvXizd+fUhRuFSB+ur59D6/PFPMzPQVFNfnkRbLWdPn7OGjHShPs3JRL61
	 WuG27vMpDXQpg==
Message-ID: <sashiko-outbox-185729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/12] ASoC: codecs: wm8994: Implement set_jack callback
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amade@asmblr.net>, linux-sound@vger.kernel.org
In-Reply-To: <20261026201915.57184-4-amade@asmblr.net>
References: <20261026201915.57184-1-amade@asmblr.net>
 <20261026201915.57184-4-amade@asmblr.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 20:34:59 +0000
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
- [High] ASoC: wm8994: stale jack pointer and active work in wm8958_mic_det=
ect()
--

commit 0dc23f1f04114660da148a373855c1151a4983df
Author: Amadeusz S=C5=82awi=C5=84ski <amade@asmblr.net>

ASoC: codecs: wm8994: Implement set_jack callback

This commit implements the set_jack callback for the wm8994 component drive=
r,
delegating to wm8994_mic_detect() for WM8994 and wm8958_mic_detect() for
WM1811 and WM8958 so machine drivers can use snd_soc_component_set_jack().

> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index 6b91e02f130b3..69afba1764eb7 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4642,12 +4642,30 @@ static void wm8994_component_remove(struct snd_so=
c_component *component)
>  	kfree(wm8994->retune_mobile_texts);
>  }
> =20
> +static int wm8994_set_jack(struct snd_soc_component *component,
> +			   struct snd_soc_jack *jack, void *data)
> +{
> +	struct wm8994_priv *wm8994 =3D snd_soc_component_get_drvdata(component);
> +	struct wm8994 *control =3D wm8994->wm8994;
> +
> +	switch (control->type) {
> +	case WM8994:
> +		return wm8994_mic_detect(component, jack, data ? *(int *)data : 1);
> +	case WM1811:
> +	case WM8958:
> +		return wm8958_mic_detect(component, jack, NULL, NULL, NULL, NULL);

[Severity: High]
When snd_soc_component_set_jack(component, NULL, NULL) is called during jack
teardown or card unbind on WM1811 or WM8958, wm8994_set_jack() passes a NULL
jack pointer to wm8958_mic_detect().

In sound/soc/codecs/wm8994.c, the NULL jack branch of wm8958_mic_detect()
does not clear wm8994->micdet[0].jack or cancel pending delayed work:

	} else {
		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
				    WM8958_MICD_ENA, 0);
		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_NONE);
		snd_soc_dapm_disable_pin(dapm, "CLK_SYS");
		snd_soc_dapm_sync(dapm);
	}

Because wm8994->micdet[0].jack remains non-NULL, wm1811_jackdet_set_mode()
still treats jack detection as active:

	if (!wm8994->jackdet || !wm8994->micdet[0].jack)
		return;

	if (wm8994->active_refcount)
		mode =3D WM1811_JACKDET_MODE_AUDIO;

If wm8994->active_refcount is non-zero during teardown,
wm1811_jackdet_set_mode() overrides WM1811_JACKDET_MODE_NONE with
WM1811_JACKDET_MODE_AUDIO, and subsequent active_dereference() calls re-arm
hardware jack or microphone detection.

In addition, pending delayed work items such as wm8958_open_circuit_work,
wm1811_jackdet_bootstrap, wm1811_mic_work, and wm8958_mic_work are not
canceled and can still dereference the stale wm8994->micdet[0].jack pointer:

	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
			    wm8994->btn_mask |
			    SND_JACK_HEADSET);

Can this leave a dangling jack pointer and cause a use-after-free in
snd_soc_jack_report() after the jack is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026201915.5718=
4-1-amade@asmblr.net?part=3D3
