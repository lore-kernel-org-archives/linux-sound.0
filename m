Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542506;
	b=OGGGuBumXvlA45LGXc9g0UIqhotaUOEexBhVuVjJgGguHAzS43cPMSkfGPiqNP1w80xt
	 mwaSN+CHFs/rr7opwKENQ8iTmEyw/0ien9OuZvWgQX+sGfSnz/1ioa+tYx6NYFFkxFcy5
	 LwW6iqYpNmv3KE7YEGMrCu47+LJMOA91Ka3Zy5+0hiTer0N6i6ksJ0ub+0Ph4sRVZHwl0
	 c/Y3NkhGstYIT3dPKj9yNB9gc+26CUmcxZnQ7MxRFd1gWOdYPj4cZ0+EVKBwUVDsPzJDu
	 9oUPwKfpGJAdjTJTufSOTYnilm2soh2PNR7mFLKB0kVu4yrKGqeLJDDnIPkRqAlsGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542506;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FbpgvgXd+RhLjHlYHmt1AOHEgWjoEpEwQdslaM+LPqo=;
	b=qnkPe2Ak//FIRSSbh+FNydNIwihGFQcn4jJ15Gjh1ela5Quxc8UYftl2PrQgcaOPtIvD
	 qokxAMVt9LjYpZ/BkuH+VhEdUPIBEiDESeoUgIXn3TlXM44PMOH9nRlaachfEH6684rrG
	 EXdczvgCyiJLtXlOWxM6IIP5n4EX/DEbH/DrGHqTBX855DWZOMdcOJbdViZyREK3gKyBr
	 l/0jVA0Ag8kGWzgZ30fPsQTNfyCLATzOVExR9Bicy5PjiHQiJ+s8emvAmHe0Bso4J0j1R
	 LECz9cN2Pi0fazs+J//v9k9CgPYztDwoSRaPju3qppelqsghFJCSyFNpSdoHtbYeeLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiZsril1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4D606A31E;
	Tue, 24 Nov 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiZsril1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186321F000D0;
	Tue, 24 Nov 2026 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542506;
	bh=FbpgvgXd+RhLjHlYHmt1AOHEgWjoEpEwQdslaM+LPqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XiZsril1xvpm/n3F2ZIBphjjdNk5kTPUllffh7/oCjHsl1lgZRJeiMOxiv6fKSB37
	 Jgjva9aRC4lHxUCa6l+VJYhpl1fSHImlcOBx8iv4kG+w60FBvqU47aGpOy49A0d++q
	 BnBBd5SYARK2J6MckIXSR4TQAUM3TeTA9veBqgVBBGIb4arWvWathn+F6PgEymRZJu
	 LtfMezphEwxYkgFdcKITTfNBuNnm6+UWKBIhxmRAqd/dVXy8unYErjQ7gYMrI1eIcr
	 bGJufcbA/nVUNMppAf5NPDLad7p9FugjY0dryOBxw0Lqf8AlOly9oRWG2KxHWdyGuI
	 ub+topaBWBURw==
Message-ID: <sashiko-outbox-231744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0
 as soundwire dai
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:48:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] ASoC: qcom: use-after-free in qcom_snd_sdw_startup() [1]
--

commit 7f273de8112390d0dc0ac3f44c88e5ff3276352c
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai

This commit allows LPASS_CDC_DMA_WSA_RX0 to be initialized as a SoundWire
DAI and restricts LPASS CPU DAI ID matching to DSP bypass links so that
overlapping DSP DAI IDs are not matched.

> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 6576b47a4c8c3..669fb63207c91 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
[ ... ]
> @@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *subs=
tream)
>  	u32 rx_ch_cnt =3D 0, tx_ch_cnt =3D 0;
>  	int ret, i, j;
> =20
> -	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
> +	if (!qcom_snd_is_sdw_dai(rtd))
>  		return 0;
> =20
>  	sruntime =3D sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);

[Severity: Critical]
This problem wasn't introduced by this patch, but can [1]
qcom_snd_sdw_startup() leave dangling sruntime pointers in already
configured codec DAIs on error?

The loop below calls snd_soc_dai_set_stream() on each codec_dai, and if
snd_soc_dai_get_channel_map(), a later codec_dai, or
snd_soc_dai_set_channel_map() fails, the err_set_stream path releases
sruntime without clearing the stream pointers on the codecs that were
already set up:

sound/soc/qcom/sdw.c:qcom_snd_sdw_startup() {
	...
	for_each_rtd_codec_dais(rtd, i, codec_dai) {
		ret =3D snd_soc_dai_set_stream(codec_dai, sruntime,
					     substream->stream);
		if (ret < 0 && ret !=3D -ENOTSUPP) {
			...
			goto err_set_stream;
		} else if (ret =3D=3D -ENOTSUPP) {
			continue;
		}

		ret =3D snd_soc_dai_get_channel_map(codec_dai, &tx_ch_cnt, tx_ch,
						  &rx_ch_cnt, rx_ch);
		if (ret !=3D 0 && ret !=3D -ENOTSUPP) {
			...
			goto err_set_stream;
		}
		...
	}
	...
err_set_stream:
	sdw_release_stream(sruntime);

	return ret;
}

Subsequent stream accesses or teardown on those codecs will then trigger a
use-after-free on the freed sruntime.

[1] https://sashiko.dev/#/bug/linux-3eb5665f-b54d-4f37-aa26-a95e56e5e77e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-v2-0-174e159f0f69@linaro.org?part=3D18
