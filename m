Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361255;
	b=DPDU9tU1KksB50CKMc+vU/AdzcydLGqz+p5Ipe8IhYiDvI8tYWwqoXYnAS1HAxDs61jC
	 aqP3oKUbs5mEITMHwmQDeszVFY+TVRXeNPvPCFwNsh6sF6LfgPm4t0N6BfGlPUdurlebC
	 w8cpikYHYoaN2yVN8KzF9TeKvNF9jYfwgGTvGs481phJAH+Rg5OpAYi9RF+i28rnIV7GZ
	 Meu5NA3YWkQpc5moE5X+c1A6pseTne5SFmKYk73lla8yo47dhNniYolzYf5Cfhxk+qziS
	 7CAizsT2EsHBwVJlvpOUB5D+tOaIOFfulM74xa4FxRXqk5o2p8+GqDiqh6uzG3AQyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
	b=ZCvEvzQAJlCQfBZjGxMKKcoOSF8dMlyQUXhrzC7UQDogg5zANdZhyqJLfoiVHkTJRZpV
	 oHo0Q0luCI+GsoipMJGNzCJqPmVSulA4XCa78A+HdG81L9y0+Ysi7SdTPjan2Dli3xCS2
	 sjUf9tPl1w1AbZyRznuNVjw6nAffJfZE1+U8ewBzEoM6lPLx/dHAdMMxybus7uDeD4ri6
	 +tI3UIxx2PspHBNVobNr/8iyETm2G8G/C7jG1kATrUXFgnOVBZmH8tNK9HBb//ixwKOT7
	 WcBQaO9PW370ipBins76JvvTUlDeZk3JlIVYD+i1i4JvdrlCHpsdQ2TXSzZCzBL+CxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52A606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC52A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23644035e9.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361253; x=1795966053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=PnH7L7DnBZ4AlNcEALOd6IOWa4irex/1Lm5oBthjpFyAhqmWwFFq8gIKqMkc4sqGoW
         HZlmoeW9uEUJziypoQHvEs+htAfo14e0038YSI0qZcFUEN1YmHPo2vXvrwkwK0/ZRiIg
         s60LnC3AzzZ2/EP3O7uMQZKYXOqKoHOBdcFDf5P4FZLhoE48mW8jrd0wcmXWBuzFmd5c
         wGeJPggdzFaVNQgOgumC6ZRyP49nAyG1BTwikpiQ9hxPbH5n4Oo/ZF+Z884wMqNdlqpV
         PUHG3ggKOybXoTSLMdvYgc/2CvGFHEAbBmDXfMlmMX02d1R551xSH7XAfBWi2jC+8ZLL
         A6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361253; x=1795966053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=LkzQZWNvYKI+5CK5UXIolqWxJ4/DBdg1jU3uyvm+LVKZWMW/YIafa2VzVHT5bG5cjR
         U4r8g1NUCSSPafCZxqKIXyRk8VJRt+ADzrUjGRzMOYrDCe72Fw/+/wEk6NaeGFqpKXW3
         DP45Ua0jtxkWoOuh15Gl8HD0CuoDhvbXKAOopmwnFd0gcALm2ijlnE659q4wtf2PR4A7
         XVlqWuQHUx7QC87nNAvkvze5BlIV1acgmWdWI6XO7Ky2q3JGrkOS87wWMDVC1xjw3vNe
         MOw03o5Ptp3Hz3+/ZjxzSVzmdTeTaHikJWuoAs0UqCqsDJzh5lwh8W6Cwo+bQy7Ln5N0
         VYhg==
X-Forwarded-Encrypted: i=1; AL+hErEIaggZc6mMzbV6tW5F2L6mBD8GG7lPqJYIgl7wWOLBvXXdm+lDxyqohEqbjDbbTaNJWi3Ky0/jGfv6yA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YEY2ux7RN+r7iKlUAa+XTS4J+c7lE3t9uTCLQrC6fxRmMJwyV
	0Be86m5pAHOA1wtSiLTvUTmsswSBJ6tVu+IXoQrpgXwl0F02RzE3XcMUGy9ppNOmIS89i7uObSY
	QaDesmgD8Xw==
X-Gm-Gg: AZFdTZf2YrrmV7vg8MW9eBzy2vtItVr6G/IHFCr3+YZsxQM/aSiOYOFg1w3R2pcEnYa
	RicQW7Jhd8eYpQvkYq5Ke+BwwpgSaDtfC7b8ykXNQyM9cm/AxN05wqfKKAoLzRJPXEGO5RT5X7/
	5F8xJ3EvWP1yuvPLjN0dOEHvDPQ75zfgAiEc2b8C9XqJFlR37t9EGADlLCP7XQ2cRtswoaQsHUD
	Y5Sksy35FZK2LE7+NUQFeOcNUkN73lVHKNkihtEyN1QyrISvbYUX1p/QuLD+JuOr95puEinMmUf
	e/GND6JOm7gr/3aPwRZ7D1v6J80OHh5XSgHmYYksPW04zsPVXOctInDtTm0weFYedbtQCjO8RAs
	HTwdPEnFF+frcuPLXMsGQBQlqDujq+n+2xc5f6yy/Dt5NSQRZlRPEjqIOC/pdP5jktnzQThHChg
	eedAUjCtPimaL3eMRy+rlq14RJVJlgTDJ4UWx3dPzAnpYnkTI20ZdfRiDk3kzOmTOKzPmgYtYVA
	TpFl0j4X9Az6XzTR5tZD3ZXnNKVUl10aECxVG0klzlQpn/wgZjfSAaeg7cFl+ildaNvjgcWDHUm
	equ5GJt1BMxLJ1ikYvdp4myx2rc5h3z2ceduMVMy0X8HCMtNGw==
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr187712165e9.34.1795361253164;
        Sun, 22 Nov 2026 07:27:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm324114005e9.14.2026.11.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:27:32 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 0/5] Add support for S4 audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:27:28 +0100
Message-Id: <179536124894.2728475.16240917993133855473.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SakUBu+Tj3UYj69tUpTC/fsgrcNkMteoX+Lt2iuPgXc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnE/+NymUzd4hva7CSmxX3dxLJ27tYynZy6qYorFaU
 uexikFzRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbCdIThv9fc1off4xQusP20
 lhVaw60es6lqQ/uRSbU8X05aMdusWMXwP980O55/ScYJq4WsZ3SZNh+93vxsmyBL/v8zj3qqwxS
 YuAE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates 
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock 
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

A clock immutable branch is going to be necessary to handle the dependencies
in this series. Please re-submit with clock changes only and a proper cover letter
so I can merge apply this and provide the IB. Thanks

-- 
Jerome

