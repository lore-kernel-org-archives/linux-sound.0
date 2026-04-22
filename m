Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE27155C82
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876752; cv=none; b=bmscmUwcxT16oABsCH3fp8um31fPhwkKuSABFJpQ13vpVraNhIJ6jYrOeqWYZ3tmeAdBgWlq15S9e3+6AXE8qEwU8uM3S5f6T5THG5aIstOcjl0nPpU9GPProCwo6rz3RVIj/4Ok5o9j21HPAEgsmjijv5sGeliQ3oYzvrVMjdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876752; c=relaxed/simple;
	bh=8Y59iye6shN2h2ExYDAoS5uJ/DiXNFIoe0CJbe4UL2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2iOnri8Ev9kxVYmwlLxnyTjRxrMlvlxOavL7LhM8tPFnlTSN8/wDowdW5DmFj+BQ2GHFOKwHz6S0czcAUk12BRvd4hc5zw/mQ6DyDHstcT1J8EefI/fo21V0V4jZ3Mgo8+ZeSTQPWlnPEF7vuwyVKd+ko4QNc4Gbkr8NaMZu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWO6rB4D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWO6rB4D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so70940085e9.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 09:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776876749; x=1777481549; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QC1aPcMtgTyeHUxuS7BcsFUrlf6XU6yrgahQmY8DnUI=;
        b=RWO6rB4D39j3LfrOHmsEqXtbjihKQmmJCszFNXa4WzHozBlsmKuJyEEIkr1okEHv+F
         ZKEiww8Dmf2lVNJbYejYcOqS9sPT+/IXbvg2iz6666wbvHVQW4pDDeNB3zKrzh6528o/
         ZCxGhRxmUXZKM3tVD+wWtlXcmj787Tg9dI+ub+ak6gDIVNEFO6mNAH4mFTpMMIKBmIaH
         z2puSEKPjo/jMxYXTSXz/4j4XtdYqh/0x1WKBU160sIwyD+K3WQ6A23qlQaKUmKLPTTJ
         HXJ34osq/pIPzjgyyR1VhlRHSQv65XgC29JtEKmOEsCV9WmAikYHQSU0rml0TN0XdLm2
         TTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776876749; x=1777481549;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC1aPcMtgTyeHUxuS7BcsFUrlf6XU6yrgahQmY8DnUI=;
        b=Z6F9vjszMkbGcqkvCpn/UrRL5bCIyTBaCTrSxFoiheT0Zou4x6AMdv3IIquRWBnEFI
         wqq8Mx/1G6wasC8owqz8AV1NkN13tA7E9X9DVI3uGcCumymQ31SalXg3QDA3hj0T0nB5
         g+m4cCYNTbiSlRuaOIVwnZOscpSKA6wie3YEUjzsTXCkWpHD8VCVvgA5XFwqW90ZtRdu
         Hri6O4KUteBSEgv3fmwzhfuSvBc5H6tGhKPVJI1JZx+lhzhNn/9pofHV9U5sohfHWnlW
         vHibWcOEAJvSvDvhmU9O9zKSEZo+rqdrbGdvJgF4Dp7eF/oxdzxSC5vkQvCqVWLqAOAQ
         6cYw==
X-Forwarded-Encrypted: i=1; AFNElJ9Dc2zfBW/OcdOw5cVgMfsRSvrUmrFaSwkc8yGGRsLC5A6z/k6UgSCxNdTAvSGjuWbRehTzQI0gJd47sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoT2I0pfnfUMEsDUqmKR2zUbw3gIelDGox9OXnJ21sUUStlvvW
	rU0F6xaqmVlGKjJXrjaNIxHH0dIxhJbjMd8L3au3hreO0HqrjzJsbAeW
X-Gm-Gg: AeBDies9viBJKX7F/07EUKCsQRAyUTHKGugcPaZe7dDWoiKx9Qv73zRY9RNzzpsbaBD
	amYhFCZhVKWzqEJoDotvH1lqGkvAT9Jp9Nm5nqtF/QKUMMcj4S/qVYRGFnGjti9C6V15b8xKzoz
	kCvfI/TPJ2eiFJNFOlGXeaQ7Cj6k2MyLMbR68auAZ/Dbq/0vCesKvXsHZtqL9lE9mq9MQzRh3mv
	55cPiP/IHW+AsIeHE1/IJBO7/QYE4F26tUGgZUiRnyue/pGR4fBqkDqYijCQdZPAKLX0qzVSDyI
	haY4sXKzL510kf/uf/P6/hGIaYi0Bm9i0FNyWO5SJ7gyhYTn6XFk8gxGzgWLcZDK9TAKgREoemM
	eCGC+uaN3MX4CqQmS18qVzsXAkfILQ7VHZEOkG8Bx5Onv0HKmZPIoowodyiB5DHWzZW4oe0W7T3
	tDZLa9bc8eBMxO7e1+9NU8WUTxv+VX6Sr4m8xRl0KmYivec/Gur1m22I9OCTJfgKSsqukGp70D/
	8E0sMXIFVbQ5NtJ0yNFV75FSV6f
X-Received: by 2002:a05:600c:4f92:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a0f18edf7mr156979345e9.24.1776876749281;
        Wed, 22 Apr 2026 09:52:29 -0700 (PDT)
Received: from dell.localnet (2a01-114f-4a05-91c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4a05:91c0::540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm327788705e9.1.2026.04.22.09.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:52:28 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Subject:
 Re: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
Date: Wed, 22 Apr 2026 18:52:23 +0200
Message-ID: <Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
In-Reply-To: <b7fb5a68-89df-46a9-8f78-e57c6ab093d3@sirena.org.uk>
References:
 <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
 <87h5p3k8jp.wl-kuninori.morimoto.gx@renesas.com>
 <b7fb5a68-89df-46a9-8f78-e57c6ab093d3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartdThynCBpQi2ye-i0aGtNlg";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPartdThynCBpQi2ye-i0aGtNlg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Wed, 22 Apr 2026 18:52:23 +0200
Message-ID: <Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
In-Reply-To: <b7fb5a68-89df-46a9-8f78-e57c6ab093d3@sirena.org.uk>
MIME-Version: 1.0

Hi Mark,

On Wednesday, 22 April 2026 14:31:28 CEST Mark Brown wrote:
> On Wed, Apr 22, 2026 at 02:55:54AM +0000, Kuninori Morimoto wrote:
> 
> > @@ -280,14 +280,14 @@ static int cx81801_open(struct tty_struct *tty)
> >  {
> >  	int ret;
> >  
> > -	if (!cx20442_codec)
> > +	if (!cx20442_codec.component)
> >  		return -ENODEV;
> >  
> >  	/*
> >  	 * Pass the codec structure pointer for use by other ldisc callbacks,
> >  	 * both the card and the codec specific parts.
> >  	 */
> > -	tty->disc_data = cx20442_codec;
> > +	tty->disc_data = &cx20442_codec;
> >  
> >  	ret = v253_ops.open(tty);
> >  
> 
> We need an update in _close() as well, that's getting the component from
> disc_data.

Thanks for spotting this.  We should now get the component from 
cx20442_codec.component in _close(), as we do in _receive(), and return if 
(tty->disc_data != &cx20442_codec), maybe also WARN_ON(), or even BUG_ON().  
Sorry for missing that.

Kuninori, will you take care yourself, or do you prefer me to send a fixed 
version?

Thanks,
Janusz

> 


--nextPartdThynCBpQi2ye-i0aGtNlg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmno/McACgkQ2WqSnlts
jBqrdggAhwI0Uc496H+pj+KbQtexBnhQIfenaE2OuKHX796p3sXh4hKB5XO+Sszo
TizELnC4Hls+mo3BSYAKWweQuVhn10ETjLMUJUXgvnZ0AyiFuNRPFO7VYt23dtUO
/Bx6FGKTpNiPPVAjXaaA/5G3wysvTh2pwmhU5jPPO0yKX1fQmQvNMGKsjQtmxWmO
w9Nh4M5mGWCUZfgKJKVtwDTXy0teC+3RJ4tQvGRKy8GVloIKrcunVIeoT+2F/ukl
hVr41zi09/ACgnu1GxIlU4385/h6Db4vZXz6wOKF0CLjFLwvnsSaWXnxIU5X8zUn
2MVbVD6sQOyRDyU/ZwqJzc3VYK18/w==
=z50k
-----END PGP SIGNATURE-----

--nextPartdThynCBpQi2ye-i0aGtNlg--



