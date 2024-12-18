Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF2224F6;
	Wed, 18 Dec 2024 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532063; cv=none; b=Kflq97FXTMvJAVGvx4mOHCV/bhLkY2qNhWFgFOSBlksOdtM6QWWHgXbOJowCtLd8A/bxOW1Fa6WSZmaCzyztiomLGOwU6aGIDP5X186uWBNorfTnybnTNV4jWsm5Gai8Q4Llbdc/3KkZUfC/ZyV46U2VVkHKLBil9GhvcL8I6Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532063; c=relaxed/simple;
	bh=eQ9vXrd57ZKBefw5fN+PW6ivAQuBYSfER+trA80bjrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvCZ5uUluyRNXfibUH5el9fEa84LPiITOTtLUnxHdl099QW+6jwNwwh3PSS0UtsxwgklLB3DZ8EKWFLotOwMoMCdjHuWEHkwoD1PeGIFAqHNOcV1iO9pHdAN4ignkl0EuTKF1GRzeTmnFEiTXUmjDsHLHPtT6BNs34cTccTTNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG2/ep0E; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG2/ep0E"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso4560284a91.1;
        Wed, 18 Dec 2024 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734532060; x=1735136860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHZAhcdXs0Hg1NP/pycwUKr3mXkGKuoLrl2acIx+2i8=;
        b=cG2/ep0EQYbYG72nEIPSNxk0iYfOVjZJXapt24ozEvIzTYVgBSsvEaoFm+0Xfa6uMV
         igPo7cWZGf31A4WHZY7U6xGqVBiBvCcstJVw7ZW7aX4ntwX7OvO5qF+/gM8TLMuFrirp
         zML7z5MJ0QeyEp9VPXSgmd05xFQZ0A0obYPGfYRZHyPM1wHOs+Frv21bYnfJwxgPdCPG
         lrKIxN2A/cyaybKZ4+cO6SPGP5seL03wix74+0yexU1L911jmZFgOjzE24L+s6hZWJww
         u5ENYr1aqPtEs51o5FPthiSGMVdi6/G7LBAYxpPD/mj6VxqenWXCc1lob5pnUjFNxTlB
         x4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532060; x=1735136860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHZAhcdXs0Hg1NP/pycwUKr3mXkGKuoLrl2acIx+2i8=;
        b=pF0DErdQsDQ5CvQOcPSQJVpsClsigo77pPMg0nvff4L67IsXdyRCrmjRKjTPsB9ATF
         S86nYBgh9Nj8TADBujvmM4j5uNqF/Aycd0oEQ398PCPcCvupQX6k7plA9d7Jl/aJpEDz
         BBtS9HO7I4Ty9g1eFZio5RIzuF43mqg7PAY83NkoG5Mk6QwlEgLbAJDzfLOvlbCRVSSn
         W+mWwtec2RvCDZADs/AAH8yHyoyJNQMzwk/W/VCDTvyTuYpJxDzlR0bn4dmRaTqw0QXS
         +MdSAMbIr22GLpgtqksRSUlQSTirIhDySFMUQOILElUqx3b214P19HSfbT+dhq5h9M8E
         QPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOe7Gh3X8uQxXOv5j3JzBqeT5IBvETiuCGYHQ7BJWqAyAJiYNR/ItIx8khPSpvzx346xWqdH5zc1tuG4Y=@vger.kernel.org, AJvYcCWu8KxELlwQVxDefmFxTrjABqwWDbLS9ipp30bY4r6Q8npCEYe99Rg5QHDn0WCBAwYgKzljd0kd3OqKMNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7mCfoLOByWMcI1uS1qo408OZryyxDO/F5jcfjJwGZDxwHqbS
	ciLuibB92g8VKAYpZTfqekR/xJIvAkt1XKoGrOkYmzLcQdp+3sxr05mtjh9EuAYMSssOr6v8/4A
	R5AlytRhAc9Gbtlxwckf3L0fEIKROTSrTWCE=
X-Gm-Gg: ASbGncvHxQFe/fnWcU+vuSqtGf+kqC9dTQbzU0OH0B1Jais55ZdZR+vg0EMb+3J4lpy
	SRA8Ys8gifwyb/yKqXqBUHyZDVQjz+LfgVA==
X-Google-Smtp-Source: AGHT+IGx1BX/NBGR0bn2XRM/2u89UX23yPc8oKOfco6hOhCYehGChJ121D815qbMSClQurVhlifry+CfZ/jLDB0Dseg=
X-Received: by 2002:a17:90b:5287:b0:2ee:ba0c:1718 with SMTP id
 98e67ed59e1d1-2f2e93792d0mr4653201a91.37.1734532060281; Wed, 18 Dec 2024
 06:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 16:28:57 +0200
Message-ID: <CAEnQRZA2OzYRC-JZECXkz1q5PPKCx=0zOCep_QjKvq02k5gGFA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:46=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Fix sparse warnings:
>
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] format=
s
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assign=
ed] [usertype] k
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@i=
ntel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f266a3f5fd48..4906843e2a8f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -357,13 +357,13 @@ static int fsl_asrc_m2m_comp_set_params(struct snd_=
compr_stream *stream,
>         if (ret)
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
> -               pair->sample_format[IN] =3D params->codec.format;
> +       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.fo=
rmat) & cap.fmt_in)
> +               pair->sample_format[IN] =3D (__force snd_pcm_format_t)par=
ams->codec.format;
>         else
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
> -               pair->sample_format[OUT] =3D params->codec.pcm_format;
> +       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pc=
m_format) & cap.fmt_out)
> +               pair->sample_format[OUT] =3D (__force snd_pcm_format_t)pa=
rams->codec.pcm_format;
>         else
>                 return -EINVAL;
>
> @@ -592,7 +592,7 @@ static int fsl_asrc_m2m_fill_codec_caps(struct fsl_as=
rc *asrc,
>                                cap.rate_in,
>                                cap.rate_in_count * sizeof(__u32));
>                         codec->descriptor[j].num_sample_rates =3D cap.rat=
e_in_count;
> -                       codec->descriptor[j].formats =3D k;
> +                       codec->descriptor[j].formats =3D (__force __u32)k=
;
>                         codec->descriptor[j].pcm_formats =3D cap.fmt_out;
>                         codec->descriptor[j].src.out_sample_rate_min =3D =
cap.rate_out[0];
>                         codec->descriptor[j].src.out_sample_rate_max =3D
> --
> 2.34.1
>
>
