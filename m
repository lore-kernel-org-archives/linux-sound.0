Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EEF2D7DC3
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447089; cv=none; b=qMfr9UckJi9Kyk4kQVFAhqiTsQbVNmEsKD8ZFQ11plYTZyQqGSJn38V5MnJ/26OXeck4Dw+Ttlj+4Krx6ZcuYlyQwChT84oVI9lLE+AKCvszshZGTReaGsF1kj2QAD4kJCU6JysljlWmUgt4SDhSLSMXNVbad+qRAZq7OzIcUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447089; c=relaxed/simple;
	bh=69X79MUwLlNysqrenmpwIMWai79eQpyscgHeiMgLaos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIYDv5h8YxelJwpfTzzqouuYuxRmUTpP8p80vZ3PdxEYzu4XqjANwKY/Ih9mw4r0TEBgaxPgbXoG2mCZJoE9mrukxrkVF+bF/mT623hb6F/Zk60er0KQ4kr/FtLeLxQ92rER+a5a6VgMSOQfTb8X2ardQ6JboA5F6oHM5+eZN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F10WsT8X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F10WsT8X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34a2acb736eso702842a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765447086; x=1766051886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=F10WsT8XbjGleBDQxu5fT0MWopwiDf3MJNHjXGW2B7bqESWshcvUcVD+Ptmbt1D8V7
         31daYwukrmB1Inh8bXpqakcnu6pdZ/bOLpmp+hOZde+erWTVC9tXVdV1J2lPGorhKjem
         CImAkjLTU97QqyRPGB9TiUR5fWzFtBRruVZO6cuJAc8F9xYwzSPaaKD4KoHSHroiow+w
         SZ5lJDrNAFCNgjz4Dz9QzQ3o0Y3fZeqNZw6XU+aaLjb6LfHKRwVhjQcTo5Yai8UlJuvJ
         BPEcT8VM9R9LR+fnnjcTQ3E+LUKpfjc0quNkjZgqwK3reuk27wd8rfY1GrWhYnJCpZF4
         UM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447086; x=1766051886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=lKu4GSridaH85csbwlhMdyknAX5ovw5F1iTH8eyqz8BhI5GR7UsWzcLGmIJwdmtT3B
         ssBnNinWwMDZ62keTnuxiBLvIA0HnH/YnqkW0+qEbOtf2JYvpiAXUWR7Hqzk/u1cJFb3
         Zw4wkRED7u19veKSJ0s9x5qovydMJtAA/KEsjsuZ8g5m+jo2bz76qJa+gFJlgGQmDvAU
         I+gn3OsmpUi1CXscywFJHSyKYFfqZ9JbISGFKD/zYIvgcxWyE1EF7/tbqK1KWgSakiNM
         NW8gVv522teN3R+beYqRkavZ1ToXP24zGm3xyHvrE3h++NhN37jd8v9zyF4xlPCisKUM
         9/3A==
X-Forwarded-Encrypted: i=1; AJvYcCVcqjtZzqULbxNNOC9aL0Ke9LhFVGWPBlil4GWiXx3gA41Tw9b5fSrQYbB88tB+WiOXJMF+ZdsglS5aHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPAygLrPAFNUbZUD2wv7Oy0AnhYxB6RJ2d9/54uCeN0X7PbLm
	shD5GMyzeFbsWyjpiiULlY8yjJYGyORnHw80eVqUYsjRRkErT8RLwll8vOncQ79GrkMy2vz0z4F
	fZtk/EnJdPfuskyWioYyP3ws9nmUPmGc=
X-Gm-Gg: AY/fxX7849eLdGSjYFy2O6iDUnzy7blKiII2u9pOzYwLpX1ZXSlz4n/7Pu+FtsXOo1X
	7+EatOL/oBI4y6FZxUfovjIQZtjZzWQmtkkLXLR09LLcLJlt0FTAWVrdXyTj0sL0kiPa9h5BXqe
	7EmILIJlMWjwp4w5el0yih+nbUB0mpsrtzxkcjJnz7rB7z4qp4J1Gg2ivf2hsV9eZzb8Hg8l6qI
	EM1dK8cBRM0y7J5KR8RVZVF1O0xwbdxZ7OthvlFSi+SLkGAB4MWMyJ5lBzd6XRoyDO/VPY=
X-Google-Smtp-Source: AGHT+IEPAez3qFaiu86XfuGUlJ09om+vEZUN3OHHINJOMWyOHJrmK5BgG+nV4ll7eif6AQOdoUJeVXNmsvHcSg/da2I=
X-Received: by 2002:a17:90b:3d0a:b0:340:bb5c:7dd7 with SMTP id
 98e67ed59e1d1-34a72808b46mr4444610a91.5.1765447085709; Thu, 11 Dec 2025
 01:58:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210062109.2577735-1-chancel.liu@nxp.com>
In-Reply-To: <20251210062109.2577735-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 11 Dec 2025 17:57:53 +0800
X-Gm-Features: AQt7F2qVkg95kvsYnRruHeVoiRu6n_5hGKsx1QSuPHUDHP41AdIiLfw6-a86lEE
Message-ID: <CAA+D8AMfBL9qQR028iQGMSiMVB__NAiyE_DQ1qiJG=xABZhWdA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs
 only in master mode
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 2:21=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> If SAI works in master mode it will generate clocks for external codec
> from audio PLLs. Thus sample rates should be constrained according to
> audio PLL clocks. While SAI works in slave mode which means clocks are
> generated externally then constraints are independent of audio PLLs.
>
> Fixes: 4edc98598be4 ("ASoC: fsl_sai: Add sample rate constraint")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 72bfc91e21b9..86730c214914 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -917,8 +917,14 @@ static int fsl_sai_startup(struct snd_pcm_substream =
*substream,
>                                            tx ? sai->dma_params_tx.maxbur=
st :
>                                            sai->dma_params_rx.maxburst);
>
> -       ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> -                                        SNDRV_PCM_HW_PARAM_RATE, &sai->c=
onstraint_rates);
> +       if (sai->is_consumer_mode[tx])

The sai->is_consumer_mode[tx] can be changed after startup(),
then there may be an issue for the constraint.

It looks like there is no perfect solution here.

Best regards
Shengjiu Wang

> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &fsl_sai_rate_constraint=
s);
> +       else
> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &sai->constraint_rates);
>
>         return ret;
>  }
> --
> 2.50.1
>
