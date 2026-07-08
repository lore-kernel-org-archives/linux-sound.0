Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C039E191
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551633; cv=pass; b=UkZ/sPO3KdQGcRZdSJhsLVsSGXlTVHJrQ6Hi9xNssws1gCryd/xAExGMQDqy4uTo0b8vxdeQS6v7/PuIx5AnimMqlwM+JAcp/GD58w4YJrs7EsPKIQclv9Olrf5SqYdF2wFZ7dYEBRIMkM/GhnkfhRIZAl221Pb1t7+n5/7b4qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551633; c=relaxed/simple;
	bh=12VdkTge7gXn1pfr40xeBH6CkRK3M3s2DqKv/f1brBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl3rsmEuLTttpylH1PQEejiVZJovewvSvQUwn2NvTtTkLzqy0zrJZN7TVZ6eqy26pKCMh9mJ9hv2dkgsB+SeCwAjVFFapUC4k4lomvjoaBg6shWjBW6rjWmBwD9CletMNwcIxyWX0hsZ+AN6X9D5YB578YVu1Gmltrj+eZlGN38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjz9rUEX; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjz9rUEX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84783bce476so1140183b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 16:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783551629; cv=none;
        d=google.com; s=arc-20260327;
        b=U/vThr0UHSuQDPO1fKdErimZ9da+pYyjVPTNk99xc7pR4mU5xdspee6SIQf/bDUIYL
         f4dQB8s3hPb2iFE8B789L58gf7vR8Tn0KfRlocFBDOd2t0Hsnwuul69weuEoIoxUdWA2
         0WsrCzhGX5xFXvPWG6tLq/x9XjuOgfHu5JjZd4WEwG5xBQLPEJHjpa7WfApmgwkfobPV
         AXjUL4wGiPDYSlRch1ZipbuUavjhTSPc5y9qGfQNKocxUwWq45/hm3wXRnIFtN1fk2R6
         04A5zECpkI9V7Yid198lKhoIEgm7M3iKqvEGpkveVl1vDpxofeNsEwrUUWABTDaYWSae
         e8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P+VFaUSirStw+vZKdBhHZA5NfGLCbU015PGFzKYEVhA=;
        fh=h/QCAMo6wE9k+N58c41NvzwuwwSYLVztiIqALq83MKM=;
        b=o0cD/1ej/1BX4ii12HRs2TqMWTVbZ/Ru4Oid630NOPQGuKNdhgjhU32b7rTuohd0Tr
         6Dd/tnwuNjqQiGBaQ14LimfLtSofkkVIjdaDyWMzbDYxqB9jGSVGc8utrFO0GXRyKVmP
         2/agmMBnvRFOmA3HtEK3mEXffoC5ZD308BCMp9NIW+9MC83f+XiRbd0ApYl6AB+4Jdnh
         /X8zG4nVxjg4iWLIXj1SPREnEuu9pmn+keJnQyqD+fw9ea84R5+w6dKXLSOaQub4YT3B
         CTv43ws5iEeueOye60XZgdfRs4cOLeTcM55SvZZmbpr4AxWzGjc2E+fSUwP7V4DOc2hr
         IC2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551629; x=1784156429; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+VFaUSirStw+vZKdBhHZA5NfGLCbU015PGFzKYEVhA=;
        b=Gjz9rUEX4yxT+GnFmAm9IolKOugXXH2+7rnribujCJw6qe2JeqP0tXWx09sGn1pnWV
         wZuH43BlrFV5gM9o2y9/vJKSYhdjYHkulaY+19OmUxbvTr5bT4txe2T9iaIQCqBCvaQ4
         6YVbwgO2+3vC5l3Yx3TzyQj9Ng86wBp1cmUTnbuPt8hwwcBPpLR3kiUdL1qG+w6fBBXD
         a3NTqKAEB3yNMdMyAoEkZGvgGVF4xMGPiFwi1PoYcBGHFnB8oOkIUseH3TMxjnI5l8Ip
         yq/Sl5cfBIbdKV/bhsRxkuNl9i3aZGPvz2DAM4rklFD4PbqcoMGDmXpPmp0ueGF8PZX9
         A4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551629; x=1784156429;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P+VFaUSirStw+vZKdBhHZA5NfGLCbU015PGFzKYEVhA=;
        b=WYq5gaNUX3QXlJhl4IZtpyEKYZ8JXfAk8Z15A2RpXYpVnUqz7xAHuFs27DclfmYTJr
         t/bzKue4Vjc2bXICEh70LLzhuaSEnKabEeeh8f3bsmGfvPZIyL+m+ITqznES9pjjocJD
         7HmItkpFicDpbkAj6vwQkt9alfE3wDLwrMlWb6HsNlyOIoKBYYLbf7ESWO9hiP4OUqIy
         DHTxqYph1ofXCo3J9awbIL9rXwzuQc5tn4BNtIP3je/+AljzVnSpKIQkqy3kzajll+8L
         FmbpZvCOWq9kB9L7kuF4QXImn8PpUAz2ZN+vomsqZvwH5HarOWz58/0aBzef8a+43ZoH
         5PJw==
X-Forwarded-Encrypted: i=1; AHgh+RqFKikjkX2ZZ/yOgg26VSprQ/MQDhletqe3tHc6Kb/PKB+2s/L5AznORUFxX89R+O+VnVaNZZW6e5hEhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TmIDqh3UiiIJahPp3WDs2e9vq5D2nzQLinwaz7ZmpE3fEyYy
	K5l2Xsy61TfdqHOnKiYz/Q1HlMFzo8uWk5821hXdG0o87r6weja5rE5tRu+M5P+dxKbXr1RPeoa
	PR+vTuwNrsa7VAstIgFFdvE0ItxFFc+k=
X-Gm-Gg: AfdE7ck5Pf/gH2SQvYazY59jsDPpCsgdukBs16rwVTvikJ5Z2pADt4qAjr1bvyU3V25
	fMl9MqTGlYbuv709mYRza4g1xLC9k4tcbki69qzQxflu2bDn/CJRbM93PMsGGgSkj6BSfu4H3Mo
	nIYm+puoUUI9uHt/7fu63JxJaQqFEx+CwmZRxcw8l7D79qVoNXdJ6+Bhrovp/20v8gEb3NKmMfa
	waPPciEAKFFVRNdYUMn6Ie13t5AqQCz4bTcVu/LLBa0/RafjNR9B0Xlg+EfWev4gL0VpXrwHHjP
	thfM3f5lHSszHFVwm+RKlaihaAC7KCpo9WQKOCn9EL81CFvND5arskPXwdabndaio0pkKlIc
X-Received: by 2002:a05:6a00:3d0f:b0:848:56ff:6ced with SMTP id
 d2e1a72fcca58-84856ff70acmr871619b3a.8.1783551628853; Wed, 08 Jul 2026
 16:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706045747.36811-1-phucduc.bui@gmail.com> <3fafaf57-7de8-4124-8ad4-036a90801fe5@sirena.org.uk>
In-Reply-To: <3fafaf57-7de8-4124-8ad4-036a90801fe5@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 06:00:17 +0700
X-Gm-Features: AVVi8Cd4PcOGTrnhgE_zlKvgXwHQqOeFtj7OQ1z8XmvEfhyUGUaPoLvh1ENerjk
Message-ID: <CAABR9nFa5y1jLN2vKG25rq9CZHFyg5zK98Z59QboNgrbGAtOdQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: xtensa: Use dev_err_probe() and drop redundant
 error handling
To: Mark Brown <broonie@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> > +     if (IS_ERR(i2s->regmap))
> > +             dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), "regmap init failed\n");
>
> This isn't returning the error directly, it's ignoring it...

Sorry, I accidentally left out the return before dev_err_probe().
I'll fix it and send a v2 shortly.

Best regards,
Phuc
