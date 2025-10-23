Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43682C0F76
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205966; cv=none; b=AFL+N4/U54IR1ocJmzDCsFJ2tvTW5r+l2lkYf/x0I0/igsgLHYJC62HmjlBUXG8uqIbMW4FYiIbJjYAXJN3Mjp35S1dqvV244PRwopBkblyT838Y+byyf2e949RWq7DkeQAeZoiBPQiTFfRdiP6EbIJHWGl4Vb1p4T8shWcKZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205966; c=relaxed/simple;
	bh=Vdsehfzan7Wo4JdUx6x3JP7AsXeDExJDtppR5Qbz9rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxkGa13iJ1H/3sqwwcJX5saRFneQCi9Uuy9wQtRdJApU0NLCaYgDwSTFQNrDcYjZjjSLjYFEC6cpt3qGTyIII5u7JTSzKqtO706hTeT0ld7OIF3U8ZD/5Frw5WGDz34YBje6sqIBHVrAZlkQinAHd1OkZm/72pwRu9aoJFsKL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3tZAZdc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3tZAZdc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eceb38eb1so5538895ad.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761205964; x=1761810764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDxToBSJlh6pwttSjRukYxP0hoFnewOMMeOaj3DS4H0=;
        b=T3tZAZdc/sqPtjmZTZ/QIsRuZm9R1EhHUIzgHVDxSGdhjLyCuZ1VtO3vuemRPuexYG
         yBR6Hq9snMaX6CxzNd1GoLwKeEmsEoQ21xPSn9pMuxAdqh6w17F8fFQwd8MIdqqFKfZ0
         87bVxY9DVB+q7mUuiDyzMBckTFhp9KAedjNvo6v+WdnU2L1Ipyi2If7vbu6KNCkPCofe
         hYTsZCm5O/+lR1whLGPDoEsE0+KcoueC72s4qNAdPF36SPyyEgpbXq9Ni/+fs7SiXQtj
         F7Vly8pfdnA3Of8jxmcFPRGFoUGyUtIliJuUUwKsJW03M1ZCgP6tSFOyZEfBdZs2SdQe
         vV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205964; x=1761810764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDxToBSJlh6pwttSjRukYxP0hoFnewOMMeOaj3DS4H0=;
        b=s/vrYuCumbqzoyt1lkJ7Ra8bjzCq0Cwk0tcgp2giJlPH0GvPTold50M3UPYl6Zxewy
         cUSaSNGRaVghL/V08MoM586mGBVZKnbvqy4Tn9pFV642CPW7wiYsP0kRg+hXqFRvxWUq
         7VetMKHkzRaOztW1NZyEH2WyJKVwss9RC4Rm41HgVxF6huUOzrqotWJ3z1BLFZVagDFA
         PQRadhfDeJuTh+bCDn4Uu9XiTKcmYOOFZyJlpPWTVP2PedE+/AKcbRlB3iGJYQN+zMMO
         rsSh7yCESw4vmuwkAxhUswq+TRQZUGx0nSn5hauNp6VklGWZSsRWwp6hCY9OydLKTfWP
         ZTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4KotxukVniTLIv4Wpw6KvkuSMQxstwoZPF11ew/I1fe5csC/LoB2hqOxqevbZbbbhOu33IsA9SuIR2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdfVcSAi23u559KvgI/uUADexgxTfYmZiucuY8/gNrTw2p8D3g
	//IrnEarymcU5ZpIxPGcQs5vhgNyRNy2WujyCGCbO9Iw5b5H0tNrLs+wGD9jBRM6fBovGtFlSOZ
	mIyhfxnKTC4IMtiqxN5gxP1MkB+mZDR0=
X-Gm-Gg: ASbGnctKAMi19jPxhhyX94TSlJ0IEmsSfAuzcCZKXAmCPDZfetXR9ysNMZ9IkZhtei/
	BM9PKPBIzI2OxTDlhnogEQ+d5XKYkn40eE1za/yI9dAn+bmZ64uwP/oBgem/5wnM/zOUwKnDQQy
	EG34tMvMU/Wm30d88y1PS0ZVEHfPzABSg6/c6bhsbiPKIBGeWSu35AnhRviHSFfo2XEpJ2rMEnM
	xMEKP387/GbTYakFca2Q8GycbmMsGyJLzRP+ybZM1xXcoMmF0YBPJqzThX0CIiG/4AzRJE=
X-Google-Smtp-Source: AGHT+IHZm7YHicY9t1s+9cg0DRHa1Ixx5JoRyuU7gM6pUgzxiSEpAdgekh3BcvYqugXkHXZmy2Soyl8hMWKn/Jc8zpc=
X-Received: by 2002:a17:902:d60d:b0:28e:acf2:a782 with SMTP id
 d9443c01a7336-290cba4edf7mr245675835ad.37.1761205964066; Thu, 23 Oct 2025
 00:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023064538.368850-1-shengjiu.wang@nxp.com>
 <20251023064538.368850-3-shengjiu.wang@nxp.com> <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
In-Reply-To: <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 23 Oct 2025 15:52:32 +0800
X-Gm-Features: AS18NWBwB2MtjnQIiGgglXV9h8USjZRfSHjjPdz0DOn_3hzcucQZP-krZ_KRb7w
Message-ID: <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> oldest - > most significant bit.

'oldest' is from the time perspective, which is aligned with the descriptio=
n in
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm.c#L2050

Best regards
Shengjiu wang

>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
>
> On Thu, Oct 23, 2025 at 9:48=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > The DSD format supported by micfil is that oldest bit is in bit 31, so
> > the format should be DSD little endian format.
> >
> > Fixes: 21aa330fec31 ("ASoC: fsl_micfil: Add decimation filter bypass mo=
de support")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_micfil.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> > index aabd90a8b3ec..cac26ba0aa4b 100644
> > --- a/sound/soc/fsl/fsl_micfil.c
> > +++ b/sound/soc/fsl/fsl_micfil.c
> > @@ -131,7 +131,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943=
 =3D {
> >         .fifos =3D 8,
> >         .fifo_depth =3D 32,
> >         .dataline =3D  0xf,
> > -       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32=
_BE,
> > +       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32=
_LE,
> >         .use_edma =3D true,
> >         .use_verid =3D true,
> >         .volume_sx =3D false,
> > @@ -823,7 +823,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_subs=
tream *substream,
> >                 break;
> >         }
> >
> > -       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_BE) {
> > +       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_LE) {
> >                 micfil->dec_bypass =3D true;
> >                 /*
> >                  * According to equation 29 in RM:
> > --
> > 2.34.1
> >
> >
