Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9252DEA62
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517427; cv=none; b=u/8v7199f+FPUwb8hyYpVDmwzup9HG2JbCejLsAsPIpV/H/ln7GgLwML01TszQ3JTJGOq9ddU9QK5+M8ZTY1bi3QGwGY6Io39DDUNUJVCne1czhl+leheTdj7WlOhbeFpDMUP9tehVBY3XbETdjLRbXAXkAffO7m8VNL1Lv6SwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517427; c=relaxed/simple;
	bh=uTuWHU0/mS7QCa009M7sJ2U1fwtgolGh28oWCe96Pzc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hrAmSrHjr24PmqxC0C1c8qCr7PgIvQYVCklVSivczPz3Ao6Nzfkf9+73pG1Z93AZ21Rjn7J7oSDv5fzyef7Q1F8aJClBl8ZHEVjxNvTIZsxUS0+o9Y8eMln9QhCnPI/MCT5p0yL906ef5/CdIbZs+2AI8IDgdBySGg+/eiVgXMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+KZHCAg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+KZHCAg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso5939585e9.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517424; x=1775122224; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lgpy0rMDQXSEL58zWKZy7vdPmCgC5U02uB1vUpHGOh8=;
        b=F+KZHCAgnxFODoffcYPSlQkYWbWJKkomXf8sPeqJPQ+1d0OJNsGE3RER9hhusL0eNA
         DsAHjp2G8YYeX6xuylS8A9OjEtub/SVJyg0fTnmmGt4ldLEBmsuoYRJBCpdYH+WKaC63
         SlFrTbTT+hpVQVjswaiFCSzhJA2a4tEXqRjrT4BDtNUKywN6BOp/z/3OqxdFJk/EBi8y
         K47KLqI4yt03CPN0Q72IbOypl+6QNoFLJAuGCqTUXxJiWXHfq1hHfLUpgVzAYlgSNe85
         UeARXnpmBIGxfyGUjzuJfr0CKuMnuXs40nfBxk5rak14HH8BGUIZx6fkRtv4VaedTGCW
         HREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517424; x=1775122224;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgpy0rMDQXSEL58zWKZy7vdPmCgC5U02uB1vUpHGOh8=;
        b=bFrKk7QZUpoVRqmqwHYh3iCMByEe5PQ5ddc3/8CurJQ+l2gBt1zdlDmus31Sp1tQZU
         nc3TfwC0q0axvWhBOgTzpUXFXKqSG2yCdb5C/hL28bgwtzlohufSXOhiUDEciWQd46mr
         ISPJKNtZBDQrbuhIaXWwFuJhLQU1gm9h5w/L6lralNQoH6BPQuNQkUPvLhrUlNHVwoq1
         uWqst4i3T/Pc7kNVMkpbwsTNS1Oob8amZ9kk9VgTZjt+Rpc96ji/lsrX5nvfDmu4qpDu
         1jJkiuX+3fbVjeamjwRwlKqhQWNHEbwToVgGP7wjywT0HwU0CBxgwOYzp3FJKdjB1ztk
         GxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5DamyoVYUo4oIVHCbbc6MQsE1ZhArc0+ZfPJPIV6i1HUA7z/JPpGX1mw980yyKV9OIgzPsryh1jHNUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJF1oU5Z7D1x8VnPtx1EuPSsu8IPi5D2g7NndTRvBXhe88iNt
	Wihbg98RaYdeACuoEgix6BQuc2NeD9g2ZN/MXixkd6ixfXH6BCyIkrQU
X-Gm-Gg: ATEYQzzqHo0VTtMkSHjXbUgLPPhNeVx/YBcx7f+vDKjTSPgqeOR+EYClBb+VASGhjSG
	h/+91Rmh31PEekhcR2SwWcTTmcgv/5jAqt+PoGAJA453e+OJqXd0sVFazRNse9uHJDQZmeh5Eod
	N2giirupRT+JEBcynw7WS66ecLcFl4ivFxMXTpP5UYqwjzxFUEOU3BQPH2VW3T6ipqKsoem/YG2
	0gi5k8LyR1fWOqCKXFlMo5LmrEcr8xHPbxKgvJ1LiE1NaSwGN7scxjKAWJxhD0XBaG9N5oCY9v7
	eATcBsn3eYhBgkVgP/Zbu3LEJ6Pl/ObB7ivhllDNrPmdOAJlqgtToA1QhfMzuUQZvWgPNJuYM17
	MkuTbfDIQnAzUToIr0WodmH48GzzFmvxBLFp2V/TfC3tAq7emM3ewyXxdM+0SIVMCGT/aACUtrg
	JLPXCtl71I+kt1V+MZ1bflr+M3OuK8hYY=
X-Received: by 2002:a05:600c:1f12:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-48716050758mr95520865e9.25.1774517423981;
        Thu, 26 Mar 2026 02:30:23 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm33939045e9.1.2026.03.26.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:23 -0700 (PDT)
Message-ID: <0e89c8c2b5851211b2c1f2dc413e6775ab46364b.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: adau1372: Fix clock leak on PLL lock
 failure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, lars@metafoo.de, 
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 09:31:10 +0000
In-Reply-To: <20260325210704.76847-3-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
	 <20260325210704.76847-3-jihed.chaibi.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 22:07 +0100, Jihed Chaibi wrote:
> adau1372_enable_pll() was a void function that logged a dev_err() on
> PLL lock timeout but did not propagate the error. As a result,
> adau1372_set_power() would continue with adau1372->enabled set to true
> despite the PLL being unlocked, and the mclk left enabled with no
> corresponding disable on the error path.
>=20
> Convert adau1372_enable_pll() to return int, using -ETIMEDOUT on lock
> timeout and propagating regmap errors directly. In adau1372_set_power(),
> check the return value and unwind in reverse order: restore regcache to
> cache-only mode, reassert GPIO power-down, and disable the clock before
> returning the error.
>=20
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---

Also deserves a Fixes tag IMO.

> Changes in v2:
> - Also unwind regcache and GPIO power-down state on PLL lock failure,
> =C2=A0 as noted by Mark Brown.
>=20
> =C2=A0sound/soc/codecs/adau1372.c | 17 ++++++++++++++---
> =C2=A01 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
> index 6345342218d6..e3eba241bdf7 100644
> --- a/sound/soc/codecs/adau1372.c
> +++ b/sound/soc/codecs/adau1372.c
> @@ -762,7 +762,7 @@ static int adau1372_startup(struct snd_pcm_substream =
*substream, struct
> snd_soc_
> =C2=A0	return 0;
> =C2=A0}
>=20
> -static void adau1372_enable_pll(struct adau1372 *adau1372)
> +static int adau1372_enable_pll(struct adau1372 *adau1372)
> =C2=A0{
> =C2=A0	unsigned int val, timeout =3D 0;
> =C2=A0	int ret;
> @@ -778,8 +778,12 @@ static void adau1372_enable_pll(struct adau1372 *ada=
u1372)
> =C2=A0		timeout++;
> =C2=A0	} while (!(val & 1) && timeout < 3);
>=20
> -	if (ret < 0 || !(val & 1))
> +	if (ret < 0 || !(val & 1)) {
> =C2=A0		dev_err(adau1372->dev, "Failed to lock PLL\n");
> +		return ret < 0 ? ret : -ETIMEDOUT;
> +	}
> +
> +	return 0;
> =C2=A0}
>=20
> =C2=A0static int adau1372_set_power(struct adau1372 *adau1372, bool enabl=
e)
> @@ -807,7 +811,14 @@ static int adau1372_set_power(struct adau1372 *adau1=
372, bool enable)
> =C2=A0		 * accessed.
> =C2=A0		 */
> =C2=A0		if (adau1372->use_pll) {
> -			adau1372_enable_pll(adau1372);
> +			ret =3D adau1372_enable_pll(adau1372);
> +			if (ret) {
> +				regcache_cache_only(adau1372->regmap, true);
> +				if (adau1372->pd_gpio)
> +					gpiod_set_value(adau1372->pd_gpio, 1);
> +				clk_disable_unprepare(adau1372->mclk);
> +				return ret;
> +			}
> =C2=A0			clk_ctrl |=3D ADAU1372_CLK_CTRL_CLKSRC;
> =C2=A0		}
>=20
> --
> 2.47.3
