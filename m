Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBD1E4A2
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262537; cv=none; b=ozjegEY3vkiE+oxPKT5Jy98Rz4qAlM8Ti1YQQx2+5Ie1buz36N0rz3jrwzMij1d9JA/CFhLZMnwHBBt8t1OD+gmYO+RJ0AQC5v4Xi+p7yvfs7k1BWmrgNLGiTWhsqBAJsVThQ9ZBv7aBws+gVet/VEVB+xmjnDQ4gFiq7qc8n9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262537; c=relaxed/simple;
	bh=D1ZYFHP/38LgdR0JBD7XaxbjYHhm3ApdP7ZKB5nxgew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hnQCCNZlJ4CVdsA4314h3lwjJnyV7Hk5Dsnkfbdr59kn+hBogpmGAyWggCcwZPNhhcbCBmneWZM68LQWGRjv3rdkCQx+NrE4Mbps9a9i13ZagCVuC55u7cEN6k8sy4huZxsdPtQHoWzLeKS2vShXlYKv7tFb/w76GL6VDLmNJT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zjoTEaaq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zjoTEaaq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42819654737so11904755e9.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722262533; x=1722867333; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=zjoTEaaqG+7tw4I2DOhoKPqvRb12zzNlEUKq0sirs/2YZlUuL4h+skY94MCmA902lU
         cET8bJ6hGFw5e8xVQYmqK1WUo0tdY3FmYC3y7uRC8GAdmdV12z5eNAzVybUiEz7PY/8j
         Fw7WnaOTLGsSF+RLeeBJfL4I6v2bdvw/IP61Db74HTGlegNwBncxTvDPJbwdt6yDqc8W
         VbAf+V/5I0ImMl3AiPNZ9o/8w+08uKooM3eDKlcyOklSVOrFhNsJr9mEk1a3OZlJ/lvF
         MES99aRN20rUQhXFqiAVlLG75X4HMMk7A9qLTk7VRRq58aaYEdlaoWS7s/IdxHbL/cbb
         M1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262533; x=1722867333;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEE5YCygicDy/XBXKqh7m+z9CwXQT4fXt6CN+8nkicI=;
        b=uzeZLTzDgBmaCxe6tZRV737VSF6dJOtJ/fVQEr8ok4qftNLKSM5RzBEaldWwVuhIyn
         1bTXa5S+f8wxHVpqk+Er0wDeFz+OJpC33Fuq0tmtDMST2xoofPKKzvP885B9bLenqsXs
         NlGU/IlgXVj7A+PImVdihwRdOdVCt5GSVidwSGbBHTgiWTqsNLlexw6OPKe1bMSEGeAL
         GtakvQxOKvUsUsl8aXP+HDVCYefG0BCs24a90Wz0vS6cJPj3m7aEKTmU91xaUWw7F1jb
         xlQQPjyeuohhvFe64TnrLw3aYiEtg/86XA7hrLRtlWwnPsHmrJLVz55wNDwdsXUtv0z2
         6pwg==
X-Forwarded-Encrypted: i=1; AJvYcCVmQJXf1hSGVMM/mYuWfYZUIDrRPLSNO7XlOU03gsS63bjqebqFfGxzJYIVGLxhfJrbXvBTY2CueaAA4Gz+lyCLf3qMc4F8G33+6gQ=
X-Gm-Message-State: AOJu0YxlJoF38kBI8AYkb/4yY2X2rgYYkDLxxOgibOTWYJ4LMaFqsEnZ
	x9PTVhHXpH/xa7rsYqq06iFhiR0YERtIgsItmHoulQW742nrwwmlKvOwIFhX+d4=
X-Google-Smtp-Source: AGHT+IGvhW6W5lhj8wCPR9kGfAvnftNlZn/nJWbDUFlhvd5DqspfoHe3v4BYeRLrWpFDIhKz3FbMyw==
X-Received: by 2002:a5d:5184:0:b0:368:6596:c60c with SMTP id ffacd0b85a97d-36b5cefdef5mr5201083f8f.30.1722262532993;
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm12284340f8f.59.2024.07.29.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:15:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>, Mark Brown
 <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  <alsa-devel@alsa-project.org>,  <linux-sound@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240729131652.3012327-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Mon, 29 Jul 2024 16:16:52 +0300")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
Date: Mon, 29 Jul 2024 16:15:31 +0200
Message-ID: <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 29 Jul 2024 at 16:16, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Raw spinlock is needed here, because with enabled PREEMPT_RT,
> spinlock_t become preemptible, but this regmap lock could be
> acquired in IRQ handler. Found by lockdep:

Assuming I understand the problem correctly, any driver with an IRQ and
using mmio regmaps would be subject to this problem, isn't it ?

That does not seems particularily specific to this driver, so changing
just this one like that does not make a lot of sense to me.

Maybe mmio regmap should '.use_raw_spinlock = true' by default when
'.fast_io' is set ?

Mark, what is your opinion on this ? I guess it is not the first time
this occurs ?

>
> [ ] =============================
> [ ] [ BUG: Invalid wait context ]
> [ ] 6.9.9-sdkernel #1 Tainted: G O
> [ ] -----------------------------
> [ ] aplay/413 is trying to lock:
> [ ] ffff000003930018 (axg_fifo:356:(&axg_fifo_regmap_cfg)->lock){....}-{3:3},c
> [ ] other info that might help us debug this:
> [ ] context-{2:2}
> [ ] no locks held by aplay/413.
> [ ] stack backtrace:
> [ ] CPU: 0 PID: 413 Comm: aplay Tainted: G           O       6.9.9-kernel #1
> [ ] Hardware name: SberDevices SberBoom Mini (DT)
> [ ] Call trace:
> [ ]  dump_backtrace+0x98/0xf0
> [ ]  show_stack+0x18/0x24
> [ ]  dump_stack_lvl+0x90/0xd0
> [ ]  dump_stack+0x18/0x24
> [ ]  __lock_acquire+0x9dc/0x1f10
> [ ]  lock_acquire.part.0+0xe8/0x228
> [ ]  lock_acquire+0x68/0x84
> [ ]  _raw_spin_lock_irqsave+0x60/0x88
> [ ]  regmap_lock_spinlock+0x18/0x2c
> [ ]  regmap_read+0x3c/0x78
> [ ]  axg_fifo_pcm_irq_block+0x4c/0xc8
> [ ]  __handle_irq_event_percpu+0xa4/0x2f8
> [ ]  handle_irq_event+0x4c/0xbc
> [ ]  handle_fasteoi_irq+0xa4/0x23c
> [ ]  generic_handle_domain_irq+0x2c/0x44
> [ ]  gic_handle_irq+0x40/0xc4
> [ ]  call_on_irq_stack+0x24/0x4c
> [ ]  do_interrupt_handler+0x80/0x84
> [ ]  el0_interrupt+0x5c/0x124
> [ ]  __el0_irq_handler_common+0x18/0x24
> [ ]  el0t_32_irq_handler+0x10/0x1c
> [ ]  el0t_32_irq+0x194/0x198
>
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  sound/soc/meson/axg-fifo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index ecb3eb7a9723d..a22298f74b35a 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -328,6 +328,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
>  	.val_bits	= 32,
>  	.reg_stride	= 4,
>  	.max_register	= FIFO_CTRL2,
> +	.use_raw_spinlock = true,
>  };
>  
>  int axg_fifo_probe(struct platform_device *pdev)

-- 
Jerome
