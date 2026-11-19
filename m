Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057671;
	b=RR8yYY/3jh2N7LS8/KBuGXdN6ChtoVpsnN9Zaw2gmAuTHU6jFsjIzzeqeVOjJGlfK1WJ
	 djiqB4Q8aSh10Royfg7vJY7NeFHE0LXNi7xqbGyfXsP6MeycaIa9jj66CezAX4aqL1NRx
	 xgVTovlBPta5K8JigmpAJTKZHIEr4QwEX7q/dx+zD12luOwOky/zq8DuCb90wWo+ds1dh
	 Bh6o3mbmbzlOyLAtXJofpMWQCKXSv9MbywcWm2nMuREFi51HUPwBuO08+W4CBmFFlW/Qv
	 0/i/uEmsqgTHtXnVFzD0xMgcNVH/mwR6bq/EArb+eKhr2Bc97GVwkUfwuy/dwdHQGbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
	b=qW+qzCrU/iBoo05h844cL34x+rxi50YfAd6bqXOR4ucbWZbM/MBKiefFFvBLiEGPPpYk
	 FhHlqFt9dWI5DFRmOLChBVJe2JD3Mae32wnptfYNSFV0C877miKoBsCUISNSKhUENeLxl
	 sn98xMU4VzY3sruNC3/2FlTtsdbYDi2cvbKUve/7w2SzsIxJm7bq6+eDjfqpro8Qzro8p
	 umq1Gv8kENpEx/kcCCa14uSye3WzobaNGjSy+7vt82Nm1XxbzdOjz8jJOac/dy4CbrT7s
	 poPlbaIv5vQYbKu/1ON3JrBNyypPaVDrcka0A74kkTw7i+uKghenPETnV4W3XesI6Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYBeM0Lm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A160A2600
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 03:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2A160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYBeM0Lm
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1364117b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795057669; cv=none;
        d=google.com; s=arc-20260327;
        b=UnZpdlUYuZT6zq5d2KxqumDaYbbZ0s2EiveU0lzsWD18fe5RwTrEATO+vo8p3L6BZd
         F4ioxwaH0EWpJRD1Zh7UI2DOUsQ+Fyj9SSHI1Znl+zbpIuKIyHRPwaDmZ0TYLmZryTVt
         CSJxvK3dC7Nv8KqpbDKmbtKRGNEtSh96nlqgjM9H1QeDf0A2A6/KV9rud6mcM2v456II
         SzxquTBjfhCDFNfysM9Q7oTHcM2r0eEsSzN2J+jHTGkA2eVrqFE5fStEV502jvIkMrTl
         l0ymYiVW3WQMfXf4Kb2RCs6tuIjAYRqI24uLG7l4S7wQTLymzZLvV9pPyPFHRYHKIVwD
         FKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        fh=V+WG/KTMvHeO0XmZC/YM1/snqe+9Wo4TI+oAKipGl44=;
        b=MfIjLHgYDcKbDnNAX2IAj0EiHsstfy+1PLsNJe2SUsjRrvlOd0d3y14C6UWyHp+EYF
         Seyqw1VzQBd3oe5dch+NmOVgPkEkOLbICmi+MRIGCQ5TFnqw/SMIMZv7rKLOMremPcfp
         vs9w07hemyhYJIrv1Q5XmbnuIqc5yYDHusc9t+beQuCrDemAHFlG/Mvk+PesnWf8Ffxo
         sx5Bfhd0d8LW7pEfgvMCUe8FTCsVNsOOZ8gbif8RkyZy+B59LXt4LbpStzDpP7RRe/9R
         KtNEbvHqW815xIQTVOMa/cTv95ieAOnQ7oGspPPsi3MZM9AcWZOmdM+13NcMF6LF+en0
         rrTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057669; x=1795662469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        b=GYBeM0LmW3fBoq6TLNh0h+x//TsciS7WiQh2adlgrBV3zuamlRDrwk12HIHcTfiXhq
         V+XY5ZM8UWoY+1rLYIyPKcJXDpQyTfPSdVqHWNEFoLEm46QrpyNLFmXaawgSNrIc2Uu1
         0rNedcOChIeundKzgxqpyYbLUHjkuCTb1GtTOQEMqJ7qBfDjJ6qNKc9G76vrq5sUPFG2
         O4TBlKwsdXGazJAWKjKP/o35CNqaRKLPmLCdI1ndeDlxUzMgAye0Hy0/QnZNDqjRZ4Fq
         G+2gX/pk7uAmzzLmTOKk2MtK98iKSauEQmRI2Gwhj0vMk+yfD7l9uZGPiA05inauHotU
         PjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057669; x=1795662469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        b=ESLCIhuMMdvvzPmzW/JZiYBa9Usadveq6Wk+9DT70Gj2v7pjW9YCv0atxe7QFjuEO5
         hYyIlO+ra0RB0i+JGZ56BDEh8XUhPRs7kEqlQAnV/K+Ei/CI6ElejOJg6H1sz/PCaoRl
         nS5ryVnHAdLNg6eXGDO4ZCIi8pw6srV5phDHFHXNzATtcLp3lsEMsElhE21uUbRoK43t
         BUYS78FiZp2tfd2fd6m6LiKCPHcf/gBQFqx2fo/abTMgqqroslk+5z/nY4gVL5y0womX
         b/qGXKkvmlAYYR5p8NlQKhf528eMyoHHK10RWOVoQFCzS085ynaRlOZc4XOjvhlDQ/bb
         1y4g==
X-Forwarded-Encrypted: i=1; AL+hErExaBsCx0nQX9YfmQYkV+ylLbFkIKROPhe3AZjCDvSB7l6xkIv5ed8bLonSlHLjcS2N9l7nKR9j2UBcyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/W2prJmjwEDA0C8wSA1hwGil7nInGxVhVPvSv6xLAsPart0B+j
	P83WbLbpW/NIeMWrVWmOObKGWn90zY4UdxFqRU5W4xBCrm+M+ganC3B9mWdh8GJW+Vwxj1J5E6t
	c750YDBmyh3Fvmy01G3DEx1y+CDcb5+0=
X-Gm-Gg: AYBFou0QEspJzzeQUEkin79oSE6rBZVztUlGBp1MqWa+U9lmvx3QpWjGZcXijbT2XZz
	cwCFOBa3+aV6miP0d+7NvombiUPpGnXaK/Ci6uk2r27/P9lKpMgHeKbUOInSadBUJkKvGjAdKX+
	dHAPHdEevpryb2kP/f1BL2NP8pgQ9oCeO6aGysadhHHjH0WIsM9qlLsk652JBE1nfppX+0t2lXm
	68sNg6ZQ9ViA5FTZlGZA4BR4Jio7pTvGjZXS2BrqeJnGDrXPWSWYqjtPTFAEISdWHVvEU3P45e2
	Wv7o/0KLMs+O81OYNqdMIc2Hjm0oi2MFkBz9eTSXmDNCknmitxWcfRHnFNRtzWfYltTfjxCEoUb
	HMGtUs6pgBIxuTTn7MH52hWCsgNhMM7mnYxKX
X-Received: by 2002:a05:6a21:1404:b0:3eb:ab99:9af7 with SMTP id
 adf61e73a8af0-3fe8b5e99d6mr4610640637.62.1795057668780; Wed, 18 Nov 2026
 19:07:48 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116093751.138455-1-stefan.ghetu@nxp.com> <20261116093751.138455-2-stefan.ghetu@nxp.com>
In-Reply-To: <20261116093751.138455-2-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2026 11:07:34 +0800
X-Gm-Features: AclHuK_cT3iD7Ffvch2F2nwvYrR_J4jujPvEa81BRVMErAOFxU7rIO6bAXKS5E8
Message-ID: <CAA+D8AN4q2BNceSORnZTO_BSOnBpvhdOe9AgVCO3Lo9WcA+cgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when
 draining the output FIFO
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 5:39=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> asrc_read_last_fifo() checks the FIFO fill level, a number of frames,
> against a length in bytes, and ignores the frames already drained by
> previous iterations of its retry loop. With an output length close to
> the 512 KiB buffer size, which userspace controls through the task input
> size and formats, the drain writes past the end of the output buffer:
> 312 bytes for 10 channels of S24_LE with 8 frames left in the FIFO.
>
> Check the space needed by all drained frames in bytes.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 21e5cafaf823..5e9dc5b956fa 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -53,21 +53,27 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair =
*pair, void *dma_vaddr, u32
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
> -       u32 i, reg, size, t_size =3D 0, width;
> +       u32 i, reg, size, t_size =3D 0, width, sample_bytes, frame_bytes;
>         u32 *reg32 =3D NULL;
>         u16 *reg16 =3D NULL;
>         u8  *reg24 =3D NULL;
>
>         width =3D snd_pcm_format_physical_width(pair->sample_format[OUT])=
;
> -       if (width =3D=3D 32)
> +       if (width =3D=3D 32) {
>                 reg32 =3D dma_vaddr + *length;
> -       else if (width =3D=3D 16)
> +               sample_bytes =3D 4;
> +       } else if (width =3D=3D 16) {
>                 reg16 =3D dma_vaddr + *length;
> -       else
> +               sample_bytes =3D 2;
> +       } else {
>                 reg24 =3D dma_vaddr + *length;
> +               sample_bytes =3D 3;
> +       }
> +
> +       frame_bytes =3D pair->channels * sample_bytes;
>  retry:
>         size =3D asrc->get_output_fifo_size(pair);
> -       if (size + *length > ASRC_M2M_BUFFER_SIZE)
> +       if (*length + (t_size + size) * frame_bytes > ASRC_M2M_BUFFER_SIZ=
E)
>                 goto end;
>
>         for (i =3D 0; i < size * pair->channels; i++) {
> @@ -89,12 +95,7 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *=
pair, void *dma_vaddr, u32
>                 goto retry;
>  end:
>         /* Update payload length */
> -       if (reg32)
> -               *length +=3D t_size * pair->channels * 4;
> -       else if (reg16)
> -               *length +=3D t_size * pair->channels * 2;
> -       else
> -               *length +=3D t_size * pair->channels * 3;
> +       *length +=3D t_size * frame_bytes;
>  }
>
>  /* config dma channel */
> --
> 2.53.0
>
>
