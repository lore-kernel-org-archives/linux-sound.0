Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4521A6166
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414365; cv=none; b=LnnTzhIFUU3O22MGb4rdfyj3LHsCnCMvS/5LS1RyYNwaMQ8yqGsHwGOChd4gUXfTpa+ynP2q6Tz/QLeKZsVCGeFj6+/YUR8i9pRSN00Z/erBrFiG6+HqbzF9dojBeB5eXM+Tan3SxnraEEE8A8MYmXc6qPOwe4lJGREItrmVRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414365; c=relaxed/simple;
	bh=tAC3ug/LGqAdm2YEhAedFZNCwyk2NGSC0+F1U6scVTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkeqpnHzuPf8+E8VuPsfh1q2i94z/LR5SDvPycnAlnvL3cRXqY6XKXdS2P4Etignmlsjw7UOeABsQMztCMXPbyyoOyxMprvq12hrTkqzWqQVK+zvQnZqtjnvwbRuDIQ/VgytFDmEf6naHVlcF2PHY4lG6XyCqnEzPZfZ5Pk7jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=IVu7w6Ed; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="IVu7w6Ed"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8223f0614b6so1495356241.2
        for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1722414362; x=1723019162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFjJ7n63paZS6uSG42PXEZWs1JHtvlpu1J7pCHV1MaA=;
        b=IVu7w6Ed6g7vZqHOo5KjS/8XW5dDLZcltfDNvyt18ajCx4Tov99PhxiYy8I332RWeW
         5gKisO4AFbWdGc4EGFHviRB/t6Rkqr8vV3f5z2HDP3Vo+UdxwX06FKBF3KBmRB0DOmML
         vgywV/rmorxcHnyjn7V3v4Kpik+jWDqdko7ZvsYNvdGo9w72I8ZVxHTbchW2/9s2UNii
         FbXQ+asuzXroKbut/PXg7YozCgvdozZ3D0QdGxafV/WoD3OpCuaVLAC/vFY9zjuVs8Yz
         8ffumjhOXAJpEBk1FgHgu7K3NPsH4Eyv8kAfS2/EAbbcO44q6S/adCdCchKPvanUN5xm
         PoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414362; x=1723019162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFjJ7n63paZS6uSG42PXEZWs1JHtvlpu1J7pCHV1MaA=;
        b=ih+v9izv6nO0WEmj8UxuXro3tdY7W9Nu9jHQTDE2Re16Vr9IzHUDNSzNVRz5CkdQz4
         oQ2Q16Xt/xFCXZCiaNi9wA2206gxOM5lrincQ1IgHMwN/NkMhbYKx6k+OM6tMJND+Fml
         7JRiRaFq6gv44w8UeVTV4XrhdSsK8tYJjVYpA9tUgXzXs/ovQLTrSIiUlvSHBnXCQECM
         NegER3PIvajTe3Pj912vmFQ5v1EKST5yHOaC8g6VGPraV4fhtJQPzm33Omyj1VWMrm/Z
         qcjfUl3DYouIE20LTXvVv8oIPA9j9+2z6zfsc+3jRrqJuztxfaYYP+tnC7YdwlfYUTQm
         l/nw==
X-Forwarded-Encrypted: i=1; AJvYcCX33ioMDwcvSWVoy5k55dcarhoYWzyJL6+yVugBfFqUq3c+7GUXUBxtYdIi60sChNAyK98zWulnKWtrcqQX/C1gC6YBQEYrh2F0LPk=
X-Gm-Message-State: AOJu0Yxb0rKuR8g/AuzLuUXzRhqsPDzcXGCQmCAUXOHfXJUdIgxHNuBh
	OJRkcbiNjTq/QCdA9pkFglrIVrs5mzGKf7XdH6cElxmwtfs395lOWWEkXRn8PR75Su0Oy7c3qnW
	2CC5zmoQvssorqOCT55LdMyrak6DazUuyZuMQWA==
X-Google-Smtp-Source: AGHT+IEZQxKOD7qrEVQxXh0yoroOagYvbnV14lRkkP0QqCJaL1USQW1bT0weUmb2OMtTj4zK11JciNIw6TA8x5ATMzI=
X-Received: by 2002:a05:6102:390b:b0:492:a7e5:df9 with SMTP id
 ada2fe7eead31-493faa417bfmr15098391137.17.1722414362030; Wed, 31 Jul 2024
 01:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731022949.135016-1-yuehaibing@huawei.com>
In-Reply-To: <20240731022949.135016-1-yuehaibing@huawei.com>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 31 Jul 2024 10:25:51 +0200
Message-ID: <CAG+cZ05LGBsNODyAaApS1uoPXPh7Cchp8utm_AAWoM09HZzOzw@mail.gmail.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx-i2s: Remove set but not used
 variable 'savedbitclkrate'
To: Yue Haibing <yuehaibing@huawei.com>
Cc: jonathan.downing@nautel.com, vz@mleia.com, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:39=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> The variable savedbitclkrate is assigned and never used, so can be remove=
d.
>
> sound/soc/fsl/lpc3xxx-i2s.c:42:13: warning: variable =E2=80=98savedbitclk=
rate=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs=
")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  sound/soc/fsl/lpc3xxx-i2s.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
> index af995ca081a3..62ef624d6dd4 100644
> --- a/sound/soc/fsl/lpc3xxx-i2s.c
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -39,7 +39,7 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky,=
 int freq, int xbytes, u3
>  {
>         u32 i2srate;
>         u32 idxx, idyy;
> -       u32 savedbitclkrate, diff, trate, baseclk;
> +       u32 diff, trate, baseclk;
>
>         /* Adjust rate for sample size (bits) and 2 channels and offset f=
or
>          * divider in clock output
> @@ -53,14 +53,12 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clk=
y, int freq, int xbytes, u3
>
>         /* Find the best divider */
>         *clkx =3D *clky =3D 0;
> -       savedbitclkrate =3D 0;
>         diff =3D ~0;
>         for (idxx =3D 1; idxx < 0xFF; idxx++) {
>                 for (idyy =3D 1; idyy < 0xFF; idyy++) {
>                         trate =3D (baseclk * idxx) / idyy;
>                         if (abs(trate - i2srate) < diff) {
>                                 diff =3D abs(trate - i2srate);
> -                               savedbitclkrate =3D trate;
>                                 *clkx =3D idxx;
>                                 *clky =3D idyy;
>                         }
> --
> 2.34.1
>

Looks good, thanks.

--=20
Piotr Wojtaszczyk
Timesys
