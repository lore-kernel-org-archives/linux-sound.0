Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60629A9C9
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770067890; cv=none; b=rtcFdPX8l4ubc/juMQBJI8HZ+UrjFH7AkrA2dP0MAawNtsgr0sloV3m8Vd9aZ2xilqOJ2vuydEq+TpbL1fQiAfvWD+VG+3G0sQRo6h3MercW99FvPx8pY5QraM+xHviGG4w5fKNahnNB+njfLoZ6zYOMClyPA8Zsn4UqKYICUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770067890; c=relaxed/simple;
	bh=cyc6OoN+kI+3TAVGBTSTHp1l4SopH0CyprjPmJtiexE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S78LxJ5bB6nuRZJyJqd8AxjHaw5LpgW3nHn1niWM9RsIV9uGeYM/v6kJVu2WdaUUDYEieFewflP4O+NMFh7ZKbuhnNFBFSSpXOg8yAqEXR2mEVe5LSyOlAof3lrujumO8HF1rsMdZnhPsyckbRbc2rQIWd2HFwGLS0FecJmb9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDPmuRSJ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDPmuRSJ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-895071c5527so24455186d6.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770067889; x=1770672689; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lWCuWOd87xE3ipLxzMTGR23XPtyn4/7fQsE4OP6NNkM=;
        b=QDPmuRSJpSuuLUNwDwk5suCIrvaU+UY+vcajvXl0q1uBgGuXGdy5CwjezM+2ya/oD/
         FrN37vIm0LCTIMTMmXXW/b1HZBzGan8LK6n/Jy+fiZ/MwUlzJsVM845nTa7Aest0nLii
         Pr+vlJ7p+pBQ0Paqvpy4TNnI6NN9Kd38glw8LTgMuAeRlYlPN/SH/n/lEaFAxxYqeduT
         tU+inBSi+cGcdeXXGRJH3wdOKTgxrpk0jhJ5w50T2Gkp71VyfMw+ua5/m5Yt5gbLoNDT
         sWxKEY1CQI6/k5kOY+TOTtvSY9Wvg5UwPp8juPIF7FWPODyHjSJsGlJ7PJKbLexilXli
         TtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770067889; x=1770672689;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWCuWOd87xE3ipLxzMTGR23XPtyn4/7fQsE4OP6NNkM=;
        b=R1/oYUE0NWrZ3b36QqYY3C9wTo36FJOl7A4MengS0AKxi7F+l3i5ifxgWlf2xsq/fX
         15egxukR6OVAfZ3VFVdspwjFmN6pQfWFDwJFFYTvSB3VzNq2O38x2I12aOKqHdm7ES/W
         IW/stC5TdtS4ahsUbG6sKvstvuQBamg/SRjH3qkqjzpUjYydrhLubqcqUaAyVoUA4+eb
         TfXSDjcfJA32FElN2k4GhT1ppFeuWuTtVfI8D8SjgK7jd1BmkZDjC48VTerkq6YWJHRK
         RpHSCXsbFn8YZ1JsZc7KwB9tmcsYZ18JoNAc1boSl0VHzmQ/xquzOxpJn7PuMgY0U0Gm
         Opsg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmv5nNJSWDpqYFN7kj1B1xYi4aNukLwxq1bu4A0uxPZ2qkNWH61h7T5yKNpKfbTZRcJOCq3tDd2kc/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPHOCHu2xXGl6RsciNRdsLhfSclEU38sMUr0wRZxPZ0fisnhf
	Ik9IbxKG5W0/DDqw6JPb9sf0pO0G8C46jLSoHnMDSe4xX4sy2EuiV4lk
X-Gm-Gg: AZuq6aIuWxPURy5vxJn8zCZqsGGCX9QIk1hMMAVilPTip5NfqfUDghdJ3MTdkza7Vew
	WxC39ZnHyxdAQ2GdVOnvOFVx+J/jZU08ejzN5EepSJ72L0GeZH/kGuL6UpOR27Jc5q2ycuYyt7f
	Iub3RXDhgw0K/e9fTYgB9fLuWsyLOEXfSQ55ff9fXFQAfo8V2GxVEgsXA2FHPP1K6IZssAaIiUv
	c4F1xFsTTUOeijSR3dzYOFiBx0dGLqutPnLBeGpQctZWHT3ZdwFEdOkyU4F+io8nBL3OVdU1Tth
	+Ji/aJiklGgGiu3MfmosBAcG7RAQ/ojH3yBJTKPeIBADqYmZ+LZEJY7MdJawXRm43sMxYThef3K
	nuj/CuFVKevD0IRR9Xht1ygEB/lMwR4XhVwZvhVgw2gY5kH90V5JoV1DIPuaoHKEi2LSqVevMnq
	mV3UUmOMOCPmAb9H4JZDb55XYr57LQV1ifcClfCtjsoI62jWgDtugSNg87ESWMy/egnXI=
X-Received: by 2002:ad4:5be3:0:b0:894:7d25:d6ba with SMTP id 6a1803df08f44-894e9f40675mr182162476d6.6.1770067888668;
        Mon, 02 Feb 2026 13:31:28 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d37420c5sm121174056d6.31.2026.02.02.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:31:28 -0800 (PST)
Message-ID: <33cb662c718507c6ac747af4a9a3f5af10fcf5a5.camel@gmail.com>
Subject: Re: [PATCH] ASoC: sophgo: fix 64-bit division build failure
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, "Anton D. Stavinskii"
 <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 02 Feb 2026 22:31:24 +0100
In-Reply-To: <20260202095323.1233553-1-arnd@kernel.org>
References: <20260202095323.1233553-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Arnd!

On Mon, 2026-02-02 at 10:53 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which

3 of the 4 divisors are actually a power of two, so it would be a bug
in the compiler to issue a division for them...

Regarding the 64 bits: seems that the actual issue is the tmp variable that
is of u64 type for no reason, because priv->mclk_rate is only u32.

Maybe turning tmp into a u32 would avoid unnecessary 64-bit division
altogether?

> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:
>=20
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko=
] undefined!
>=20
> Consolidate those into a single division using the div_u64() macro.
>=20
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0sound/soc/sophgo/cv1800b-sound-adc.c | 7 ++-----
> =C2=A01 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv18=
00b-sound-adc.c
> index 794030b713e9..b66761156b99 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -105,11 +105,8 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pr=
iv *priv, unsigned int rate)
> =C2=A0	if (!priv->mclk_rate || !rate)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	tmp =3D priv->mclk_rate;
> -	tmp /=3D CV1800B_RXADC_WORD_LEN;
> -	tmp /=3D CV1800B_RXADC_CHANNELS;
> -	tmp /=3D rate;
> -	tmp /=3D 2;
> +	tmp =3D div_u64(priv->mclk_rate, CV1800B_RXADC_WORD_LEN *
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CV1800B_RXADC_CHANNELS * rate * 2);
> =C2=A0
> =C2=A0	if (!tmp) {
> =C2=A0		dev_err(priv->dev, "computed BCLK divider is zero\n");

--=20
Alexander Sverdlin.
