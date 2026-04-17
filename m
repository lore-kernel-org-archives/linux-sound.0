Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090E18871F
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432850; cv=none; b=ObsmkPhkcO/tMkrHE0NZaBqWxR6IfrKn236W3NfLeLYAYjlfm/OHxJR/y0mvx/S2BFAToNoRRhozVFXhC/2kikl8ThN4U1Uc7FcsEqXNW9qeZsHg0wCZ0+B3fxvcWYZ8+5rECv3W5SAOWVNw6vd0XCL28o0VCOprtON0nerMm50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432850; c=relaxed/simple;
	bh=JdRFtBf1aF4v4sSkchCdQI8qVbld3bKQGj6ayOgyt3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZyiZdKVKpu4qHhZo2doOSNiuEXE3hz2PXgRhZweTOrddoTFi2e/XUsoQ9LMOC0JcdydMeEK3WoZdI8ZCyYMdSARvYXHTgy/1dlUtdblGnGniIDdZnKZXFI5fLPajG1EQsflDieNgejdW6EbqCLv58r3o19Jhm0/Qu1OcYKTZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=eilDONDE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="eilDONDE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488c2690057so7079925e9.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776432847; x=1777037647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdRFtBf1aF4v4sSkchCdQI8qVbld3bKQGj6ayOgyt3A=;
        b=eilDONDE44tAJT4CFr8gyxv7UbyNE0Cs4WAHughxcBKkohsoUds0Ry5GtIQjb2ErRy
         O/m55qysG8YcSVHaL14Fkkq5irDNMdvZvEdIk3mDmBqGe3v2/2+HIIi9Iq4nAU0EYclu
         J8VW2FBgMNm/NnPzfxNZM8IXAsXfMA4PHhjj4JgSoFPu8/fmDXJH9zWH55m7XOXk8o9A
         zRJkC3xxojDXVNAzGJzBdQBIdnWZV5tSJ4LBF2kYGdCXDMk/tOJxdDQ4HiievKWS43gl
         upstP+w0uvKFJXrwIWXP5o3KHIwaX3M4DCT/QUZ3CZGtbLHrs7LhC95NwT7ruGDWjV5M
         t2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432847; x=1777037647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdRFtBf1aF4v4sSkchCdQI8qVbld3bKQGj6ayOgyt3A=;
        b=av4PZi5NyqyBB/QunpG2/lpxFolNV2sW3sk7rOBPd9Q4WxtsOLw4hxJySjPt9iMXoa
         5ynGTne/2eaYTpGOHi25azVSoqSldCXFzviG6De41MQro3oTcWkVYo/fyuYT031bDFzg
         XA0l5MWDHjOyDSi78FqkjP06fmajpdi1AFlO/i3DAFXIYmuGGhNUPGBXZs8HBEzBrOV4
         8zYkXqSGlNbfQGn0kLCMHd1idqTNOoD0mG6Dt2cMC4TrrYGRVCJZmn2u1kBHZ/Ae/fp6
         EGijNXxXhEGTJdLDSc/4eYkdmEbewDHVAlYXg4izGn14wnw7EbtcZT32WFdOenODltcz
         zcuA==
X-Forwarded-Encrypted: i=1; AFNElJ+m+swGJVgbCuS/obleRPzkrfwFhcRCzfbrp8x+tz6HYkHsnBAduPMew1O98SLb46czkvXFQcsT3Oi8TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw82oFplWGZHpiyhIYcHv0HfAFuTgS094fME6uWj5lVQnD8PY/9
	btxnchzwaFRfOv24DOyhMH9FGTSHivABBoaE+qtp0db8VPjZ4v7klgL9o8YMvH8LR68=
X-Gm-Gg: AeBDiev87DvHKfxPjOlE0V5UVQol0gW35sLIHaCQ068s6ojMFLUEk6BiWN9lSlCX+/H
	RyLacy8xt8A4ybtzREHZixj7Uo4ppdtiGejCspsYKXIOMVA+abKxszDZlGrGY/3/zq96N1vCs6x
	27JOzSQWPeiTTf740tXVNYsgSEMtgeLr9Nb89yjNsRK0fMSzBrs5lw/3i3YCslV0/rDtmkpm4/8
	gdifw/LiV+UWU+85Y+L3GOS34iUhHIM2UfdEv1bV12LUBpAxW8aLqJkufsxy51M+JfLcYHsl/8I
	GG5J+vnSgOeab2Wa0x2sjrVT2HfQzp8qXIgFj/yhyTy3zI/wsptYan72c50g3cshNnxtwL1SxUC
	SFF410UlxbknnwFVKlDxZHPQvkGCVCUMtrSwhKccv3zM9X3j3kTmFdwNGBxmBVhpIZnRM1XD5lQ
	Z53NYDs8SDrV/izs9xcs9E9oGUyPQI5zHWvw2PmgRbm/FuJLpF1Dv3/fIepJJpASyZCYApkE1Pd
	KEVd1ZXS1B1RfbGuOX2FRJS
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr32626255e9.2.1776432847288;
        Fri, 17 Apr 2026 06:34:07 -0700 (PDT)
Received: from localhost (p200300f65f20eb08db61cfc60d8aa232.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:db61:cfc6:d8a:a232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fc1001bdsm75797715e9.6.2026.04.17.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:34:06 -0700 (PDT)
Date: Fri, 17 Apr 2026 15:34:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Jian <lazycat-xiao@foxmail.com>
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
	loongarch@vger.kernel.org, chenhuacai@loongson.cn, zhoubinbin@loongson.cn, jeffbai@aosc.io, 
	stable@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Zhang Yi <zhangyi@everest-semi.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alexandru Ardelean <aardelean@deviqon.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get
 clock
Message-ID: <aeI1_C5WGY5SzzcD@monoceros>
References: <tencent_7C78374FB9F4B3A37101E5C719715D8BC40A@qq.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rel25duqhphg3sr5"
Content-Disposition: inline
In-Reply-To: <tencent_7C78374FB9F4B3A37101E5C719715D8BC40A@qq.com>


--rel25duqhphg3sr5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get
 clock
MIME-Version: 1.0

Hello,

On Fri, Apr 17, 2026 at 06:53:14PM +0800, Li Jian wrote:
> When enabling ES8390 via ACPI description, es8389 would fail to
> obtain a clock source, causing the driver to fail to initialize.
> This was not an issue with older kernels, but since commit
> abae8e57e49a ("clk: generalize devm_clk_get() a bit"),
> devm_clk_get() would return an error pointer when a clock source
> was not detected (instead of falling back to a static clock),
> causing the driver to fail early.
>=20
> Use devm_clk_get_optional() instead to return to the previous
> behaviour, allowing the use of a static clock source.
>=20
> Cc: stable@vger.kernel.org
> Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")

Are you sure you identified the breaking commit correctly? I intended
the patch not to introduce any semantic change, and even with your claim
I don't spot the issue in abae8e57e49a.

Best regards
Uwe

--rel25duqhphg3sr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmniNsoACgkQj4D7WH0S
/k7OLwgAla3lc6UEHKZ8FPKaBwDVX2b3xJqRfuPoZ1dDnhKkWZVmCIKx4ElIYb6B
kFUtzSnUdO8JkeM7hAXAOXICBTWuI4KS3yqXUCh9zIY1ZVUfWsA0zytSpqC6x0MN
4jQFKKXFv2zgtP0CKbYOGIkeYGnqmQCA+WtzbJTRX+Psnjcf1GP1U2bOfqFbyYSV
U0lwQNh43b6guht4Afy8bOtdAwXQjFTcZ2zxkvFukkClo05/oHJwj+rLaEEwXAHT
xz7l+6jVjoOZsmTPcpZfmj5KxQ4svXht7CHzM92HZ2ScAV/oJ+oJHy/TZIdVKe/m
dTynrK4A/qe0QJMt7tXSjm/kqmmcUw==
=cuEg
-----END PGP SIGNATURE-----

--rel25duqhphg3sr5--
