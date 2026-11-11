Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402304;
	b=jCh+1Jxm/cWDo4zjyJAkUaY/TE8Gt+hOYv6/1oGMP1KPVfgYF3Hfj4KLzHZPpJJwrB6R
	 wi3qaWbnHoOO8XS9LtORbSMpl1zVkuQvrLIW6todduqBewYq5j+OkDaN/BwA01+tSMhq+
	 5v4sNw7KQ3+SYoRt5DuxCUaRC9D5CU7M/4ij7u010GAAD+aUJCc9basQJQQ4dl5Pc3MNn
	 AVX+7xBe3QGrpcSA2Tdl2/+5KdBxFhY07DQLgnIDQQ4MhM4FTZKr7Ly5mJd9WwXVSfyRw
	 Ru4NzA0vjJzH24uz5rRwOsleeUXTnCdlNiKfh6Ir1kU2yrYDqRSHseZGkzp1vhX8Urg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
	b=qBRwSnBeKjn69DV8w6wJhiiHAQA8eAoQlsi86sFuKrQRh5SIi7g2e4EJKappxP0vA5Al
	 EeF1rVUdxBTRjgCEj82KNmHp+DWO7lyY/v51+41usMpmcXnCnq++KY30zo/aUXGqKofR2
	 OrSSpvb8z/rIm8cuRnCV4Ca0aPt+0r8t+Jnh9itpH/a2tG0pV0vdqNCJv6M2GPCLe78Sa
	 g9Q7tTPslOe5Kq0fTqIAgdPfY0cMIIEOfQZleXY/hn1/EbGVkYD8eNHzD37LkWZPLquZP
	 hgDbu0WGAEaSLarZjv9IvI5odoe1zeHRarTYROs+D+vksk0J6ZHrcoFNQly1vduhGEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybUmoUKm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F5606A339
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 13:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8F5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybUmoUKm
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e946155442so25560535ad.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 05:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402302; cv=none;
        d=google.com; s=arc-20260327;
        b=A/Ixce3/ExDS1IIoiEvAJIqbU2TMR0xEBkRFW5NMl7/r3EWzjJUFP+QjBpsVa3jeqz
         x6KRSUDZFqxPUPPnX+vLQyoJtzyIQe6CkZfod2CVkXKYX7c/nBwGeIQT9UrKP240JpS1
         e5WaRPE7+IVz/nb4zd/dNPot19gmPOsNOVcxMcd5mxVqZm6XOVVzMOLtrDc7V7W+/Dc3
         fU6tvHRQyqAhcyo+oj4lr9ENsLRKrxEl2MIU/kLlb1F7QP0EXawh1067drMbEK9jxuUa
         aajAHh1xv+pMtHv5iaPvQxDmV50sJ3E/8yxJvQDnATKBbGe4W/zUTzqyvFMDlNIU1yc4
         u+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        fh=AQuPurSYSu4qTQ7d5AYVLCL1HfM0coOsL0mtf+5pm2g=;
        b=IpWJHeYbxNttFWR6cyY/iHprMQGsraWCpz7jmyJJ+jHAwa3lDseUZ2bRliffrOiuW/
         jot/tROgupiKhT4dQsyU8BxwUbt0ZhKX9EvgYX4JbyzAiGOV/aUAhSGahfwJbUgeEjL6
         djBTE8BwH2eQcg0oxq19J71DIcZStXXpXZiDU4z5i//h0mDMDxCnYKrwqLINHL7ikiaD
         9TR9U+3nXp1QoqjHrutRTZxi7SlwQmvYHyXReN2WjwSMnGj564AGZZGLIAR1thuemwDS
         NG+w2gMx+REJlSBPdoVaFGawKPv8BZFmVALpEKe4L2UJKzw1eIxcloHGxn0/6M2foTrz
         SNuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402302; x=1795007102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        b=ybUmoUKmUK+dM2xawChduN40OAbSp3pxeJvNxtND497vR+vQyr7vCZ7PMRlKYMVO6m
         FZ+4HhrHIvDTwc5negy8xUEq94pKhBNg2zSSBevEvxgMJyuFmLdmWBIZnw38gl7q//Lx
         B0GmcH/1kQ/MPE+yP9kzkz5LUDn35KBQM+8YxIrnpnwpxbJH3+L+tQC/XoNsxStG9KQy
         Fj4uE5BBd1M94UFw+Ob6wPF11tNX9VW/FR8PtZcC/Lo/aIH7jqo1HHAFXk8G4YyhT8NI
         LrWxeJb6lYP66Hsll6zDnFd6JpxVp+xpQvKY0v33U9Q7fBidjgd74FtgRk2lOv220+jz
         df2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402302; x=1795007102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        b=N9+9kJxWr7H++RyudX9HRm205OhrVaBUtAJY6s59M8zeElaTrwcSiHbghUnmN7z4lZ
         8nH1jOYioS+yXNvZA1bta33Dab3fZv13NtmHnC+ymWX0NmWiqGPGcJD12O1bxCznivL4
         8DUSo+VRBLP+GNVt4jDvjWKHK505fVQ5MJjE0X7Dpft0sbqqBl/doPAfb2nWx0JSQcZ1
         hMz1NrSvdv/1fx+AuWusqcUOed7/oY4QA0x7kfRWnqDtb9mSgdZrKBfAyDtn2g5BzsM1
         USseghI4wOLNQS5yKWjxmzo/s3Ts1nk8jFFCU1wOhzANphMhSyMJq75e57PMpMT1VP+u
         9HvA==
X-Forwarded-Encrypted: i=1; AL+hErGaJKLkT2w/z2uaGS9u0fPhA2R28uMNk5cMZha1BTxiRVpPv38WwI/UKS+eZcrBof3MGxPSxrRhmdc6GA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xf6nJfZBZDjbuTcsnlzKJYceV6z2mos4ikvs1U00RmZd5F9Q0
	upox+lUBelJNW4AyQAsFDsWpOia49tU850emT3kmhEmkGtm/y67bdPM39y3BmCd7/Yv8a29SPKL
	M7pz6QTiMIbtbgYoqPe+EWzxHXAEYW7g=
X-Gm-Gg: AYBFou0wZ2QUkXuhiJTOjolKE1zFtiBJUlK1XChqvyrQmOO14KI9sXs2d9kSEzusKXJ
	CUUgNVC3fA5OaMT/tc1J+bWBzIXJ2//OfxhmaSMtGfQDI1Q2OF10qxFiUSkud8S/hPpkeZZ0NUS
	fHKoJM1aRlSPf0LxJzfBi/2QoSQhRUiS63QeN2727l/j/K7pFdn4jEvuzhvJ+9M1AKS+gY+DX1K
	/ih4ZzokyO2DyFr6XS7RLzQyHVs55t9DkRWuXAYo+xqiRvhhrFEi1+4xG7JMOqbBCZ9uGb1AJPy
	gy6P063+S+fq9w7rQRufzJKRL9y1ueE9ERcdbNBbgTa+yrIyTcvKabkhBCcPG8QxB18HlzYCGgY
	FwIeUA67NXSgF/QgWQHfqcDRq4QHGGP2+Zcfvvw==
X-Received: by 2002:a17:90b:1c01:b0:3b0:9a2e:b491 with SMTP id
 98e67ed59e1d1-3b182f8c3e4mr2105707a91.66.1794402302257; Wed, 11 Nov 2026
 05:05:02 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-2-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-2-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Nov 2026 21:04:47 +0800
X-Gm-Features: AclHuK9gW152QspKH7kQnf0y9WcVt11cA0ZeBNkE67Czjx0uGH17tx_pcQrtqzY
Message-ID: <CAA+D8AO47ctz1voKax0OsyYiLQ+UT9gU-E7Z0i6=D6RKgb9=yA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:07=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> asrc_read_last_fifo() checks the FIFO fill level, a number of frames,
> against a length in bytes, and ignores the frames already drained by
> previous iterations of its retry loop. With an output length close to
> the 512 KiB buffer size, which userspace controls through the task input
> size and formats, the drain writes past the end of the output buffer:
> 312 bytes for 10 channels of S24_LE with 8 frames left in the FIFO.
> 8-bit formats are also stored as 3 bytes per sample.
>
> Check the space needed by all drained frames in bytes, and add a 1-byte
> path for 8-bit formats.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f..cadfebb12e7c 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -53,21 +53,26 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair =
*pair, void *dma_vaddr, u32
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
> -       u32 i, reg, size, t_size =3D 0, width;
> +       u32 i, reg, size, t_size =3D 0, width, frame_bytes;
>         u32 *reg32 =3D NULL;
>         u16 *reg16 =3D NULL;
>         u8  *reg24 =3D NULL;
> +       u8  *reg8 =3D NULL;

The asrc doesn't support 8bit output. so don't need to add reg8 here.

Best regards
Shengjiu Wang
>
>         width =3D snd_pcm_format_physical_width(pair->sample_format[OUT])=
;
>         if (width =3D=3D 32)
>                 reg32 =3D dma_vaddr + *length;
>         else if (width =3D=3D 16)
>                 reg16 =3D dma_vaddr + *length;
> +       else if (width =3D=3D 8)
> +               reg8 =3D dma_vaddr + *length;
>         else
>                 reg24 =3D dma_vaddr + *length;
> +
> +       frame_bytes =3D pair->channels * width / 8;
>  retry:
>         size =3D asrc->get_output_fifo_size(pair);
> -       if (size + *length > ASRC_M2M_BUFFER_SIZE)
> +       if (*length + (t_size + size) * frame_bytes > ASRC_M2M_BUFFER_SIZ=
E)
>                 goto end;
>
>         for (i =3D 0; i < size * pair->channels; i++) {
> @@ -76,6 +81,8 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *p=
air, void *dma_vaddr, u32
>                         *reg32++ =3D reg;
>                 } else if (reg16) {
>                         *reg16++ =3D (u16)reg;
> +               } else if (reg8) {
> +                       *reg8++ =3D (u8)reg;
>                 } else {
>                         *reg24++ =3D (u8)reg;
>                         *reg24++ =3D (u8)(reg >> 8);
> @@ -89,12 +96,7 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *=
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
