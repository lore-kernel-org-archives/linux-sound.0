Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744462;
	b=JD/HOBOiAOijrentaApXcssm0wwKLUjiYEli3pd+TLJ14an9DphyrliuUFJDpoRqkdCR
	 gyUCuIhClJyqFNEVRavn5zAoMnldPqNDmnFj6QgcWBLnIe6HNtnK17Jfx6NjrNTEFzwbm
	 7Kd+2p3EAssO9PEDMw8oCNIFi/LDjfrfo7RL1k6d/yBIytrdSe4UeokfXp37lijuEWs7Z
	 xVCUdj/Qg0bvGz1qS5fJuFbFdPmJscMnfi8O9o050wPAnWnKeYssRXh7kfSfoqCUoCHQT
	 XROLzho1ibiDOsvCaI5hxdTzxlx/7LKAFSeFp/tMyq4CWhY7Y4z3/A1KkcmUyM27mdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744462;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c46J/J0UiNYaVXVJ/u915hSQc4wdJKlNAKmd7JytSgM=;
	b=MnWiZpOr0RH+frHc+ouOOZIuWKGuyEnd5X3RfVC6ggvZuN0az9GlmDK7bgtizLGDq1CB
	 3PC9E8Ls3XaveJRVjmPSt2B3uINYZtTCdlUs1elZ3jHDDLjioLcyxVp36JiBbQ2ZIpeDx
	 i4Fpj7liF77kTN1VJPpH7G6d6sE8RQy1++hKBowT+cwV8w2rSvHVUxOCR5PcTPHYE7YRY
	 y3/2Tea30U9xqWm6VLLAsFbz+4KKteTfoS1ZG8vxraRtAHK7JnJTsM1rL2ahBf/FdbdFb
	 27oD4q+bwQUtS3mDoDHNil7mT75PK+Akjf9Hj2xuUldOM7d4tYTrOKQTfMBxFGP50bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDjL0bDN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD3606A31B
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDjL0bDN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD321F01825;
	Fri, 23 Oct 2026 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744461;
	bh=c46J/J0UiNYaVXVJ/u915hSQc4wdJKlNAKmd7JytSgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IDjL0bDNwGUgBvTyVC/KTVTaCZg54TFzBuOmWrXgbrKNw3rwhy0x9htj+z9e+zpf6
	 pVhG9aIfPoyNWbO0AAWwhLPqmg7zCNCId82yunL9XzTC5PesQZUBWS1NtpJdLhKGeN
	 DTu3Xcuo+j5RhWcC1kBwPPQwnEs3EjhVQ/tRPk87ZIAaYjgpuhgthBltumYSi3RMB8
	 bI3xfOB+EV7goR37z9IgbqPLuKMXrVZ7Y3Qtwx3s7ppNcSEqNMII98UKnvqJtda9xH
	 DUxlYGV05N30smjBvHtHUdqhNoekaPJe8X8iQpsvxJEym9jiGB5Aea9PHh1pGCgtZQ
	 2L9Dt6AoY1rRw==
Message-ID: <sashiko-outbox-182523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] ASoC: cs43130: Take the frame layout from
 set_tdm_slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261023081457.44579-1-olivier@mgcrea.io>
References: <20261023081457.44579-1-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 08:34:21 +0000
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
- [Medium] ASoC: cs43130: broken channel fixup and mask handling in cs43130=
_set_tdm_slot()
--

commit 4794a3406868264ed704b7b8312f7714c82ad623
Author: Olivier Louvignes <olivier@mgcrea.io>

ASoC: cs43130: Take the frame layout from set_tdm_slot

This commit adds a set_tdm_slot() callback to the cs43130 codec driver so
that generic sound cards can configure the frame layout directly as two slo=
ts
of 16 to 32 bits instead of deriving the slot width from set_sysclk().

> diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
> index 48d88dad4ceb0..8450794654c60 100644
> --- a/sound/soc/codecs/cs43130.c
> +++ b/sound/soc/codecs/cs43130.c
[ ... ]
> @@ -1609,12 +1615,36 @@ static int cs43130_set_sysclk(struct snd_soc_dai =
*codec_dai,
>  	return 0;
>  }
> =20
> +/*
> + * Sets the frame layout directly: two slots of slot_width bits, which t=
hen
> + * takes precedence over the layout derived from the set_sysclk() freque=
ncy.
> + * Generic sound cards pass MCLK to set_sysclk(), not SCLK. Zero slots go
> + * back to the derived layout.
> +*/
> +static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx=
_mask,
> +				unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct cs43130_private *cs43130 =3D snd_soc_component_get_drvdata(compo=
nent);
> +
> +	if (!slots) {
> +		cs43130->dais[dai->id].slot_width =3D 0;
> +		return 0;
> +	}
> +	if (slots !=3D 2 || slot_width < 16 || slot_width > 32)
> +		return -EINVAL;
> +
> +	cs43130->dais[dai->id].slot_width =3D slot_width;
> +	return 0;
> +}

[Severity: Medium]
Does configuring the layout through snd_soc_dai_set_tdm_slot() break mono
playback and allow invalid slot masks?

When simple-audio-card parses dai-tdm-slot-num =3D <2> and dai-tdm-slot-wid=
th =3D
<32> without dai-tdm-slot-tx-mask, simple_init_dai() calls
snd_soc_dai_set_tdm_slot(dai, 0, 0, 2, 32). Because cs43130_pcm_ops does not
implement xlate_tdm_slot_mask, snd_soc_xlate_tdm_slot_mask() sets tx_mask to
0x3, and snd_soc_dai_set_tdm_slot() stores 0x3 in
dai->stream[SNDRV_PCM_STREAM_PLAYBACK].tdm_mask.

During __soc_pcm_hw_params(), a non-zero tdm_mask causes
soc_pcm_codec_params_fixup() to overwrite params_channels() on the codec co=
py
of hw_params with hweight_long(tdm_mask) =3D 2 before invoking
cs43130_hw_params()->cs43130_set_sp_fmt():

sound/soc/codecs/cs43130.c:cs43130_set_sp_fmt() {
	...
	frm_size =3D bitwidth_sclk * params_channels(params);
	loc_ch1 =3D 0;
	loc_ch2 =3D bitwidth_sclk * (params_channels(params) - 1);
	...
}

For a 1-channel stream (permitted by cs43130_dai[0].playback.channels_min =
=3D
1), the CPU DAI receives 1 channel while cs43130_set_sp_fmt() sees 2
channels, setting loc_ch2 to bitwidth_sclk instead of 0 (where both channels
previously sampled slot 0 in mono) and programming frm_size for 2 channels.

Conversely, cs43130_set_tdm_slot() ignores tx_mask and rx_mask and accepts
any slot_width in 16..32. If a caller passes slots =3D 2 with a 1-bit tx_ma=
sk
such as 0x1, soc_pcm_codec_params_fixup() forces params_channels(params) to
1, so cs43130_set_sp_fmt() computes frm_size =3D bitwidth_sclk * 1 instead =
of
2 * slot_width. In I2S or LEFT_J mode with slot_width =3D 32, that programs
LRCK_HI_TIME equal to LRCK_PERIOD (31), or with slot_width =3D 24 in DSP mo=
de,
causes switch (frm_size) in cs43130_set_sp_fmt() to fail with -EINVAL (whose
return value is ignored by cs43130_hw_params()).

Would set_bclk_ratio() avoid the TDM channel mask fixup in the ASoC core, or
if set_tdm_slot() is kept, should cs43130_set_tdm_slot() validate tx_mask a=
nd
slot_width while cs43130_set_sp_fmt() decouples the 2-slot frame size from
the active channel count?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023081457.4457=
9-1-olivier@mgcrea.io?part=3D1
