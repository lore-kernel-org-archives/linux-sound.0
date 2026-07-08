Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540EB40913C
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502293; cv=pass; b=LCwgdCIiTFMavJXXLLPpGFGRVwfXt1tV6zAlbWRHbLMT3oNwrM48jaibv+LmNrv5qTGQ6HlIig7luv0vaVs6ZW+JpR3xVVCL/S7PNlXHRZgDWWZKkmp/8+zkoDTvMupwFpTSuWTbk+oVXul2LCkqD5eKMFt8SG2MdY4UvsbPHyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502293; c=relaxed/simple;
	bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUuLsP19Ws7aaRodvp3tUIJTXqcp1tPLYakDm6H8SfEnYy3kiAuJs6tdogJZRLsRArbDbrH1bcvvWKw74QE69wW4MUoQzIt+idZS/SzIxMljR0Oahr2w/ykCP+hwABMxf7XSKX4oWL/EPlRAaFFfzgo0UYV4WWozyCVtK171gI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvDXMmGN; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvDXMmGN"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so410941a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 02:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502291; cv=none;
        d=google.com; s=arc-20260327;
        b=HdQs3J0dyoizCKrSVFDcEHdGzdSdns3zbnZXS4QZQXsi07Uwq96YjQUBV4dSNqYSIA
         2nEW6LPLlyijkjD7eAYWcerFmQdWqOo1Ks6app9FmmuFK4OG9q0OB3VfXHIV7NUSGkqd
         iplGwofAD3zQSZRYD+C5w5ASUjjtkz5ApeOK736DhuAUfRtsVc9i+QLs8UiGlxF9zv5Y
         13Jz9LVZCaJDM0DB0AFw8KEGVi4Uvs14VLvGiydiziDeiDsKPWO+Y/C4Aj8wh+HYUjDt
         7EWeIJwv35EKka6icYNU/empmwwUe5KtIBVme+ma9Oz2cZg7ooDuwosP+uWaxVYFqfKz
         cmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        fh=cWwDCU3wF2dI7NwDGrZv8tzS60iIn7WZjFz/UXobwLg=;
        b=PNy/nrrI+mYhlBcCq5O9GgLde1wRYSv7M3op95htPEgclTJbpPNM7h5i0t90Ck0dLH
         Wf22EP7uiVd8wZkhjk7uFyDFRvzksIth4riW0Q2lYRuLfwwvBSWbRRnXgtnzpxu4yeB4
         tsat9ZRwhexPHG0oaUKsrliAiDkKheCtpXN4905L3iXoZx11+OA3IYrAt8En6uHpX7mE
         6FXr1KIsf0/6trKrJPR2rOEB9y186lIiKWPCv5VkN5z5Xb9GUundbxCbZnRV4o+Sl16l
         k2AoR8JQZnvA6hoUsZit5zczsX2nGJdTxAYWySWFnwo++YhPQpovF6hbhuRnxfioQCei
         EKZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502291; x=1784107091; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=rvDXMmGNZY1e+58uOD5ERemBrxDQTTOSc0xkOi6uq2a+XsPj9Wae/62q+C+O82odF1
         xY3MwrkE4wElpBSKrZ9i2Ite6Xk9NScHMpu3y08DoLgIgupY3qBcYDmrbaZA1Ytuh9Qc
         Hynb2IceFJdcGtoCuuDw0Ztsxq4714wP2SlaRvDEshLPtACoSAPc7gYnm0V4YcEBohGu
         hPpwJxJN9kj65ndB+jah29Btj3Sg6a2NEIJifmljlmNCiviDFxU/+LOQuKToxt7mqb0p
         mMqRpVdjmf2jkWaNjfjI5TSLzBPKxcYAWBIjWVQtvm9nyQrlgN9Q8djvAm2a7BnSsz/F
         WDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502291; x=1784107091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=So+4w3GreVE4LwsJNsGeyQW9ECBWoeCs91UcRgkMZeKh9J0muf/azFs9V8mVqfr+Jb
         1LKsSbw0SL5pnocRENZTLxl6PXBTFsYkWxQrXCo5zNOouBDaeFaPwasEfXzEh/CktQnn
         Isej8x2SgBzSUTD5vLxCf+YphVhRnTLMqy08KkZVHS8T6SqsXV7fDdxg5PQfRUA8Nr5T
         wqV3ZrTTOAOJAju2LxhTQX6Sacj3Ka91CYOFp2WIJTBDD2V/Q2zMjj/ZObqiE70M8cTF
         qBefnkzOsAnBawHbFHz7lqmQHx20Jg2t4ejGiEEgPkvSIJnFapLSsOVP7P8whfC3exAH
         Q3Ag==
X-Forwarded-Encrypted: i=1; AHgh+Ro2NZ4899xIcjogQELfLDikfo/sIX80UfmEJx25MdQO/jxoBJ04ZKvnazvCauq2JRlHpEUoWVREZOtDCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvQZnToBAkr4qof5F+tdmJFRApE5J03HtrlsQxr9lBPnOYZFp
	qeIRtkcJW2rBuyzkgv5bQAuipTkd72aAapkor2ApNtVO6ehHY3p0lfXxNENYzchf2nCfKRQpSuE
	0Hg35vDoShfv6DGkLzlWXeGUZpANV8Fc=
X-Gm-Gg: AfdE7cl09JPV3yul1fAD2wnjw2HEOE4Am2lGVZUREL47Mg5bQo1JxCIfvuiCoYNrXnS
	mX0YpuFxYf/gQm3kNQxvZqF2YtmrGSrDLvm23W5+kbkoTs9z5s45qQDcTkrmv6CraM3zFuwfYgu
	vZEcFfC9DVUx0VP4KSOMasZCeozFPFp5M5banF4mSsq7lMlgq7KGbriLdu+6rI3qe2FmakhbHLL
	Ou0z15Cc5x7Oe5C8yvvE68JR8CT6+mLUwGBaiWfFgnfBPP4ORwybn/53iGUTJtfkK9AixIBIWJj
	zHqPhos8sYTMlNq2aJWuekL/iOAcWdNo5Jh3cg==
X-Received: by 2002:a17:90b:35c4:b0:387:e0bb:5804 with SMTP id
 98e67ed59e1d1-3894278dc04mr1516861a91.43.1783502291528; Wed, 08 Jul 2026
 02:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707051006.20058-1-phucduc.bui@gmail.com> <20260707051006.20058-25-phucduc.bui@gmail.com>
 <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
In-Reply-To: <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 8 Jul 2026 16:18:00 +0700
X-Gm-Features: AVVi8CeZIxoV1cGqNdJwk9FtpcwwUCuvjDdVhAa2LOP5pB8VlRjSPupFY0VCbos
Message-ID: <CAABR9nEz9Fa64u3zv+82YTNgToi38n8eQ0aT3NMRrpyBQMAqLw@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thanks for catching that.

>
> Apologies for just spotting this but the subject line is wrong,
> it says cs2072x not cx2072.
>

Since this is only a typo in the subject line,
should I resend just this patch, or would you prefer that I resend the
whole series?

Best regards,
Phuc
