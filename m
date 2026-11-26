Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695304;
	b=obOl3zu8R2BwgB9nrj7Ob2Y5Xjdxd/5+eYWdbzhpY4LLcVxWXLBKDI11QbhHUd2RfYN8
	 2gOTwC8MjjAaC3jTBmO+FOHmWxGj/UsjuLFjOchAwXtse9ubFCx6Y8xWsSOOmSWhQpjTx
	 +4FsDbfIQvxd3QDEifKazQbI10dqC3wWUDelDjpLYaDaxfx7OV8Y7+90KZkWsjbWD/5hO
	 bwx36CeSPV10A0TIyrmEJp10Tun5efM5UIiR8XlI4A6iGUoGobK1yYpUV/TGQa4Y0Fo+d
	 o7sXsszpdBAQXwT3vfUcNlQGbmI6OYbfAb2Mo75sBb6mZlr+BmoZdocZS13SrY3WiGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UqfwYi3BvoGEq4TlyCqJjXHz/Lli8WyF++GuuVAoXBI=;
	b=tx4aWACkiZx96Q+69nyg3zFsSbrxVpjEy/V1RlfjYpFbAnmrHQ8ETve9WD30x9Jn9R9H
	 62a+xEHl+LQwmC6uBqcrrqge7oDliuN5I6/165H8BnNmxrqlx1lNXPPHZaGxC7/l6+eOe
	 9nK2LoDAzpgfXza05v0if8Zroybi+exK2UgnddYvySyn8i1+CZYqRXKfZCVoyzU2/pPXW
	 BA5IJqppBvvOp7RI+5QIKXbwcpRg7PDNftT7IBpDZ4E12epSj8X0OKBeNsXTQC/C5ufdl
	 GVYO4Xs7Tj7ypvjdEx+2HqWQHw3x1xRh6HXvzpdnTIaK67IGKrsoS7vj5Iu3XDWpUoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfKc8Sz1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D5606A323
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfKc8Sz1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86671F000C0;
	Thu, 26 Nov 2026 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795695303;
	bh=UqfwYi3BvoGEq4TlyCqJjXHz/Lli8WyF++GuuVAoXBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfKc8Sz11h86519jofiQPLhvLL1O1OKs0glqbVzm7FGrq1iXN0lPEwbz88TZqQzHO
	 t24lqu2X61uZX74WoDzkwiOqAI3l/k+kJB6Q0U/m9vsXzmi4HNB0uYUxyJ9HvKLAE7
	 1cw74qCwn8UDKJ3QQ0XmuMyh2tt52gmw6kE/BOZt+HzW6PWasZWdnoiyPOy3hMX9xG
	 HLLzq/cfKFnFMEaZE1RUetCMuSRrR4Q8PJfc/pBwQO4WlbAFpQnB/LV7qHVgtuC1n3
	 73iGP0RHqgzuiqLdO+4516WPJIWCuNkbet8+s0A3NyeJYox8jbRQHegOFRobC19FGc
	 KlgsHNXrGQ9bQ==
Message-ID: <sashiko-outbox-235483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: q6asm: fix 24-bit PCM level via media
 format V4/V5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126115738.1765949-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126115738.1765949-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:15:03 +0000
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
- [High] ASoC: qcom: q6asm-dai S24_3LE and S32_LE formats break DPCM
  backends
- [Low] ASoC: qcom: unused V2 PCM media format macro and structs in
  q6asm.c
- [Low] ASoC: qcom: missing Fixes trailer on q6asm 24-bit PCM bug fix
--

commit 881370cd9680d91d1348c565e596cf8d97c2b69b
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
>
> q6asm uses ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2 for every LINEAR_PCM
> stream. V2 has no sample_word_size, so the DSP defaults to
> word_size =3D 32 and expects the 24-bit sample MSB-justified, while
> ALSA S24_LE is LSB-justified. The 8-bit shift costs ~48 dB.
>
> Switch to V4 or V5. Pick V5 when ac->q6asm->ainfo.api_version >=3D 2,
> V4 otherwise. Both carry sample_word_size; mode stays 0 so the DSP
> picks the default Q factor.
>
> Apply on playback (q6asm_media_format_block_multi_ch_pcm,
> q6asm_open_write) and capture (q6asm_enc_cfg_blk_pcm_format_support,
> __q6asm_open_read).
>
> Drop S24_LE from the MultiMedia FE PCM. Advertise S24_3LE on
> capture, S24_3LE and S32_LE on playback. S24_LE can't be made to
> work zero-copy: the firmware ignores the Q-factor override. plughw
> converts S24_LE to S24_3LE transparently.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

[Severity: Low]
Since this fixes 24-bit PCM level handling in Q6ASM, should it carry
Fixes tags?

  Fixes: 68fd8480bb7b ("ASoC: qdsp6: q6asm: Add support to audio stream api=
s")
  Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")

> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6as=
m-dai.c
> index 3840669867351..57cbce2bb0cb7 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
[ ... ]
> @@ -139,7 +141,8 @@ static const struct snd_pcm_hardware q6asm_dai_hardwa=
re_playback =3D {
>  				  SNDRV_PCM_RATE_176400 |		\
>  				  SNDRV_PCM_RATE_192000),		\
>  			.formats =3D (SNDRV_PCM_FMTBIT_S16_LE |		\
> -					SNDRV_PCM_FMTBIT_S24_LE),	\
> +				    SNDRV_PCM_FMTBIT_S24_3LE |		\
> +				    SNDRV_PCM_FMTBIT_S32_LE),		\
>  			.channels_min =3D 1,				\
>  			.channels_max =3D 8,				\
>  			.rate_min =3D     8000,				\
> @@ -151,7 +154,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardwa=
re_playback =3D {
>  				  SNDRV_PCM_RATE_12000 |		\
>  				  SNDRV_PCM_RATE_24000),		\
>  			.formats =3D (SNDRV_PCM_FMTBIT_S16_LE |		\
> -				    SNDRV_PCM_FMTBIT_S24_LE),		\
> +				    SNDRV_PCM_FMTBIT_S24_3LE),		\

[Severity: High]
Does replacing SNDRV_PCM_FMTBIT_S24_LE with SNDRV_PCM_FMTBIT_S24_3LE and
adding SNDRV_PCM_FMTBIT_S32_LE break DPCM backends on boards whose
be_hw_params_fixup callback does not override SNDRV_PCM_HW_PARAM_FORMAT?

dpcm_be_dai_hw_params() copies the frontend hw_params to each connected
backend before calling snd_soc_link_be_hw_params_fixup().  Because
apq8096_be_hw_params_fixup() and sc7180_qdsp_be_hw_params_fixup() only fix
up rate and channels, SNDRV_PCM_FORMAT_S24_3LE and SNDRV_PCM_FORMAT_S32_LE
propagate directly into the backend hw_params callbacks.

In sound/soc/qcom/qdsp6/q6routing.c, routing_hw_params() only handles
SNDRV_PCM_FORMAT_S16_LE and SNDRV_PCM_FORMAT_S24_LE (and commit "ASoC:
qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs" later in this
series only adds SNDRV_PCM_FORMAT_S32_LE), leaving
session->bits_per_sample unset (0 or stale) for S24_3LE when
q6routing_stream_open() calls q6adm_open():

sound/soc/qcom/qdsp6/q6routing.c:routing_hw_params() {
	...
	switch (params_format(params)) {
	case SNDRV_PCM_FORMAT_S16_LE:
			session->bits_per_sample =3D 16;
		break;
	case SNDRV_PCM_FORMAT_S24_LE:
			session->bits_per_sample =3D 24;
		break;
	default:
		break;
	}
	...
}

Similarly, in sound/soc/qcom/qdsp6/q6afe-dai.c, q6slim_hw_params() rejects
SNDRV_PCM_FORMAT_S24_3LE with -EINVAL, and q6hdmi_hw_params() only handles
S16_LE and S24_LE, leaving hdmi->bit_width uninitialized for both S24_3LE
and S32_LE.

> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index d042132caf034..ee1930e41d4b6 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -40,6 +40,10 @@
>  #define ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2	0x00010DA3
>  #define ASM_SESSION_CMD_RUN_V2			0x00010DAA
>  #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2	0x00010DA5
> +#define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4	0x0001320C
> +#define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V5	0x00013222

[Severity: Low]
With both playback and capture switched to V4/V5,
ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2, struct
asm_multi_channel_pcm_fmt_blk_v2, and struct
asm_multi_channel_pcm_enc_cfg_v2 are now unused and can be removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126115738.1765=
949-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
