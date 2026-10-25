Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941873;
	b=qXfQjQX1ZSFTtVuTLju/gN51M4u+7aowOLI6JRklFcpI1ZI4bw0qRoeHM/govxPSe9Kt
	 75hCZMDBZqySytHWFztg7vjzX0XJfOUGlQeKhWzSCHWcbgTEkOhI2G9sVbivb35A4U9L0
	 0OD5962HnRrDbM7H7xtuUm4ZhL3vZOfk64H7uTCiHM7QdZh10GkzUOlLYXs1nIf9rcWz2
	 wVFdAdOubXK96LHAlNKO6ncgQxMYGMxwn65NCZ5lRHZMkNeRqK0sck4RCA3mEaojRQde5
	 DRO8yXD2+XXY13X4OPOlLMQXDmtJiOOFCIWBZYfT0h2o/hHjKHEFJ5P4JYW089OG1qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
	b=nh48ktdFuBzJHgOpavtDZoUxrymiR4PBKwV/QmUtw9fxJe8m/qR8Fzp32IOER+n/6PBj
	 TNS6hWj1YHuJwLOe2wEhqHhBI7hiIksJuqhWbY5DcLR7cUtRV+QM/kwUr0Tr26omYAeFF
	 EpcCuLgBwJnoFWip7cLuK9o06NZKkV0dyD3urXSDcWFFO5jK7WYdyhiagrUsFI7sVBc0s
	 gx23lO/pAQFI1WoT33BkYo/6KXE7hvyz8faeusWnmcajdSLEPnxphy9FlwdeLM8RQgwWP
	 DXIvFfUojoaCXKzbjtlfaulop4khXdNab5gNQp9qWx8YcS8Cx62M7YVJM4mJAreRx6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DC606A325
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso21055035e9.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941871; x=1793546671; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=gMlUYdFdvAQETuA6YIj5DvJs0A0nnjA5nYRIngOybGCA28mWCGlOgRHYWq/eHR6/jL
         /BX0jAZW8kKRXsVlSCPoKzQI5HJt/+J5Y4/PB4qPVxPUbKjwXe6y5ULZish6et3YJreS
         nWMllquRXTaLm5UYgmioTZRM3JANKyWQ2DIkNCndkZDU3p0kGz0ZqVM2fslDVE5ORPUX
         H8DHzt4j4t9QNMRQTqJlPNwRLMSwGvEJZbDQDhcHbrWQ+h8CJzIlbfUTvsw7paI8ucvn
         SiV5e5bo/kImdaoFmZg2omjIeG7q9pudAUZvKxU0TvOx1Oamj0LgGwsM5ahUjas9x0RP
         Z+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941871; x=1793546671;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=nl2kxNVxj3SNxUwbBg6YDTBKh5U5mYm6cr9obHmxr6YQjOQpGOQ2ee250narCmAId4
         b2m1on+oi1SeKdzpNF1nedwUaAUTXwY6d/GI+BRoaz4wtuGEBykz2n76wJiS1CrfLVsZ
         1fRSbl3VfN9SyJIgjXjzzNkebi2L1b3ygxQBaHH7ziXyVXrtFFTFtOR7HyCGcBWjZURL
         AwPcgpmkHC+452hUazoixCqraOlRmQEump/R3HFb1sif1RAnRJpaQ2W7Y78gyJthiTps
         6tBUjsIUHpXXNLnQDX0cushktOKUE6GH0FFQTFkk0vLZe2kq0Mv2bW0lYO3k4N/GKlbp
         tQfA==
X-Forwarded-Encrypted: i=1; AKwUvBwv1T+fbj/sLk5iqLNa516LYscZzQB4QnK/fAuvXb7T8VdPAwGjstVezs4Hrj+OOguZklsd7hZ6Cj7+rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Gm4qJvtgbpXu5jICHc71k57fPxfBa1x8rpk80FNg7x4eQdVQ
	nDKHcVLOW67VcpKQUDOlKeQn/vJx5yGIgiMwr6XxhDQCx+BaASU/1KMN
X-Gm-Gg: AYBFou0TjEM/htbVT0VnCHNBO+wWpsFumoYCR+XxQ4aEFy5HBHx2TyyFwAmDjPS6bq3
	ld+rdVCdGY7nCnasp7KOG2/cjhrz/D1KUo4kK1K2nwq/1PqvsLFX8yar4+oZYD5JB/XK6Xgz4aI
	Ujx5+K9AzXwQpB8gvzPN99kptj5ob3RauJ0OZURl/khmzQZrbpufxVfploP7n7DcqcNmUifCW4c
	2sQcxe20If/uk9qztlxJLh32E35jR1q/N6hwJJwWwRmpS+OvJZ2HlMHALd2RTN9d/ZeyGOQokET
	Z9XqU6L0vO5drv1vAQnzoh8gXrg01z5aMLki8+rUGqQi3vLZkD3d5fUYPoa4mRcEnPWt6bDPUDX
	jkiF8Yhg2aJcPvH+HJ071YEfWnUWvAO9arkUEzgu7KdP7YcF0H8Ff002h+aTwrz+sHuZIjKkeFc
	88NwDabpvldA9+4MrAM+wDqDDO1gYNmV8x+pSHDPJKu6wHpEcTjmVHpv6VEeQpD5dy9MfsWWEK+
	ohgAhRGE4WLS/FtlMwYmMrlkGzTe2Ln4VRRpwy+ev2GJHSFHDiT1OzV6Sc2lB0+soqf9fZL4zpb
	CpewtFbW9p+by+yy9UfWflaSXLaoqruS6egAM7LTN55I
X-Received: by 2002:a05:600c:5248:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a35ac3cb66mr82142695e9.1.1792941871149;
        Sun, 25 Oct 2026 08:24:31 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 16:24:30 +0100
Message-ID: <179294187050.4141843.1375662350308483762@gmail.com>
In-Reply-To: <sashiko-outbox-184258@kernel.org>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-3-romain.tisserand@gmail.com>
 <sashiko-outbox-184258@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 15:12:00 +0000, sashiko-bot@kernel.org wrote:
> Should devm_clk_get_optional() be called in rt5631_i2c_probe() in
> sound/soc/codecs/rt5631.c instead of the ASoC component probe callback
> rt5631_probe() (similar to how rt5616_i2c_probe() in
> sound/soc/codecs/rt5616.c acquires its mclk)?

Right: in the component probe a deferral is lost and a rebind leaks the
clock reference. rt5616 moved it to the I2C probe in commit b5c9df40ca56
("ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe"); v2 will
do the same in rt5631_i2c_probe(). Please don't apply v1.

I'll send v2 in about a week.

Romain
