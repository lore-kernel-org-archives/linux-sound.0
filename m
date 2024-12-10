Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA671DC9BB
	for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824606; cv=none; b=ZQ5OnnJhF5bglDsE4oJSA4YmgBJooBrrI3pAriebixr9HH6kLVgUnKjty+PucRKmk9kCnD0v1VeUm7K1NBTQmtMeHoLptOYJwBgiV23cYX84alIts78pJrel/TZPV8c0XkVCnVA4uQWYpqpMEF1xVQPz0XDcziGSs6iw7SMN7Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824606; c=relaxed/simple;
	bh=kOBH0vMe0xTQDXgWPorv7i1vsjSVrIhgJ0QqbJFZGP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsxde8ZCO+RRLheeUgJI/J9VzaGSMszSVTlRHBAaMcTnwW9IQC81Ono0ItaFsjJM8SmRyqmGPSuSXrRtXWhoPSgIF+CC+NKcgFTCKxacO5Bkzl1DR6i/kFF8fcggnoeh7cHxyA4K4SwJ1zkqIVK0OkUSj9rEpKhjP6gz815j55U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=E3hp/VzP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="E3hp/VzP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1628950f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 01:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733824602; x=1734429402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOBH0vMe0xTQDXgWPorv7i1vsjSVrIhgJ0QqbJFZGP4=;
        b=E3hp/VzPKLaBQJc1w6MPAgYZfc+1H0YB+8+rJ9EWrPGFWPT0kztjQZSoiyATSyUr0i
         KcKWcx+yWush0dy/9+4PGpr3fBbZoTMu1OYglSVIyB5OZ48/+rXqyat1oaAR53cpDXw5
         Yi33RHKyuCPGSiNqz5vAa2VpcN469IMWx4kXi8jr20d18DDyQtNe7u5uJ2LaZ11vWqTR
         bDxUU3JWcEu+x2xQqtRb9HVrkGtzRb2/cVHZlFZBh46kvDe1qi8/ytwZ0n2iwseJYqEJ
         99s09Sp6TjtT7UUq5q48TdGZ4lBWrFjUNucASTgDO0h7RTtiTQ2z+dxnPoOXgcbDivrG
         6bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824602; x=1734429402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOBH0vMe0xTQDXgWPorv7i1vsjSVrIhgJ0QqbJFZGP4=;
        b=OD9bT4GjzGCqC531ijTmYAJibful+dv09t+F2zh8AAELC88M760llt6q2+kkRtYnxx
         gdkpo7f4heHudLIPbQ463i+BpM52ROquajGZAXsx57xDv4/qJ8OKxQafbk/6h56jj/+X
         /XVYcH11kxnt4uiUYz3PLFGaJsq/t4710pbQgNZOJGEIie6rTbvKjEcIrUaAp6nZFh70
         uNngEsAFnivjUQw2cWOq6Jn4otMFAfXg6do+/fPc99ZJxQnUH3QV8uhUbGDqJUHneYBD
         efckvMxBT4jOx5mLwQ+2dDkLLVyE+ZI8Im+LFPz4xn5o6PXKvwkBzGA3zkPmGQcsIFyw
         4I2A==
X-Forwarded-Encrypted: i=1; AJvYcCVPXxNLM5JN/sB+t7T+1IYna6Ph2xs2IW/dyVqnlI/OZYZsLEPP2q2DD9oKmHOK03Tq5bVL2dtZ1aHI1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9/N0OGN/w/HsgwTGOcIQem4k2Lxhs36+wrTtzcnKg1ZE4X6n
	Rm3iEdk39mXMZJALY/ANRrQq5NsKKMmCdSCWTVUtO7afBCdcfEBLj0Io1TDiTHY=
X-Gm-Gg: ASbGncupJ1A7phgTrYaD0VAgPCcekMEE/loNGyKgTmiFY+eDr/4DGpVTAJYOkrnrOCA
	/dnzNg9CmCYD6Y6cw6tBhM1HNposnZ/sGQyKJorBj27zw3uuIs0xJliCbnaIokoMempFqmsHq0h
	F1uMmyID7iNgBFLDDeUh1L5JcW6I+BtPWDLB3+QGd0ECE5UmsqA5iTw6udmyELIyhzJAAcanO3R
	YIbM7b5bQVudynWPS19fqSXNwDTgfewUb+BsB7CmX1qkdj0i2TvzXJ2e1/q3KQ=
X-Google-Smtp-Source: AGHT+IGBn3J/kwjMkMOumD3GgGk3HgegGtxShYE8MGa5RyAHXgSBmzxZuUlRrYhXtKyrcLpn+/1Lzg==
X-Received: by 2002:a5d:6c6d:0:b0:382:4926:98fa with SMTP id ffacd0b85a97d-386453fe979mr2475238f8f.40.1733824602299;
        Tue, 10 Dec 2024 01:56:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190989fsm15684319f8f.73.2024.12.10.01.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:56:41 -0800 (PST)
Message-ID: <ed0f6c49-8e39-4cc6-ba93-35a9372bb532@tuxon.dev>
Date: Tue, 10 Dec 2024 11:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/25] ASoC: renesas: rz-ssi: Use goto label names that
 specify their actions
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-15-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 09.12.2024 15:51, Geert Uytterhoeven wrote:
> Inside this block there are several return statements.
> As we know DMA is not available when we get here, these do not
> need to call rz_ssi_release_dma_channels() hence do not use
> "goto err_release_dma_chs".
> However, this may be missed when making future changes.
> So perhaps it may be prudent to make this safer, by moving this inside
> the failure branch of the rz_ssi_dma_request() check above?

I agree! As this series is already big enough I would prefer to handle it
after it is integrated. Keeping it like this doesn't impact the RZ/G3S support.

Are you OK with this approach?

Thank you for your review,
Claudiu
