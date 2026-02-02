Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A731AA80
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069885; cv=none; b=htVBUteeXCTkdZnEQrgQCF9KwYyVMfF2jZJer6qeMqsnGw/nsADLPVhMnvIfzBRSmT90VKNATb5LfLs+NNKh8c9ZbzWPZNfE1jtfA9V+kFzQSakbR8k21iQNNx+mSFTZJNtq+xRLaJGJB6vwLdGUabbJFI/KWAyHi3AQO0e7MwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069885; c=relaxed/simple;
	bh=7VykqEqHfUn5733n2KE5/tx5n0O8ya9OVk/KKprmhC8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3lXFlknOiQbyW4DwUUgmdp9jLsHqQkjgVuaJk5fCxhiKkYbny6dKuZE34lFftv28+41isA5tEsSiUkYaOlCqM2z9pMVVTbWrzlWAdDQDqUJw6qPcMYvgOoOal5irAMTMwwQzDjEIM8PGntNJUHFETsk+MjcQHLD/sbo+njI6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc7xlTtz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc7xlTtz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so36629435e9.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770069882; x=1770674682; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IFLZ+5GxWIPwp0hW4yiKz6XiBiZeFbJ7SQBypDoy+TQ=;
        b=Hc7xlTtzzPTujrUqIFSdL5ISJlN2PRSIbmoH1DiGwt7TkOpx80E3BTtXVpqYw/YnmZ
         FknldoRq/YC9cB5r6x4ci3kFDKDoPe0MB97GXbZa/7nburMxWCA0w8i0Z9z5IMw3SeBE
         kzc/psU3PK9Md9e3Ybh6O5w4yxcEJcZ6/ob2I+s3XmR9+BRZ6UroLhDtfRex8wrIL12z
         klwZc9VEyOC51xN8DtjTSo2zGeFZ7jBMXLlaiZ0Oto9xrxe8m2txLukmdNYHbZUoNwZH
         czOwHb1bI+9fov282TBnNa/FGBFdNQ6a04j7XhpNOZo+WVc0txrilwcNToWLZxeHWp1V
         1Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770069882; x=1770674682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFLZ+5GxWIPwp0hW4yiKz6XiBiZeFbJ7SQBypDoy+TQ=;
        b=VKutOvINilIQRdHdOqjn+fVMq81ZmEZSHl14gYXbsGFP+7M1vkBc5UEMlsGC2T///j
         olk1o/g0Luw4N+7VT14qu6YrF6XRJeIpx+T1kt/PedWLqByJPaEu1X5Q5u4QuU3NsKqK
         UBFVxqHgRxIxH42ZEBO+CWlgNQYzpafRszY/6v2jIVSnOaOofPH2cFRiHmijhA9vYMEr
         zVtmnlH7baYHrtmiDtGmfzioNjQjmgNdxfvU08oaXxgevbKmuZrPYouMgKfMKjtxdD66
         HcTKQQbNWhW6h2Dt5zeO1U3Fy8MPIejVGqVFGaARYrOn2p3n+Ocf+W/aPnJQ9GAgQmuK
         v4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5gzMMeamWwu3vkFBWTOQXz1EUNKq7CpgQMeOU+LhSGz+X1co0Zs0CX3rkyWsvqUkes2besHqvfUj7iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGTqXAd0+SGt5AsxsdwyHGZOpZ8wQu3NuP3Sc7NSSQaVTXl+t
	0NHv4g8hS6ucoIyW0jedKWn8THxaMvt1HabpTTWpf9zS8+JpbYl+xbrZ
X-Gm-Gg: AZuq6aLTbDb1EVQ7nZeiG141r+Tt+jjVSamRWUQa/ujwnxD9w2dSMov9IGrt1tHQpVK
	3nWhBwtKGMTTbG52noQ/4vnM92YrD7yf0RGGXn1FiKYU+YxlwmqHrPhMjFfqMoeD4M8Ntq5B/EE
	oSjpkaTgBRiNP0t8CYLen2iDRB+0O7yV6x2q9hIYhvv7yuFHKa6xlmAf+8k5nyJCOBOUKdLWXoV
	9lNsNL6x+MbTrAIgypxHhOFYwj78t0paGw0Vas951HMu8JguW/GRi5tqRrTh/mdfSfU8iStveH9
	40LlVeJVza/BGcaO4ewVKlBRgTda5cYum3z/vZFeAF86tVGO/lM4vpLawyxKPYZNytVFygD2VgM
	Rc8d6xKEIpoU3nLj3E+AiPlWc8rQhfCYs09tT4iOdEQoa+5uj/75RCrhS7QL1gqR9KfNaZEM8hH
	4Cp5yBrdOfwbxqE24oEKZR/MFsY6zi4Cko24lgHIQjknC7nYofuuEv0ziU/4q6v982HDQ=
X-Received: by 2002:a05:600c:3b23:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-482db49e871mr172494235e9.29.1770069882072;
        Mon, 02 Feb 2026 14:04:42 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm46189472f8f.14.2026.02.02.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:04:41 -0800 (PST)
Message-ID: <ac21f40fb56a8cc40c7716cb059b9acd0c0bcc5b.camel@gmail.com>
Subject: Re: [PATCH] [v2] ASoC: sophgo: fix 64-bit division build failure
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, "Anton D. Stavinskii"
 <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 02 Feb 2026 23:04:40 +0100
In-Reply-To: <20260202215956.2127414-1-arnd@kernel.org>
References: <20260202215956.2127414-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-02-02 at 22:59 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:
>=20
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko=
] undefined!
>=20
> As the input value is actually a 32-bit integer, just change the type
> of the temporary value as well.
>=20
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver=
")
> Suggested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0sound/soc/sophgo/cv1800b-sound-adc.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv18=
00b-sound-adc.c
> index 794030b713e9..de1c77014c2f 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -100,7 +100,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pri=
v *priv, unsigned int rate)
> =C2=A0{
> =C2=A0	u32 val;
> =C2=A0	u32 bclk_div;
> -	u64 tmp;
> +	u32 tmp;
> =C2=A0
> =C2=A0	if (!priv->mclk_rate || !rate)
> =C2=A0		return -EINVAL;
> @@ -117,7 +117,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pri=
v *priv, unsigned int rate)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (tmp > 256) {
> -		dev_err(priv->dev, "BCLK divider %llu out of range\n", tmp);
> +		dev_err(priv->dev, "BCLK divider %u out of range\n", tmp);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0

--=20
Alexander Sverdlin.
