Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC11F5410
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444598; cv=none; b=Qz9XuUv7NcXD37okLpS8bJiExc8rbiI36dA2njKt2HM8pPMzJmQwT9/8e2ROWf3jGWIDxYf0gY8KA2Yw9Udi4OGp6MGEBYEom+8I350h+Q82hAX/DtzDK+AgrNBPkXUgMQcxJf3DXcSvEXTXPTpkV3x1HyUuhQwuJcAaVF9hDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444598; c=relaxed/simple;
	bh=DTVaSDi1vlTbB2vKF1jfNBqEXNtrKAZiazfohZg5+fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNjY/LF2Fn9gmG2YU+KZdcTgkhQDYZezJtP+cc6XI8BLQ1o12z+/3ud5YjbNDcVfPmncC+uqLr64ojnoLHoJOThWbXMdNYVFbsabjLh3u7UBzZEiX2TfyB6HX8yQwiw3DnAgmhc3ex3KVOpinxMAuAp3PPl+pwRtZd4sLyl1+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQCTsnao; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQCTsnao"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7267829e87.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734444595; x=1735049395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mV9n8rD9lCXVFxHRKSb6HxnIcMmuUp+M9EhLoSWf19Q=;
        b=UQCTsnaoIPaghcR45Bn6jeRU4UIGXrAhQVeWxbySq/rKYvxCz4DHWGNLI56MnoIht7
         VAy2umfmf1+pGUBgRrAYv3KM11db/AHKiFnc0QGM8AjnGaHZ0wLZ1qDIEsXkew4nlcwl
         vvR2Llp+MqcunvR+fDAT+LfRQH1+zpmPzyaA4XHMrb7ysk/WKrU7QAcknFyo/OjEa8LV
         mkPJ8NJE385KgNpDVvLenhqmCsmlUy+jaAGDm4GXD094UFAErm8h4a7fccEFsvEFwMvu
         7ygZwwUSpAf36JhkK2X3TM8wxJR7I+F1vs0jWV+XtkdGX/FOl3bE2FNW9Tomk5Lwd/FK
         iNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444595; x=1735049395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV9n8rD9lCXVFxHRKSb6HxnIcMmuUp+M9EhLoSWf19Q=;
        b=CfahrYvxXRdlGfdLMvBT7Suh9AbzvLCvj5H4T0E2nJu1r7dhbJV7kXDWcM5V8HwFoC
         5nlT4IHzOsDkjpVePBZdILPkggbP6Od9Pg+9iVXcdd/Du9MoWsgHVf9krq/lzqnm0V5V
         dUa4mDQVWuegp+jPk//qiWacWXsOk6xegMkLdcjtysg2d8f5b1iA2Mraq84BWkyHlBsK
         D/7Rnjllsk5NZ5hCSEGciIY5KxAthom1u5nFjexL5QXgF+IRimK9cqwV8WNb3jEiN284
         MIT0mVFvkKOg26jzopkCcI0YkqUnCZZq77gkvBAEq8LIW5TnoO/h8YduMryR2KfFjJCg
         AZHw==
X-Forwarded-Encrypted: i=1; AJvYcCVvFsaybdC3oN1nqfbmxHPCirsV5SWPxxCZT1G6EgBkHvA80RUspMXAVJV4L8LehU65eCGhW/t5S0iXIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrUjyWMBkZZp06CEK0uVeFKFr1zfytjGwESZGFLiALnz9AR0P
	oQfMXYMsDjTjvMpy8mE74lpG9yWb2lfZGc2AsoBbS7jpw7Pk5BswPoXItqJ9VCY=
X-Gm-Gg: ASbGncsjRg7XoPp/bHmxeQ2kvXtPD4C52TB4toQNRezBR9lvU8i8CvD/rKct3g8bSUJ
	68Es1P8OZjfQ9e8iOHdckO2Th87ovYw+lTxI8fOeUWZer/ALLRThgscQllYD/Ljoy3dKBBAt6uh
	kcGA0obYV8N/cuppkapLZeIsirKoQbrI7LVWK1xQEZGgb+JO3+lSyDU3GszpHL7qU0saoxHwyCG
	YFuTetREsipSU41yqkT10EjKNmZ8gThbkERX4W25NA3IBsAZG6xZkL80HG30y2LtJeQAdTORgRF
	SDlkO5ok86F2Sb0tWevNzLPFgdogTf9Gsurx
X-Google-Smtp-Source: AGHT+IHTf5dvyD0mHW1jS/2vTroVhCSJd6opzQzzWVJuSVJWGrT5Dsv7wwpXGqTnNzyEJctFejbUSg==
X-Received: by 2002:a05:6512:3189:b0:53e:3a01:cf4d with SMTP id 2adb3069b0e04-5409055dff5mr6856692e87.31.1734444594653;
        Tue, 17 Dec 2024 06:09:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9dcbsm1166017e87.73.2024.12.17.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:09:53 -0800 (PST)
Date: Tue, 17 Dec 2024 16:09:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <kyytu3nofrjkajwatmxdyav7oekkeigrhx5amddgjtlpsdl2m5@3moqad3gfds5>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>

On Tue, Dec 17, 2024 at 01:36:29PM +0100, Diederik de Haas wrote:
> On Tue Dec 17, 2024 at 1:40 AM CET, Dmitry Baryshkov wrote:
> > This series depends on the ELD mutex series [1]
> >
> > [1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org
> 
> There's a v2 of that patch series here:
> https://lore.kernel.org/all/20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org/

... and it's even merged to drm-misc-next. I dropped it from b4 deps,
but I forgot to update the cover letter.

-- 
With best wishes
Dmitry
