Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7D40DB2F
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527704; cv=pass; b=hvZS5gosMVhyryYWiGauj+ggW0kYzA5oaQDaHk55pkxhzsjwSzmqLqrg2yoSWDjgEcOAvzAiT9fdoVHJ/GfPBwKP++nootMNBQ5i2ymopRGtzMPlMsuPsF17aDOFYfbDfVM25JLtWD+FqxyhcuEwM18FXNQtZCCvg7aMPsCPY1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527704; c=relaxed/simple;
	bh=kA9Czqob/xOHi2KukRCAbBGhxKPazgfr9PdJ5E8m4MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdgA3gLEja9CIYsHjYG93gbIieiZctYwad4qMHxeya9hzThIqcLigZHuEcUk4NVTu5u3tIDSQ5ac2LjG/kMIcc8j1s6y1v1N1iE3++lhYGVh/sCoZUeKEMn8QpxYUHxxsJ2kJtuuGVJQiJOsiziQhXgwhEnF+NzjokOY+xQulEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4cyyAnZ; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4cyyAnZ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso870733a91.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 02:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786527703; cv=none;
        d=google.com; s=arc-20260327;
        b=dm1uqkWyR8FMUdqF1cyuWF1GvlfDCfNJe/rxewybS1gx3wWRJlEZJCtrKRnKWCTNG5
         V3wPEiEkOYjyEyT/lY01cKCgF0jzjiO7Tz7/qyLRIyHm3fNfyhvMArxmR+gUylLNgIga
         atNqLKf5ucIWNnxf3BWiP8JIV8k29zTXISXfM48W5esR7/X25Xp4vgSDKfHoAXOK/Nvh
         7UG2M56XHKK0MswYp5YjfORSVz56SjKDMqYwgHdhZnU+XpybJmPxyUEKSJ56wcvTcjTY
         OxdCIaoapOlgdgqiIY3CNV+fTYOPn+G+knUjHTjj9OSk2Kf2smaXOQlR2BJwCFSqgc4J
         q+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4WggVn6AeYm/z+2dUa3bPIsznPMN9tQXC+5Hx/zSNk=;
        fh=67wMr8Vr9MO8GMcqd2/y+/d79H0VQYN1r94YDe4ET1w=;
        b=OPMsB1x0TaDnO/dWnSkEMc4JZEnwpT95wSaW7YRQEsL8IxKta3RwL6VPCHcOTJY6Oi
         stjQKPabBwhQ5XX1oDKR0ATHomw5MzGgplslQr4ZTln3Udj8g3MTV1650uMElg276fmH
         sZJcD/usFqxpYgpyVzKg2aTCAzK93Ff4H6w69K2894/rFpChmX0xNaR0WU+wl3SOz2E1
         12Of4+rFeL2AIaC0+2HDamYLKpr55sr26HeMxrumif/TriJlHEdCr7232YJMQvXUVyMl
         de/HiGFfBx6KVxJ1Owo1A52NsBtp5/QQk50XJWdIf0yP5nU8cnsIjseFxy3A7i92SODu
         R0+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786527703; x=1787132503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4WggVn6AeYm/z+2dUa3bPIsznPMN9tQXC+5Hx/zSNk=;
        b=G4cyyAnZ2x5J0CpKJOtQ6h6vuQwCkS91OB2NCjtRhVThahXlFt9EWpSdhAD85nKb9e
         zVw9xjnxSuTY/eIcpgO6GojHEEfK8aNMYSZ5g9jAyN3lNdS7xwuA068R7a8RE/msQmKo
         QLcN9+S15p2Eue6s80pqGyFlQgWuV9s15MAHMNsAQmEbnB6xL3CA3kb19E2DMM21sjUX
         JH3VYVcgEHVcCnKAB3fPMm29L0OwgMK2mg7Xuk858+O/6ApMgwc36wfrdIWvhIWc8d8W
         3HzyjCg90yPaKXMUhVwmkDwq4Tx9v2IPbm1dLCrHE/SzM2TtFl0E28iYvDlyzq2C8a1h
         WQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786527703; x=1787132503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4WggVn6AeYm/z+2dUa3bPIsznPMN9tQXC+5Hx/zSNk=;
        b=f8lFjKDTQXfMr+XHmqhYVqa4mKnfjY/o3HLDsz8Lk2AGuazRAGubZZLh9B897g4+OC
         H82CfeGwpnLC3poUi3Vv+8TQJq55kM0zauBzrdMCpThA6yu5iPssfvbEZoCO21VAHrdF
         FDMwvXORNTIh7aCDuPgWR58O5UnmYucdjLfPxKs8kVtXVISooRGZf5V54FldhfpZITBX
         qwEHu63COF2z0B+tY1qp1nAY5loUzd0V1tCvzm2qqHYzS/E9d0U7Z/BjBnrtq+7O9AIy
         0npetz44LCxH7XM7B5R88cvcetJGpwBb1Y7ayQ48a8cnktS1HUSiEGL520KsJyv+LKZk
         RNsg==
X-Gm-Message-State: AOJu0YwaeT/7zh852m+i630yd41dP6BoB3gz2dyk8gHlBQbQy0dOrCZO
	DG2W+HfA9glvn8uYB31oYOjTVdj2IAyZKyb2hK5ItBAZCDXk7D1rj+NAK0PempIfBnLEy0JJJ9q
	G/OLrOKf69kKJ5UJ0/g5UyP2yNL53w7A=
X-Gm-Gg: AR+sD10m8KNxLurD3s+cAfEMAWoTIGSgqtfjyX4y4A42W7wI7Pw+2/ox08SbC00ohCs
	exaISMEnXhrS12B9LkH+hkvEuVtmyttFGlhrHL7M/XjBc0Z5A5UD588cwXNWUlf9zvBIvOCLAbo
	y/6EYJkyrNTnj+esr3yAB+dPl/0gN7LtKp6g8mm5k+53MuXRmANCs7GfXTaCrsHJ9ZWTrgcu+4u
	9di+W2pOMHiKLXuMElYA+ExESCTMp7z4yZNVs8ZG7cqZstS4Q9f34KwHiUl0lOmE14Y2T9IBK4J
	LAxm0vMS1+5Kmn2nbBUQ6r63e4kcxlIPyMdlnP4yJTxCuc00wkvvs94=
X-Received: by 2002:a17:90a:dfce:b0:38e:c7b0:84ad with SMTP id
 98e67ed59e1d1-39300fe8cb7mr4170104a91.0.1786527702715; Wed, 12 Aug 2026
 02:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812060557.80445-1-tiwai@suse.de> <20260812060557.80445-12-tiwai@suse.de>
In-Reply-To: <20260812060557.80445-12-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Aug 2026 17:41:19 +0800
X-Gm-Features: AUfX_mxoe6p4bwF0XeQT9m1Hu9jFJp9Ilf_VAlz_5ZvYPOLYqyhEj1_R_j9DKD0
Message-ID: <CAA+D8ANPxByA+jxzn1qfzNX3QvoDB1xs9JqoMtJxaMbBY_qbYQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] ASoC: fsl: Drop __force casts
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:06=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop those superfluous casts.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl-asoc-card.c |  2 +-
>  sound/soc/fsl/fsl_asrc.c      |  2 +-
>  sound/soc/fsl/fsl_asrc_m2m.c  | 10 +++++-----
>  sound/soc/fsl/fsl_easrc.c     |  2 +-
>  sound/soc/fsl/fsl_qmc_audio.c |  8 ++++----
>  sound/soc/fsl/imx-card.c      |  4 ++--
>  6 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index 709543308fe9..9dc46ab1d3e1 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -1118,7 +1118,7 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>                 }
>
>                 ret =3D of_property_read_u32(asrc_np, "fsl,asrc-format", =
&asrc_fmt);
> -               priv->asrc_format =3D (__force snd_pcm_format_t)asrc_fmt;
> +               priv->asrc_format =3D asrc_fmt;
>                 if (ret) {
>                         /* Fallback to old binding; translate to asrc_for=
mat */
>                         ret =3D of_property_read_u32(asrc_np, "fsl,asrc-w=
idth",
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index f23c21032287..11748c65d5cc 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1358,7 +1358,7 @@ static int fsl_asrc_probe(struct platform_device *p=
dev)
>         }
>
>         ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
> -       asrc->asrc_format =3D (__force snd_pcm_format_t)asrc_fmt;
> +       asrc->asrc_format =3D asrc_fmt;
>         if (ret) {
>                 ret =3D of_property_read_u32(np, "fsl,asrc-width", &width=
);
>                 if (ret) {
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 7d39378c0622..4bc40f328f58 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -367,13 +367,13 @@ static int fsl_asrc_m2m_comp_set_params(struct snd_=
compr_stream *stream,
>         if (ret)
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.fo=
rmat) & cap.fmt_in)
> -               pair->sample_format[IN] =3D (__force snd_pcm_format_t)par=
ams->codec.format;
> +       if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
> +               pair->sample_format[IN] =3D params->codec.format;
>         else
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pc=
m_format) & cap.fmt_out)
> -               pair->sample_format[OUT] =3D (__force snd_pcm_format_t)pa=
rams->codec.pcm_format;
> +       if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
> +               pair->sample_format[OUT] =3D params->codec.pcm_format;
>         else
>                 return -EINVAL;
>
> @@ -600,7 +600,7 @@ static int fsl_asrc_m2m_fill_codec_caps(struct fsl_as=
rc *asrc,
>                                cap.rate_in,
>                                cap.rate_in_count * sizeof(__u32));
>                         codec->descriptor[j].num_sample_rates =3D cap.rat=
e_in_count;
> -                       codec->descriptor[j].formats =3D (__force __u32)k=
;
> +                       codec->descriptor[j].formats =3D k;
>                         codec->descriptor[j].pcm_formats =3D cap.fmt_out;
>                         codec->descriptor[j].src.out_sample_rate_min =3D =
cap.rate_out[0];
>                         codec->descriptor[j].src.out_sample_rate_max =3D
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 8535ef844ce0..79eb2391058d 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -2227,7 +2227,7 @@ static int fsl_easrc_probe(struct platform_device *=
pdev)
>         }
>
>         ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
> -       easrc->asrc_format =3D (__force snd_pcm_format_t)asrc_fmt;
> +       easrc->asrc_format =3D asrc_fmt;
>         if (ret) {
>                 dev_err(dev, "failed to asrc format\n");
>                 return ret;
> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.=
c
> index d0f644573f49..f27934cf49da 100644
> --- a/sound/soc/fsl/fsl_qmc_audio.c
> +++ b/sound/soc/fsl/fsl_qmc_audio.c
> @@ -503,8 +503,8 @@ static int qmc_dai_constraints_interleaved(struct snd=
_pcm_substream *substream,
>                 return ret;
>         }
>
> -       access =3D 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_INTERLEAVED=
 |
> -                1ULL << (__force int)SNDRV_PCM_ACCESS_RW_INTERLEAVED;
> +       access =3D 1ULL << SNDRV_PCM_ACCESS_MMAP_INTERLEAVED |
> +                1ULL << SNDRV_PCM_ACCESS_RW_INTERLEAVED;
>         ret =3D snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PC=
M_HW_PARAM_ACCESS,
>                                            access);
>         if (ret) {
> @@ -532,8 +532,8 @@ static int qmc_dai_constraints_noninterleaved(struct =
snd_pcm_substream *substrea
>                 return ret;
>         }
>
> -       access =3D 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_NONINTERLEA=
VED |
> -                1ULL << (__force int)SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
> +       access =3D 1ULL << SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED |
> +                1ULL << SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
>         ret =3D snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PC=
M_HW_PARAM_ACCESS,
>                                            access);
>         if (ret) {
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index 43438af1e1c6..e3cb1438e837 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -531,7 +531,7 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runt=
ime *rtd,
>
>         mask =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>         snd_mask_none(mask);
> -       snd_mask_set(mask, (__force unsigned int)data->asrc_format);
> +       snd_mask_set(mask, data->asrc_format);
>
>         return 0;
>  }
> @@ -684,7 +684,7 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
>                         }
>
>                         ret =3D of_property_read_u32(args.np, "fsl,asrc-f=
ormat", &asrc_fmt);
> -                       data->asrc_format =3D (__force snd_pcm_format_t)a=
src_fmt;
> +                       data->asrc_format =3D asrc_fmt;
>                         if (ret) {
>                                 /* Fallback to old binding; translate to =
asrc_format */
>                                 ret =3D of_property_read_u32(args.np, "fs=
l,asrc-width", &width);
> --
> 2.55.0
>
