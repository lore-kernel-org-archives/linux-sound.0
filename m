Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB930328B6
	for <linux-sound@vger.kernel.org>; Mon, 18 Mar 2024 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758680; cv=none; b=jEg4r6pHbAdvVAYWjmRfV08yNLUk/uvTiX8MjkuRrXvXCMEs/sr94bKhO8LeIjepNm1MHXv1YcUSziSyp+wdE57pyrR6IsrAKwlZLt5zPBZCfGgFlZXFY5xpdMKgRs8VkxuOpenCyM7+iyMkdZWTH2ok1DSUv6d6DDpN2qbOEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758680; c=relaxed/simple;
	bh=+SOG/JMXzSLzhcPXLSIqOGl5VMrpHzfQZrNkOx8y724=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=bdDrMOQlbriXaRk0wFpRLZFMUlAHqxKwb/6FZaCYiG/j2IgbNreviWPt51gNQpHS5p++jwqXP1W9koStN/J1C/VGKpjICy/1fAavz7igAnbXnLjZAU8EXV3OCMGUg0EEg2q9/DNRjGi18k/H6K4HCNkLMvQ+UoHARf92ZWoRVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1cM11hDe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1cM11hDe"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513d212f818so4828667e87.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Mar 2024 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758676; x=1711363476; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=1cM11hDeSMTR9lFAQfTERjAzuRrCa3rqVEh8PZNzqy7eDhvjQWyz2Y2AL5sm5dsTje
         +7mG0i3XjWHnHUKnzcJJY3DoxefsHtBLvVXh8+ifZxU8Z7T0dywDnFYKbvrJqyDh2R19
         qkquO0aTGqDWuTt2z/K/HinTLVZzcScfgDhd/mkiQDGUS9oCSfDx5v3nWjp/ZRwgW2Ut
         qSRCe46G/cPOUA4LtQfuzodZnBE9W22UwhqBQ37IPmmNaYbC5Fy6Z5nCrQtYndYpR4Fr
         GN6JDqT8wIJ2ymn2rxXh+ytzIklDaFm1PQLiB68BWuow9Whp8oKMDBD29i2C7KacOvEO
         pdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758676; x=1711363476;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=g9+bnoODB+qee55o0rI6Q+raVVNM4bCOz0bieBGjMEypVGsa330Ry0UF6t/7rnpOUY
         c6RB8UEiJeBcyYvNei7CYM2ad3om0vdrk9TZyvbcggqKwqJEoU/EDeLe3Ep7bvzNfalS
         mIySlElH/HnwpuIo7K4vS1b0P9Zdx8u0cllZxbczQaGfmJzV+Spt/gx3h2qSV2dzHn7F
         SmyEByAfqgEszJfHKN5+nJxCwSLrBPpZZzs4sbC/GQq7XmEb1AtbIO/XoSF/VgE7FrrT
         +icaGtgyG7dGI6V7hF2Kl4haK/RD8sgwB8xRpIZHrf0UJdnwUZwmajahxcgsb6up7nLg
         kMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2sbYyekGrbo/bHuE7FC8lOYr1Jg8ClXkd7747NNHmRXU5yi54KzYfLl6QXyno/YntQ/iskkxoxCDM+ucbPOO4vGtlU/KDf7kXIqM=
X-Gm-Message-State: AOJu0YwKvx0iI04G2o5zUAtxJFX/A2OjYzx9oPzvpp9+g1G6DsCMJ4tm
	8fWoBI6I2MIFrAUmYOdv2RWh/O8TiWQr7bbhA4oqC1CA7BpqTKTPN47aXHCHq8w=
X-Google-Smtp-Source: AGHT+IHrBhAsRVSFIOS45FQu5E9/DGiPnUOBufbspQxtJ2p2r6r0OzKNwEix9BKbpaZlbyfnUT+a6Q==
X-Received: by 2002:ac2:494f:0:b0:513:c963:895e with SMTP id o15-20020ac2494f000000b00513c963895emr7169639lfi.42.1710758676166;
        Mon, 18 Mar 2024 03:44:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b00413ea26f942sm17214532wmq.14.2024.03.18.03.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:44:35 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
 <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav  Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1
 SoC family
Date: Mon, 18 Mar 2024 11:42:20 +0100
In-reply-to: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
Message-ID: <1ja5mvhl9o.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sun 17 Mar 2024 at 18:19, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 16:33, Mark Brown wrote:
>> On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:
>> 
>>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>> -	.reg_bits	= 32,
>>> -	.val_bits	= 32,
>>> -	.reg_stride	= 4,
>>> +	.reg_bits		= 32,
>>> +	.val_bits		= 32,
>>> +	.reg_stride		= 4,
>>> +	.max_register		= TOACODEC_CTRL0,
>>> +	.max_register_is_0	= true,
>> 
>> If the maximum register is 0 how does the regmap have a stride?
>
> reg_stride inherited from existing code. Apparently, it was meaningless
> even before my modifications (the hardware has single register
> regardless of max_register declaration) and it should be dropped. But,
> is it okay to remove it in the same commit?

Yes it has a single register, for now. Still the stride is 4.
And assuming the mmio region passed from DT is correct, I'm not sure the
hunk is useful at all.

-- 
Jerome
