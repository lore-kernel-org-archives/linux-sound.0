Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142C45029
	for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756644959; cv=none; b=q2z2hMM/NHbwQqTAaozz7tKBhd8TVPwnsYuHT4b6fXk90tA7WJCPRTnkxpMwS+fwQSPf9G4gGhTBTaR0CN3u90ss7WtqdsSlUurPjB1NOHoa1Pg7W+Mu3TefVoqdiHGeq9TPTGiBSbM5gXcQlYrKcWOfJ4QXncW+oW0upq+2Zfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756644959; c=relaxed/simple;
	bh=kQt5ZAHwLEoOMcqUxZJRYUW4ABPDrG3OFWpa0JEgif4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8xAI2kXOg5Y54rEHTGCEHTSH2J5ZdG+3bjkET6EuJPzQXZNCj23x53Pznuhb7MhvYhLCyQoofYZS4mL/QIWiaeFiy7bYEh76SesccPR/7dZMRzeGhGx+xOYLGNLaEz9GdS48ILgFvk5zScklpAnnvl9ZLhRcK8j/WXdbdMcH9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YCsrnuh9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YCsrnuh9"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f687fd3bdso2830269e87.1
        for <linux-sound@vger.kernel.org>; Sun, 31 Aug 2025 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756644956; x=1757249756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi/Fu/AVii1gBs16M7Z6P1XZ4bS6zvGwg2JRMC6pZNY=;
        b=YCsrnuh9pTqZlfy7c6Qy849mQzW/frPpodxbRsBcEd8V7UwZDGrU1c1DB/fmXecX64
         btpta39CQq6ODInJeoOQIMhPvQwH1VmATja1yIi55VyPcE/GT8nwAhzZ8HyRfsXLURgz
         9LTMjdMMEQnF9G4CLOpx74MxoUhaHDkVr2FS67WDHMFnJYmJqbXaONugRWT1H946uSe2
         j8X2c6TjWzWVBTXhBTIZLTiSCcMUTnR3Apsh89O+Se1t31fza6nADsBhX9Kl8L7P/r/W
         NY6SYf7zqXKQ0Cs4/05rbQvJDiC3xjPkdRYX5nZJHbg4BKLHn1zqZx8qvGqXWMVYkuU2
         NeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756644956; x=1757249756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi/Fu/AVii1gBs16M7Z6P1XZ4bS6zvGwg2JRMC6pZNY=;
        b=PX2Ng4rM6lwmr+WLxjDxKqDMoOdv0ISWRUQGZSC//rIcROvCiAxiVcKnbDCRPfpfQa
         cfcrEmJX+AVUUpfrCEEHmAZeDUz+jmmtVbQHD/zDXhzcEBw8QuECvlR13zBgGf+jaMBt
         3wCbZKgSNEtD+oqQyKew1GaMaBg33lhaBly4mvHLhu8cKB/VAAgAkXxuXfkKDVWfg8rN
         CaI0KqHj5shfRtzOwbW5XisFmJURPQHD0J72ccyucMbNtbo+/GxyhiYmCyLnkjWnT8vu
         eOrzBTiCX9Kxyk2pfcOpW2onge/sbHiVa+E/93brf49ACTi4QrANm+ORbw4dV0MryEK8
         pwkA==
X-Forwarded-Encrypted: i=1; AJvYcCUioYJC5VAbgJirJO9J5aBGaeSyl+Zxs+6jYa0PFjCCp84TbboQIrH+v1P0qlnnKHCyoXICydNcsOxBiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaNoqf7WkmuGE95pfGs07zO20xv6fIptSLO9knKV7zKkGqIfZ
	O5/ciS4SPyjeTGE4pGYXttN19c3f3SqkxfiY1ZkkaoKCCflsU3zWhs4vC8GgmLtTyPLGryJrrrJ
	FjcfeWdpuyzfWksf/34C+Q3piyJMCcT02p7GrWT6M1w==
X-Gm-Gg: ASbGncuD9vCh/TIhAMxiyvGKtoXKSr5DxCANyPg5iABwT5aEgLx4kjUGY8zuFj12v8L
	5IS0A1XqPtGVhh1ZxkYyEaPg3IeMovRq7siccJvYUu6aioV0uwNd21GiWWq9Ly6ye03lE6ZJYNq
	IHTQPrknj5uW34tUOoD99oQT68lqyHRy3emDXM33dhBi/jkLUcfXfcOa8etfrUhJ0GKdJ4hAyhz
	Da5LdI69p0km83kb6/Z0nnBhj/EzQD1AoTy2HJyv9KqhcM=
X-Google-Smtp-Source: AGHT+IHniTXa5/4UjcWJoEBwBQbEyZw/BW9AAZMM7U+Hb9xB55u2uHi/PlTM610ZTLzfQpPenEMzKjZmWLh4kF49NLk=
X-Received: by 2002:a05:6512:244b:b0:55f:3c07:958c with SMTP id
 2adb3069b0e04-55f709240e4mr909229e87.37.1756644955560; Sun, 31 Aug 2025
 05:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831030855.957707-1-alex.t.tran@gmail.com>
In-Reply-To: <20250831030855.957707-1-alex.t.tran@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 31 Aug 2025 14:55:44 +0200
X-Gm-Features: Ac12FXyAQEHnGX5GrlT1HPWQ5rbSTaGU-1EY7XEDobHljDh5pDPBlDId2SDPZLg
Message-ID: <CAMRc=Me5L4XtriaFSwcE9Vqri+6d+Rfn-4FzKUrN_VSOgfA_WA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: tlv320dac33: switch to gpiod api
To: Alex Tran <alex.t.tran@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linus.walleij@linaro.org, shenghao-ding@ti.com, kevin-lu@ti.com, 
	baojun.xu@ti.com, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 5:09=E2=80=AFAM Alex Tran <alex.t.tran@gmail.com> w=
rote:
>
> Changelog:
> - Changed reset GPIO setup that uses 'gpio_request' and
>   'gpio_direction_output' to use 'devm_gpio_request_one' instead
>   for legacy support.
> - Convert to gpio descriptor for use.
> - Better error handling with 'gpiod_set_value'.
> - Removed cleanup of reset gpio as gpiod api is now used.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---

The fact that the call to gpio_request() is still there made me think
immediately that the conversion is incomplete. I looked into why you
didn't change that and noticed that the global GPIO number comes
through platform data, specifically: struct tlv320dac33_platform_data.
That platform data struct however is not used in the kernel -and even
the header that defines it - sound/tlv320dac33-plat.h - is never
included outside of the driver. Seems to me like the main obstacle to
completing the conversion is not even used in mainline and can be
dropped?

Bart
