Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264826;
	b=ZZcuSRjPHNutQjEJIBQ13QjiY067fVLpLghdG4bVN/pKjX7qUICtiOmnPXsRy4lR6ETi
	 NlDYWs/GDv8OTsE5PRNkkqx+tiFHAMwesX2ZtQV1nxCfEm0AcYIu/3RyxVh0n8CIwYf2r
	 /qOWjo/9FXuPFuo4VWZqOTinQTC3XMl/9YcUr8VN3lZfUAz6aJ5pNMerGqA5tjSy+XiLU
	 MV0QA3oPJiq/WrzB83HHMJx5GTuA6I6hspb0tXHQObts4ILLnEYnrn9nNbekARoxw+NN2
	 2G+7NON5dSGzM9v6fQwv0a3t/Xh/6Hc5obOsYfvYFRLUSyGRPDuLkaiu4YySkqMrQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264826;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q6Ss5mIzc2QJ3f+XZ/yjHD1DQcu/+v2EH9y/wk/DnJA=;
	b=AhDUw4Cc6iZGyw8IdL0YeSq4nZOKCMWR59yR7A3BYZXojqSA+VfAY1Uqo2aWA/SGhwpP
	 ZkIShav2QFhq/dwWWTTayx/1MW7ww9KrdSF1Q9sp0I0OXQaoVITWg8jZbDANkK8xIeP+w
	 sBHDBbYh0Qr8v+p1zsvoIiy6SsWoj9DkSE3TaaR9iFcL3U77WZ52E1fwoJh4EthnLL2uY
	 HMYzC+bv64YVYqpeTLcQos9njJ0k/0fQQhpYGQ4vw1Sq47LyucqWuN/NRtC8mIIDRgj00
	 587ZPMLqGfujlv6E31SxQqViuIbbQN71Pa3YRQUfSu/K9Px+/hHw77R4YWTaYnb6IfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ1I8oCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AD606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ1I8oCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A1A1F0089F;
	Mon,  9 Nov 2026 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264825;
	bh=q6Ss5mIzc2QJ3f+XZ/yjHD1DQcu/+v2EH9y/wk/DnJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WJ1I8oCVGhvJ6u85oOO2MR6Cw2cm0X3wy1e42HVtejEwFPVM3q2UbP2B+nvDJs5Jj
	 lCdP2xuGbpQr96iRW/hc5FK8IEoK1ftZlTCyqZEn9PPEUV+9cN8L+zyTqwBVxWt7sd
	 q7Oa0a30OiOtulmTTPOdrEMEYBaOI1W/l08b2qKoo2pdzyenZwu2bspjZzET1oEXy0
	 ayjExrB+s1KAzZgNWQ2IofWgiwbLvSYeny56+JNs7vN97UndeZLmL61iM2wDfKi5aD
	 IEPY5Bj82efIyviNjNWCGHFH2I3CCYFShQ4FnLukBtQEdu+l0Ag5kqlsZWctJ45LpZ
	 a8e/a5gaKTg0Q==
Message-ID: <sashiko-outbox-205773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] ASoC: codecs: wcd934x: keep MCLK enabled so init
 writes reach the codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109-wcd934x-mclk-v1-1-ab86342e7ead@gmail.com>
References: <20261109-wcd934x-mclk-v1-1-ab86342e7ead@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:53:45 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: wcd934x: unchecked, leaked MCLK in wcd934x_comp_probe()
  and remove()
- [Medium] ASoC: wcd934x: always-on MCLK in wcd934x_comp_probe() breaks
  clock gating
- [Low] ASoC: wcd934x: missing Fixes trailer on wcd934x_comp_probe()
  MCLK fix
--

commit 4995c3fc995e247626bf6a941f670d9b5cfc1f8c
Author: Gaurav Suman <gauravsuman007@gmail.com>

> ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the codec
>
> On an LG G8x (SM8150, WCD9340 over SLIMbus) the microphones record
> digital silence on roughly half of all boots. Register dumps look
> correct because they are served from the regmap cache, but the
> writes never reached the hardware: the WCD934x digital core ignores
> register writes while its MCLK/sysclk is off.
>
> wcd934x_comp_init() runs with MCLK off unless the SoundWire master
> happened to probe first and enabled the clock through
> wcd934x_swrm_clock(); __wcd934x_cdc_mclk_enable(false) then leaves it
> running because the SWR clock bit is set. Probe ordering is not
> deterministic, which matches the random good and bad boots.
>
> Enable MCLK before wcd934x_comp_init() and leave it enabled, which is
> what the good boots already do. With this change 8 of 8 boots had a
> working microphone (before: about 3 in 5 silent).
>
> Enabling MCLK only around wcd934x_comp_init() (and disabling it
> again afterwards, as wcd934x_enable_efuse_sensing() does) was not
> enough: 2 of 4 boots were silent again, so later writes made while
> the clock is off are lost as well. An alternative would be to mark
> the cache dirty and resync whenever MCLK goes from off to on; this
> patch takes the simpler route at the cost of keeping MCLK running.
>
> The fault was found, the change written and the boot tests run with the
> help of an AI coding assistant (Claude Opus 5.5, Anthropic); I reviewed
> the change and the test results.
>
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes: tag?

  Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec=
")

> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 0ed24cca088f8..6b6ce5ba5d30d 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -2995,6 +2995,12 @@ static int wcd934x_comp_probe(struct snd_soc_compo=
nent *component)
>  	/* Default HPH Mode to Class-H Low HiFi */
>  	wcd->hph_mode =3D CLS_H_LOHIFI;
> =20
> +	/*
> +	 * The digital core drops register writes while MCLK is off, but the
> +	 * regmap cache still records them. Keep MCLK running so the init
> +	 * sequence below and later mixer/DAPM writes actually reach the codec.
> +	 */
> +	__wcd934x_cdc_mclk_enable(wcd, true);
>  	wcd934x_comp_init(component);
> =20
>  	for (i =3D 0; i < NUM_CODEC_DAIS; i++)

[Severity: Medium]
Does this leak wcd->extclk and wcd->sysclk_users when wcd934x_init_dmic()
fails or when wcd934x_comp_remove() runs?

__wcd934x_cdc_mclk_enable(wcd, true) prepares and enables wcd->extclk (which
is acquired via devm_clk_get() in the parent MFD driver) and increments
wcd->sysclk_users, but neither the wcd934x_init_dmic() error return in
wcd934x_comp_probe() nor wcd934x_comp_remove() calls
__wcd934x_cdc_mclk_enable(wcd, false).  Each component probe deferral or
card unbind leaks a clock prepare/enable count and sysclk_users reference,
and unbinding the parent MFD device triggers a clock framework WARN_ON for
freeing a prepared and enabled clock.

In addition, the return value of __wcd934x_cdc_mclk_enable(wcd, true) is
not checked, so if clk_prepare_enable(wcd->extclk) fails,
wcd934x_comp_init() still runs with MCLK disabled.

[Severity: Medium]
Does holding an unreleased __wcd934x_cdc_mclk_enable(wcd, true) reference
from wcd934x_comp_probe() prevent the driver from ever gating MCLK or
analog bias?

Because wcd->sysclk_users stays >=3D 1 for the lifetime of the component,
wcd934x_disable_ana_bias_and_syclk() can never reach zero when the DAPM
MCLK supply widget (wcd934x_codec_enable_mclk()), wcd934x_swrm_clock(), or
wcd934x_mbhc_request_micbias() disable MCLK:

sound/soc/codecs/wcd934x.c:wcd934x_disable_ana_bias_and_syclk() {
	scoped_guard(mutex, &wcd->sysclk_mutex) {
		if (--wcd->sysclk_users !=3D 0)
			return 0;
	}
    ...
}

This keeps WCD934X_CLK_SYS_MCLK_PRG, WCD934X_ANA_BIAS, and wcd->extclk
active across audio idle and system suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-wcd934x-mc=
lk-v1-1-ab86342e7ead@gmail.com?part=3D1
