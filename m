Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAFBBA4B
	for <linux-sound@vger.kernel.org>; Sun,  8 Dec 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733656014; cv=none; b=RG64Fppb8MXZzHybQ+/WwsbTpXGtlT2UINx4iAzbD8DjMBhnutk96tI9OXyklykdVEBXPMYGpDGN54SyPMdwggwPwB/qhjciiEQP6ofWOLj1BQysZCgU2OCmXGv08LQGLPLKa5b/i4aO3ze6coE0b5Ag5t2qNbj69glP2gI70DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733656014; c=relaxed/simple;
	bh=PwAoSFiz15fssqKwl/0oxPB7GVuAPX1ERfj0WmPEonY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tu0BvM+GEOPfWXfgY0R6uy4fIs2usBpq95PaQgxQOCXyV7yr/nOVmwi4ffKvT0HezFO42KEa/hWfzgV7KkBVtd5Vr5fPoVE+mNKTAUKbHghH1vaGD1q5IwTzXEBq0zLDi/yv11uz21lZA+cF9sqeBGXlJYDX1sUWybUNaPnLKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8Cvh9HY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8Cvh9HY"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3c47434eso633279e87.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Dec 2024 03:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733656011; x=1734260811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MgmDh4KwwG/UnaAkdqryGTFKEgNCKuqZpZNBZIAjct8=;
        b=N8Cvh9HYjOM7os9dakPUFmWU37sZ9uMar2If0sPtqzirnBKChKJ7NbeQFUbJMSzboT
         uUL+B92hZ9pnMydkgzrDQbHeFe8C+L05VxUUKQ6sK8Q1DpVhkN2uhLuySDwuhDzaDcZH
         KSA+pXaZiXfE32FV/7JyDlsFqMSwKyfQ9jyVCW8l4JVmz/x43Brp0Xr40Ik31HhEBF2C
         v3ogZ4LBQ3q0P2E0WArFzvjjyOWUMQ9zJMHhbew9vwli89l8aLS4F+daqD2owh//uLWu
         ZNtfFTlwAo1qQl58aXqI6mtoLZ07so9DcLfXWk6VjGfAzLVZot6Xtu9FLQ3fxtTJbXnJ
         Q3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733656011; x=1734260811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgmDh4KwwG/UnaAkdqryGTFKEgNCKuqZpZNBZIAjct8=;
        b=U+5QW6t0WajcyVQ+kVfg0ONI9UuFKZe2tAO6O4ZSg7B1sKB5mIDmKP+Xad5diZLRvt
         eZTkYWolFpa2zRk7hCLlKgMFI8OM5x0HunJBQw+rPrDkXhZVFQXSCIaukBDKmRk/q2rQ
         T27sVHnQdmAa/FSxKK2+IzFKvD81DPsKKzOxuUJ5ghvX81FCP1UsW9d2KVAugXwMTIPS
         SX7rhxkxH66luaIQK1SyJ6Wmzi+XwtjoV5y9a7O5dXBFIRG79aV0LeWX9g9St1riIHM7
         2RWduo4/rk6rgZvy06Ac1s2Bfjdx3SY4zg83Wj7zt556ZP7ZKk6kilgL8GMRBFYbwaKe
         J8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVxe05EASdvm7nCgTlKfk3Q3Ye+Tgz73xeUzEEx8i0ydiAEbdyT7YyShAxO2Y+4pc4qWnFTvs/DBkD6YA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxef4ljcR5qLYJ9fAYrNHXajz1yXCOlRBiub2U+nkyeDhoW2Bbz
	3KaOjUgLChLBkoZx4f0fUMLYJyzTFbINlznIidRPEIBBgS2VFr+y8ObOg0T8IYY=
X-Gm-Gg: ASbGnctGut4AcVSqg4/v5koxGFMdj/Ro0Cv55HHhu1GRl2AUqpTvUUtmTcxuXzXL8/O
	x5axxMcPzTUE/aiELDYK7JjwUYHQ5Y4q4muCEN+5ZdOJoGxl12ChsunVyUjmopcJwnRaz5L5kpt
	FmD4gHzBDAglgiPLV0hs1QYCn5l9DuDaLp4RzGMBVmChw9MSEERw9i5fCHhqqxY839YpQrWdFO/
	/LrwU2To3Z2M7J2nq0rdURz5chjs+b2t1RQboN5PIjWSa94bHvkwUzdb+CJdOGfWEYOoXPJXCni
	wSW/fVOVDCCg/MppH4qpZjEX93U/2A==
X-Google-Smtp-Source: AGHT+IF5QEJjlcVoMCHYbEL9bkvB8NPE0fGP+5uB3Gu8Bcq90JNJIBJcqtP7X6LzerdMng+XvLTRkw==
X-Received: by 2002:a05:6512:ac4:b0:53e:3a43:9245 with SMTP id 2adb3069b0e04-53e3a4393c1mr2104284e87.28.1733656010740;
        Sun, 08 Dec 2024 03:06:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54019dc9a76sm309093e87.274.2024.12.08.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:06:49 -0800 (PST)
Date: Sun, 8 Dec 2024 13:06:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-caped-proficient-rattlesnake-c882f3@houat>

On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > already reads EDID and propagates it to the drm_connector. Stop
> > rereading EDID as a part of the .get_modes() callback and just update
> > the list of modes. This matches the behaviour of the i915 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> >  1 file changed, 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> >  
> >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> >  {
> > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> >  	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> > -	const struct drm_edid *drm_edid;
> >  	int ret = 0;
> >  
> > -	/*
> > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > -	 * .adap_enable, which leads to that funtion being called with our mutex
> > -	 * held.
> > -	 *
> > -	 * Concurrency isn't an issue at the moment since we don't share
> > -	 * any state with any of the other frameworks so we can ignore
> > -	 * the lock for now.
> > -	 */
> > -
> > -	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > -	drm_edid_connector_update(connector, drm_edid);
> > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > -			connector->display_info.source_physical_address, false);
> > -	if (!drm_edid)
> > -		return 0;
> > -
> >  	ret = drm_edid_connector_add_modes(connector);
> > -	drm_edid_free(drm_edid);
> 
> I don't think that works though, for mostly two reasons:
> 
>  1) We're not sure we'll even have an hotplug interrupt if the system
>     boots with the connector plugged in for example.
> 
>  2) afaik, the get_modes ioctl directly calls get_modes too.

I think both paths use .fill_modes, not get_modes. And fill_modes
explicitly calls .detect / .detect_ctx. It would be nice if somebody can
verify the change on the acual hw. But as I wrote, i915 driver does
exactly the same: the EDID is read / updated in .detect_ctx(), while
.get_modes() only performs drm_edid_connector_add_modes().
Okay, there is one significant difference which we should probably patch
out: the .force() is also implemented to update EDID in the forced case.
I should probably do the same for the drivers being handled in this
patchset.

-- 
With best wishes
Dmitry
