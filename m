Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DCE31ED7D
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517209; cv=none; b=o/aJdU8gmF+JRZBYqo/pHZIa17ADoO7wgpZaencVLHbjTYjTffJl+g5YmPlC283pSmAno06Tmfb74mQE+U07ZX2S+FzbgxCst/IUMb0jYnU6hpoZ96SutvD46S9uyf0dKYm3hFRXQd+rbgdlGHu2bGYQtht0Ui/k4duWvXXVk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517209; c=relaxed/simple;
	bh=OUzLmFzLdtqn6toY9gE/vHJuOBtPUAMy7RuzEYncojY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aAKmWv/Lew1PmTgZrgCr4wwPRlzM7r6sL4fJ4fkVhIUkWU89C7gIqpTA8UAsSOJVjChzIE94vVyChMKKHvmYyeN46KZ3OKgkEkINpwF/FgiUp1LMqr5WPYPG+ZAee/1QnlMhjzQopO/olvc0i1sOy2ApjCPaZn8dnWqzUVsk30U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWRD2va7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWRD2va7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48538c5956bso6144115e9.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517206; x=1775122006; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5VZQLyr2Zs/DHt8a/lxVm8geb6FXpQc4akpYKRz2DvM=;
        b=ZWRD2va7EdCn36B0mfVuy5E6nP367SgWRemb2FElJxXxEonXWWEPPXjGSKIjnhW5S9
         HkGGXbAbHvp0lNQkAX7UUBBvCvE1BFh0wRk6tZDyRbdoGrFql3NP4o4KEyFEnuGFZ1mi
         YA8YKrLluE2uiNA+cPrLShH+Y/pzmBvI9dDTkdZiy/yKEFqnjgtLE3W8rbilgnKkg+fj
         4ywr77B/A09Um6MlmPAgOhJq7EfCVOJmNcBJ5cA6a/kbEyI2FqDm7ld0nc6ggsyfbGcK
         dDVsGD1ieTcnygDFyxmx/lrJZBqnWQ+dY7SkAwOMpIetqYb5ZKuWVWqFuffq+Tm4YVku
         4+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517206; x=1775122006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VZQLyr2Zs/DHt8a/lxVm8geb6FXpQc4akpYKRz2DvM=;
        b=tLgXzWlsnSkMYvhcGAX0alOuObTUhyu/bgBpA3u2tjqzWkbPuIZpBWVAOelxraN/lW
         /Ds+qDuQFYM5FXDt5ombR8l46EstYRZJwTmHs+tUQ6lHxGPI9WkoOsdtUKTMuNwREy4U
         FF8/bHkDR5ubl/Mh2en4xNZwxdXbNLB9TsgcYlE0sBE6YL+fv/CpdgcwR4QlKinRVU0E
         os3a2TWhI+zvtuzR3e4XVBqA8EqqdzJTOXrznJLThNWd8cSaon/Wxaa0n3/qWqSqAPPW
         FiFP+OkQTy7qj0qwxc/HbFpWQeeP+BczcNSDu1135CGgMMDgAQpZ+J2B57Q+qI2eShG2
         HrJw==
X-Forwarded-Encrypted: i=1; AJvYcCWvgij+rS8/IipfUo8EMVWWMZCdyzHorg/p312aUZXJPljIE2gNE8SJO8YgxyadRjZdM27il8Rw9u+oRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfD9x41F0UK7nT4hEm/XMJbnxCJmI25CCZyPvQXB3k7ZS9R8M
	QCL0u5cnf8LZIJvPiMGsheNYDXWXv/e22YmA7/6JdnNgebb5eTgx9O9E
X-Gm-Gg: ATEYQzxRUPli9/eLN6/l5dzgQmlrgb1eobzzWUrcTV5ob3+efCZve/3eglhT45P/8k3
	QNCf5ixW5lCn/s2ZF5HiYsvEHz3tuy6GZpM5J84N33D4FG2FePvSCUCnG1xW40mA3EavUPaqTSA
	KgueNF1ugHr6QDe0KBnWq4cwP69T6y2uR43mIQ51bvMgWrlcGYseabvUd6A7ahWIGlVrLJocxId
	Om9+Ca2Ed6Xzu9jkkI7trODsZQ9RKlrphS07eyTWBwwb1BvL+9G5A2V+G9OPHZZarR6zAttotza
	ePbGXuiQ6w4H88jMgnVoBg/TpBe3+Z7Pw4poa59trptJqBbBrxeKT5cqvJB9t7wP/sgZCMspTJA
	RUxPl9a3r4Io2JBkNg1x6XMsKxkKjE/BPlD27tt1vxc1TpnWXTttQRuM9hPefL3QWEziCdfHn4s
	khZg/dA+RPEqZq+ydrZ9lP+goFIgFrRlQ=
X-Received: by 2002:a05:600c:2d82:b0:487:467:49e9 with SMTP id 5b1f17b1804b1-48722b92fcfmr8738135e9.7.1774517206222;
        Thu, 26 Mar 2026 02:26:46 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm6033900f8f.35.2026.03.26.02.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:26:46 -0700 (PDT)
Message-ID: <67b84d7381662363a300fc108d8111d777489a50.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: adau1372: Fix unchecked
 clk_prepare_enable() return value
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, lars@metafoo.de, 
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 09:27:32 +0000
In-Reply-To: <20260325210704.76847-2-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
	 <20260325210704.76847-2-jihed.chaibi.dev@gmail.com>
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
> adau1372_set_power() calls clk_prepare_enable() but discards the return
> value. If the clock enable fails, the driver proceeds to access registers
> on unpowered hardware, potentially causing silent corruption.
>=20
> Make adau1372_set_power() return int and propagate the error from
> clk_prepare_enable(). Update adau1372_set_bias_level() to return the
> error directly for the STANDBY and OFF cases.
>=20
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---

No Fixes tag?

- Nuno S=C3=A1

> Changes in v2:
> - No changes.
>=20
> =C2=A0sound/soc/codecs/adau1372.c | 17 ++++++++++-------
> =C2=A01 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
> index fdee689cae53..6345342218d6 100644
> --- a/sound/soc/codecs/adau1372.c
> +++ b/sound/soc/codecs/adau1372.c
> @@ -782,15 +782,18 @@ static void adau1372_enable_pll(struct adau1372 *ad=
au1372)
> =C2=A0		dev_err(adau1372->dev, "Failed to lock PLL\n");
> =C2=A0}
>=20
> -static void adau1372_set_power(struct adau1372 *adau1372, bool enable)
> +static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
> =C2=A0{
> =C2=A0	if (adau1372->enabled =3D=3D enable)
> -		return;
> +		return 0;
>=20
> =C2=A0	if (enable) {
> =C2=A0		unsigned int clk_ctrl =3D ADAU1372_CLK_CTRL_MCLK_EN;
> +		int ret;
>=20
> -		clk_prepare_enable(adau1372->mclk);
> +		ret =3D clk_prepare_enable(adau1372->mclk);
> +		if (ret)
> +			return ret;
> =C2=A0		if (adau1372->pd_gpio)
> =C2=A0			gpiod_set_value(adau1372->pd_gpio, 0);
>=20
> @@ -829,6 +832,8 @@ static void adau1372_set_power(struct adau1372 *adau1=
372, bool enable)
> =C2=A0	}
>=20
> =C2=A0	adau1372->enabled =3D enable;
> +
> +	return 0;
> =C2=A0}
>=20
> =C2=A0static int adau1372_set_bias_level(struct snd_soc_component *compon=
ent,
> @@ -842,11 +847,9 @@ static int adau1372_set_bias_level(struct snd_soc_co=
mponent *component,
> =C2=A0	case SND_SOC_BIAS_PREPARE:
> =C2=A0		break;
> =C2=A0	case SND_SOC_BIAS_STANDBY:
> -		adau1372_set_power(adau1372, true);
> -		break;
> +		return adau1372_set_power(adau1372, true);
> =C2=A0	case SND_SOC_BIAS_OFF:
> -		adau1372_set_power(adau1372, false);
> -		break;
> +		return adau1372_set_power(adau1372, false);
> =C2=A0	}
>=20
> =C2=A0	return 0;
> --
> 2.47.3
