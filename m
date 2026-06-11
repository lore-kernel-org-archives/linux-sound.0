Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0936F91F
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165442; cv=none; b=jJA0arxsuGdYZxlx5SyT244Obl2vt5DoluhuIGNMpflPslTETWy/OIScmEHfybZhwMVM7PEPn3RgRLA/9GAjVePTdKLVpIDtv7guY41iCSJbVkiD1/ZKNtzcodbO1ywfsz7EMnoN6KJ6x5TrrTbghaVZbGauWsl/FzKXOJBuH1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165442; c=relaxed/simple;
	bh=WDdNQ3xUq1znEbfuhWk0wt6rDGXzaK70N8vgyWplY6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ucIXSl8VGz6IUYn00OwzxcZFcIiXMphAO+pYD7i+YN7oZRjPIFszLsatrR4m3SHhbGtmWeTtcMFGGaH/ire1dCCedlYID3vjLJ5Kgmp0YWdoy7EMRLxS1UBnkuolsw1yL5GcEaib95T9AqIbi4Jiaz2nvFZTpUdZoU0oWIeKsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BjZwzkyf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BjZwzkyf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeba68948so5494471f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781165438; x=1781770238; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=BjZwzkyfb1yzuy9dY3rYYtBA2TjdzK4mBBp+RRhh9RfpbT/DToHP55yP9HJfPliZ2J
         gPHAnMCLmeKI1txluN9UsZ2hxGrpmUJe2M6lXCwq0emcqku3U/zmdNX+db1seDM/fF5F
         qGRyNtdeP3Oi+CpNhGcxIjQhVV6yS/MJ8DNfAdkxVltDg9fSrF/xWAPvRAfenymZQtbJ
         Fej4tdos/ZGkrtwZOwejMIKoojKWIVYs+P16MJRM+y9H0wiLcuGBv7G5wVBCAApYqIk5
         thZs03K9m93bI9moQPFcjcmRp8UK7l2wy/sM/itEh2bcG8ZwIN0i1GDwECLXTFmAvIiP
         2z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165438; x=1781770238;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=c0lF1EPnHPRrX2bQvBwBWLOsI97HaBY67B6XniFzf6wU4v5P+q0tH7jUlEhBo6Y1Yx
         31iWj1AqwV27gVqhQY5kWZsoFCdUOvtme/zAQ5765W11VQaBhjNUY48MdAhrbvHP6XqD
         NwjWCni755JVw9W3pPZHpryKvk/rAhjYQAL446EohEPmrSDizPNXd7EW4BZO9cLymJDV
         qO2DslXVRFBlCP/S0Q0tshgLzunyDpsGFGlQzwRtH9d2azIYV5/wxPoa+3QErGaMzUcp
         2cPIhjahzAz+j4+zSBzOniRMD/D19eLs+zeAsrC9E0n4/KF8sDVeZN8A9EeLHJIY93rB
         7C0w==
X-Forwarded-Encrypted: i=1; AFNElJ/rDkaP/GSqybiw3/OjO7Yqd6UMCoxxPb+2Y3zpHNtcxh5BP0rxr+DMshsr+fgANeykWjtp1sqNLJ7AlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2ZAhNWSFgPkTjk42aCZBsByKxqtp2hUydPEv8rm18VxhG7r6
	dWaAHqAdeEuhj3ctbdtyN8yz2xRf/EKruif2gRlYHaRUho6KIM4AwFUQUy4ek7pSazA=
X-Gm-Gg: Acq92OH+ZiQH9lASbZV+Vn/6N3UjatQhm1DAjtXlpGi01U6o1R5OF8537DtEbRV23Ar
	jBQBk9UVSWhjMC/b9DhFuP5W6sQ28cn+g6EXerPYUOUzmTw0E68bVH6FnmK7nikPDa/KAxpOfp7
	WN++OONU/9MBTiEGN400PptvGrwVes14ADLwNxq/z0JDhdVIfn970uwYRc+0rPGRzp/0UHZ7NK+
	J9nsP4wAIqOzE6OJsyZ0WvartIdXgWIBb1umviPlJWm/Sj4FwNI2cSybPSvQktpQ5TANuVYPk7U
	w75S/wyEzyQqHOaMcZpqPUFoGC3y/Fpm3HS7Wu5ELay6g24bDDzfpP2C3cP4rcGlQv/urt9LPMH
	IjFdu3HU/Yit4vDE8mfflP81pAWz0KRSV6Dy1yhK65jfeXg8AMt3lON/En9rSYkdXYzY43AK5wR
	cz2uhqyaPrARo6iDdQ80lIFci1FgcbWuOgO3uf7/In0TQ=
X-Received: by 2002:a05:6000:46dc:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-4606758d002mr1861604f8f.7.1781165437896;
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2e4004sm78864656f8f.9.2026.06.11.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
	(Bui Duc Phuc's message of "Wed, 10 Jun 2026 23:27:09 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
	<1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
	<CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:10:35 +0200
Message-ID: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 23:27, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Jerome,
>
> Thank you for your feedback,
>
>>
>> I suppose it is OK but it does not seem to really clean anything and
>> make the code easier to follow in that instance, from my perspective at
>> least.
>>
>> If there is policy to systematically use guard() whenever
>> possible then OK, otherwise it seems unnecessary.
>>
>
> I have noticed that guard() has been adopted in several subsystems.
> Since this appears to be the only place in the Meson ASoC code currently using
> mutex_lock()/mutex_unlock(), I converted it for consistency with the
> newer style.
>
> Going forward, should new Meson ASoC code use guard(), or should it continue
> using the traditional mutex_lock()/mutex_unlock() pattern?

Can't say if there is such policy either. IMO it should be more a
case-by-case thing

The code is not better or worse with the change but you went through the
trouble of doing so, if Mark is fine with it, let's have it

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Best regards,
> Phuc

-- 
Jerome
