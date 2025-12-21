Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA72FF176
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331817; cv=none; b=Jo5bwOgGAkB122yrO2qCgEcPSiaLtBZ38zKloELcAW48ulWXcfR5zuoD+mzas5eyP468x5kNZgxTSd5Xb6bh9ZPj/e3RzzYMxqVaXDp4TD1OkoMhEZfmRMT0wMjqxmdqXCQgcB4VKreGJ0YjtFrVcpOzYhetGvdBgOHgRpn38ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331817; c=relaxed/simple;
	bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6EJR8VLHUuq7C0AC0vAeX6N/x+RKeV/sy494jWotKcWYN5E2snqLFVXLk42Grf1lHLOCyUt4hI3/j1+7TbUSngiySgzcKy/bk4yZT/x1yQDTpLbcBFOHbe7lkFShNOEYxQZwAlNfZHwQJijQx8wNTrYwSrRv5uu2Gfg6AOT+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCL1tGPS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCL1tGPS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so31445125e9.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766331814; x=1766936614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
        b=gCL1tGPSOEGFfLO1A5P8yelsq5DRVdhcRYLO+vTrZA/CLcRIqDOoUEH1A/Gx/b0I0Z
         xFv7BvZ3bBsrEoAnh96h5IM86f8Q4AWyycIAqakhISNieUUttNLuF1RiGsqnknrKhzy3
         0ZKEJbTcGWpzewhaW3Zytp45T0yJq4rFy9J4fDLYqiZFkaNpWS3oiUddnRGpA0u6ibJJ
         l5jRJa+bMMLZjOyCnMlqeFsyYeKMOG+YxcgvWn3iiUvaY2wfREJdJkRbZBfMaSDByLIB
         pM+XVLF587UQEirVkMHUN5K5IBYLBnscvGarnbxY8FNrJGrDhCZATpTNja1tyFZ4cXjO
         c8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766331814; x=1766936614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
        b=igYMF7mvV1MRyjnNn2sejtGID2oBZnx4Pt3/pRyK64cSlheDk5kDOfGJp8vGQiYk9S
         lsXey9PZEjkMlc6bGyiSKVr4ZLHTjKeAq/VCnL/DVoi/FK2JiajkMiDsViVIZjm9SQOf
         if0nC8Mst2N+D47glw6fDNyv3wd4N/S7gX0/I0fg8OZ9sHOKLZEVZO4xGmuQjlPrFSfi
         5vIo7jUvzP1VV8KEFsxDFu0KjgfKKlZB5w7vo/FuLkiIZQZrxJDEm0rV60STd4eNB3bV
         Jx2UZdHuW6Cz2au51T2wzPnGc1NyiHzTwZnfU7JfuHpNXzJnP8NeFMntHYP5sKF3uDrt
         eRxA==
X-Forwarded-Encrypted: i=1; AJvYcCWMLP0NrMiSw+7J7lvNaQiBvqg/a3rFkqljr2NqoiK+7IElNJwopL/bUZTboovC5ZOtml/Ij4e1EAyh8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5gEpNVs8U8/us0muH+XWQNB0OxNneUqiZd+M9GIsbUT9+lJY
	hoyQINbqAAHzeJaafHZeYG/qPISEWKcGRt0/ZywowSc/zEBGXRrI8t38
X-Gm-Gg: AY/fxX4edoeVwe3Et0vbKVY/rs0OeKHD3OIyvGlsCipqg7+kT5Ms9M4Zuymw9fTnLvn
	TiWTl9Sq+GW1GCbAcQrBKKnWt8XhUuro7oiReLaiOPLe3IBpwH6v1Jm/kr6TInYLwg1heTQVnu5
	J8i2tUCFoz0Tlc6Gh8/5fCAK+JWrKjaq1joPx6P35jcPBWrPMl05KDcTGzdEEWDtROo5KCahLSU
	s3N42sle4aa/NokpViw7zZDanRl4uN9QjZH062/Mm0IAYCKkRNTcQzMEFChSCGBThYvrMqEiMXR
	4roH0QtgbxqO8Mjhc56btfXdn3McDwljy+AAa91+HHuwW9HCgQXbxgITM3OfkfevEVWKjdCrPC7
	dzIEIby8mVPxVnu8eDoX7087di/WDmNbMvIUpcP9p+4WV+hXqF2suLgGtiNT9RLihM8ncWzWdCo
	aQ0i5kmfkcOB3ESs7ZF0FBuis8M7eDIOgOIOgz4lMQaGwdqrL1M6eKx7uyFCCCFZtrQFYWxl9NS
	QRugFg=
X-Google-Smtp-Source: AGHT+IEBwnFXhESimii2eoD13Ic6GAaM5NuA2NKdA4x0hOMlJfw0tViVHDvLpEGwUQjvuTV+/VBLXA==
X-Received: by 2002:a05:600c:c0d2:20b0:47d:264e:b371 with SMTP id 5b1f17b1804b1-47d264eb6b0mr27356325e9.18.1766331813700;
        Sun, 21 Dec 2025 07:43:33 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm198475265e9.14.2025.12.21.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:43:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject:
 Re: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for
 sun4i_spdif_quirks
Date: Sun, 21 Dec 2025 16:43:32 +0100
Message-ID: <5062608.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251221035715.1722584-1-wens@kernel.org>
References: <20251221035715.1722584-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 04:57:13 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
> the structure was not expanded to match. This ends up causing a warning
> when the documents are built.
>=20
> Add the missing fields.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202503060947.QKUUR62l-lkp@i=
ntel.com/
> Fixes: 0a2319308de8 ("ASoC: sun4i-spdif: Add clock multiplier settings")
> Fixes: 4a5ac6cd05a7 ("ASoC: sun4i-spdif: Support SPDIF output on A523 fam=
ily")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


