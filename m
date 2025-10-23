Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E452C0287
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203424; cv=none; b=LAaWE2N1EKx6Hl7aV7S4YbWh/tvQLT9BlFHw8/qE0Vo2eX25YIeWjxT06SZtJGjMFJzEuk4t5fOftOvcTJUDxv5AojzZG8zhobt2XbNomVL7OKtBM1CNNSuO9dl7XXg4b9Ul7vzy3hWRWTwIZ5SK7GuF/23nSc9IbP4st6lmdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203424; c=relaxed/simple;
	bh=atSHiBv6EOD3kMNIDMzYEJsOitPHWi/LcNVnt9jVTkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXJTSqPOUAaqn4/zBY4mVu4HOenLYypzndjOkOhzHGgvGLgIRVVJDKi9LeE547D2Jpt3sJcyaIIvqfzcaPIteEJ+NnriBs4cFYgtF0/8idMjJr6GKckUqg5HfleHQzIS8hysByTrOHb81RwFj4o4fQua/zjU72JeLtNFXZB6ZjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YylWJdDA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YylWJdDA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso439353a12.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761203421; x=1761808221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojo0D0SUrVi8rANl2uoQB3ZeIV6seeVTI9tIuETGh2U=;
        b=YylWJdDAWIKc4/vBOz+vbSYll8wN63MLpsI9Q0obiDNraaiEQFbeM0U0YwKnDsnpIz
         fS5KZ03I5LZ5/ny42IoAM4R3KyGX1r/L8rPaypxUWT25ZQxy6iCsqJ9Ww5ufi+qEkFDK
         baCUwAyA+Z475dvwyd5zAmHrZWPiKArdx/2bTy/Wjt8ku7VBmTThtxzvtTxeDSkjnnaZ
         P9hu3lawAU0RGgdItt8HoCy4yIU5gPWNWnEV1TphPEz1uxIb86DXgyNxUrOUgrwWEnE8
         q8GxG/x7byEFSmRe2np4MBJJu4MqMEm8wK1jplX5wSVGl6tnmyXVICRJu7dxSj2kVjM/
         ll6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203421; x=1761808221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojo0D0SUrVi8rANl2uoQB3ZeIV6seeVTI9tIuETGh2U=;
        b=p0+DOsoYzaHkJ+J6kkMmeIDMTvjwEZ16dbSsUwwSLbmSqryrJqvayMbw0qKmqSIcn0
         Ec5vC73ZuJEceinpHT78eDacwrdiy0XKCdijVuQ4nJXSiv1RtqqZ1so+8oeUyTsHZmSL
         56nqEnBJULdviwDY2Co+wj3dHpekTNW7l4exeu/OZjYVjNpZua7k9tOT46qz+fLBXA+S
         ek5dMIYosmPuLyq/6UwM/tmZP4RIRDjz0z52FPkNcX37J5yKfzDvLdrnH+zIgeVypvq0
         HmZa/xsn0j3w2NzPYwzFygtvGt3NjimpAHiqMdgfj2JcfUfWK7+XpNS1JLWRd12EmPbq
         HjwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+psROuqGZmUVk98TaAw9JblcXN8fbaNqabydIGwCoBBOVWg6zsVceLp29UXuwlGYJJzYBhePV0BYKwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoAB427DrgOHD8hCDpKPfvf+GZ06nTvhqAB0OAepuWv7YuFZ6
	+2WRPkTzETg4GC9Mk0/JnItprKcZznmpYDLVkeH2TMeid97+D4LKwMaFFloq7vIEdtN3xXaJMW9
	N+SwlIgS5YjFRKi8YwtBxVTUZHYLcTAM=
X-Gm-Gg: ASbGncsjBvDNby7+C/GF6dZwtYfHq7jYxXFC7SVJMcNIWj105c3OXUX+/l+ztmHhN5g
	0FFORcXy1fz2+FSjmJ5823GgrcPY9EVyUX02X8kRWCHV5dS/g6VUEppGOw41YXSVEGoHV9iZQIk
	5wxwpZUlUoDUak4BkD3T+iNxlO6vIfzhkp0AEoW7BQHUXqn9MvHwfLUF821CWDEUwsx/NSZ0mRg
	gg4TJW1AxT9eBv0NYa59up4PRyLyowicfdwcmc1kBto91SvGD7z5bJuSstXcSEd2qQf6rLIJliY
	BDBty9Gj8bcG0w==
X-Google-Smtp-Source: AGHT+IEtJBcARSautKMltyAqLGBQ/Gd8B1xihDkjxP19PBXKTkpvD+Eo/uq58hE6h11K8gLvUb2NUw09soHy4QEpmTY=
X-Received: by 2002:a17:903:46c7:b0:274:aab9:4ed4 with SMTP id
 d9443c01a7336-290cb65f861mr305187765ad.57.1761203421516; Thu, 23 Oct 2025
 00:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023064538.368850-1-shengjiu.wang@nxp.com> <20251023064538.368850-3-shengjiu.wang@nxp.com>
In-Reply-To: <20251023064538.368850-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Oct 2025 10:12:39 +0300
X-Gm-Features: AS18NWCgBWlr59lTgB1C8kcLIypbCmmlbtXSZ7g6CCjdzuXK7TY5j-4JWGWmtC0
Message-ID: <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oldest - > most significant bit.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


On Thu, Oct 23, 2025 at 9:48=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The DSD format supported by micfil is that oldest bit is in bit 31, so
> the format should be DSD little endian format.
>
> Fixes: 21aa330fec31 ("ASoC: fsl_micfil: Add decimation filter bypass mode=
 support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_micfil.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index aabd90a8b3ec..cac26ba0aa4b 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -131,7 +131,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .fifos =3D 8,
>         .fifo_depth =3D 32,
>         .dataline =3D  0xf,
> -       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32_B=
E,
> +       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32_L=
E,
>         .use_edma =3D true,
>         .use_verid =3D true,
>         .volume_sx =3D false,
> @@ -823,7 +823,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_substr=
eam *substream,
>                 break;
>         }
>
> -       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_BE) {
> +       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_LE) {
>                 micfil->dec_bypass =3D true;
>                 /*
>                  * According to equation 29 in RM:
> --
> 2.34.1
>
>
