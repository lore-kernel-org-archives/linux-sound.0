Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031927B32C
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315769; cv=none; b=I9B9Lk2fIyEnfUZgp7EzA41ZM7s3oCEC6C42dszMRTExIg86E8dpEO9f+G54e3xclo4flTzX9xfF4Jx8UhZBC9fSHhaLdopbKbybqom9u6443SqdNV5YrNHJGeixwcpc0sxMHm/+BcspcEZwPB1JowfRA1Msd827a/32jiS6qic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315769; c=relaxed/simple;
	bh=HjcN2GG84vPUGVwsN22varTM//THgXyW9ItaUcvbqDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRJhU3ybEOYsl+CjrtwjnhBvYnFWFDVip4MYKWA45ahMCDmbYQt8IllVb6WMH/vxtNa1qVtCca6o5XM8a35TclimID1p6ZH/I5nwDGye1rPY+Iy+Gpz2MWZOKWTmGV7sWl0UFA/vQVK8HsEZrKTw3dnWgZqOWnarMXmmXFcocC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAwLBIE8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAwLBIE8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso1245954a91.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 23:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764315768; x=1764920568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwgegw9oYh4R/9dxi/Bwe4qVjMTpsZE/Aa2l5az11j8=;
        b=VAwLBIE8J4bK8xRONJGIqRG8L90AIbHiT2Gb5m/9oQB+VOy6LGr1yEeTX/tn7fHotY
         iqY9PcVupvXXRoxkj6b6YEDELDa0IQRlqAZ3qj2EjE/Km/8nRSyrX1esbqLfU11uU0Hd
         ZdFqW5H0riMLUdkG6hf8FrT0wi6FqWS1F3C+nm1OxSJHSfGkEkB8GUrsN19AIpXioV72
         SwknyG3YLj4ixmF4m9UO92ITkmvlNNhrLPf2a7DyCML4HX/HkEYDM0jiX8z98o6eIeSs
         yoPyfPFtM4Xz4TZ/xoqIwqlgch7zOTGHmRYRPB86ut9eqr7Wp5ul5zcpbyCqbVU9zyOs
         NYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315768; x=1764920568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwgegw9oYh4R/9dxi/Bwe4qVjMTpsZE/Aa2l5az11j8=;
        b=BjospLYwh19D5ic061yco4aI8TXnM9vgouQEG+Gz61yWGw51AjBeYGZBZZSGNB4kYb
         x6CUfwOGzC0zTGjGbafcqZO26sU0LqdpE7M46RxcMy8QYpo7IDLdvCQLrCA3V+FUdaEb
         2nBDdyowTZGFYIMEEQQ+chvInRtqhcBRL7w+BUQFI4ZEjnEQgO0WPo2i7Xn0oACQOV6o
         10Us6HSl491IXES/MWz6BzjAxXxZeLulrpLkmNLUeJbGOmiMYaVCfgzEqgrgv9VDC4Vt
         Xxu5GofplJbQWn5Nyd9JC4l1ekdGhB8zSSzJULuGtG2bUiDKO/HahdhDUhlBSESX5Z9V
         ogOw==
X-Forwarded-Encrypted: i=1; AJvYcCXySVosTVdiWuF6n9r/NOdJVS3pmaPCEA6gGBu5PFwxHMs98qPQqEPX/WhNfOi6FQ5rB+7/t1q+a96geQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtOjLw2JzCO7tx7EUstAPHWPoUPEhzdSDgKjvr8hnyy+eC917
	3lv+zTSmPqFElfzMfSbMkWvRNEAv3fr5tV+4zitaYBjip9Pw0+R9Xy/1FO5M3cZOGVUGMeAYEgj
	Hzf2ZhLezrAMsuWJ9vAqROlwgBQtpaYc=
X-Gm-Gg: ASbGnctRBWDQ9Rs1kghCBtg8udzVmbemVziQMU807PvAZubPeX2Jt/idvN8YbbV2xKt
	VqaRGd7+YJW1o7Axz/iNci1Lmdelv/QL+6MfV4RoUGbYnixZR168b2TDJwihmSVOzbx9T0byKej
	2xsv5Wam+45cNb3cvOx9e4R6NhsUwb0gR/tOy+25fW5nNcSZ3BgozZl4xX/aKIgVngKBiE8sdBx
	Luv9Iqdtd+hE1ExBIaGIJqEEh6EHlBQ6/maVP4r0Bq+ktjuHEIaQ1Dhp+5pGrjgG1JUQbQ=
X-Google-Smtp-Source: AGHT+IEJHXWBr49KAxGxDC76/hSjkgPpxJkZWLQuZkWnCi2QL33UGO6wPksN6i7KBZN5v50Gsq6b0+DnAizX1B0BKmY=
X-Received: by 2002:a17:90b:3511:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-3475ebfa6f7mr14891033a91.15.1764315767663; Thu, 27 Nov 2025
 23:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127022652.674574-1-chancel.liu@nxp.com> <20251127022652.674574-2-chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-2-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Nov 2025 15:42:35 +0800
X-Gm-Features: AWmQ_bl4gbf4CFZu3bcV7RGzT54t6XuebMgeEFtiCF_T5XNJ8oNCRIVgEXuIWC4
Message-ID: <CAA+D8APuodgnrmwjd=OFYFuN-jV6ppxGHK0nmocij2fQ0EatzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_micfil: Add default quality for
 different platforms
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:27=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Add a default quality flag in soc data. For i.MX8MP/93/943 platforms on
> which range control is constrained, set medium quality by default to
> achieve better audio performance and wider adjustable range control.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
>  sound/soc/fsl/fsl_micfil.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 1ea543863101..86678fee7a57 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -92,6 +92,7 @@ struct fsl_micfil_soc_data {
>         bool volume_sx;
>         u64  formats;
>         int  fifo_offset;
> +       enum quality default_quality;
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mm =3D {
> @@ -102,6 +103,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm =
=3D {
>         .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
>         .volume_sx =3D true,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_VLOW0,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mp =3D {
> @@ -112,6 +114,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp =
=3D {
>         .formats =3D SNDRV_PCM_FMTBIT_S32_LE,
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {
> @@ -124,6 +127,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =
=3D {
>         .use_verid =3D true,
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx943 =3D {
> @@ -136,6 +140,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .use_verid =3D true,
>         .volume_sx =3D false,
>         .fifo_offset =3D -4,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] =3D {
> @@ -892,7 +897,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *c=
pu_dai)
>         unsigned int val =3D 0;
>         int ret, i;
>
> -       micfil->quality =3D QUALITY_VLOW0;
> +       micfil->quality =3D micfil->soc->default_quality;
>         micfil->card =3D cpu_dai->component->card;
>
>         /* set default gain to 2 */
> --
> 2.50.1
>
