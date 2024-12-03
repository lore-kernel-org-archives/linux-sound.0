Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400952F76
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228388; cv=none; b=ffwOGZAsNQeE1Y97oGfTFbbOLXPE3kaHIHntNzjG4tw/273TNfjBlBkkHUZOf41RD9uoaknR2XqO3INHHJH5r18ZN8BepVEybCnOCJZbcJohceJ+HSUT3y4jSRFA/zAaWrlBVpP46xRkPbaS5F3p/3+w5YvHMQPobD5uxGSIvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228388; c=relaxed/simple;
	bh=kpQG97neEOTfmw8LT50c3EPenmcddI5a2M0V4jVWKmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9PazRzGOvLhmPUc69ttWLGaOImppJhZktDAs5efYT4EvhpjPHrGLXYAUTQUOoh2EpaBtjrKJMlF0S37ROj3BwOM2DoJMXglmIJZ68T+IoX01IVBBdJXyn4/OK7YHG6QsZAFJkI6nPtiihZo3ITdzo70X40CGNKnWF2lKKNEaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zAWKXfM2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zAWKXfM2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de035ea13so5660685e87.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Dec 2024 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228384; x=1733833184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
        b=zAWKXfM2peg7BAHmz8T3EWRad4/q7t5dNAlCsWR8UImR7RMKl8lhDFFCQ70vqKCvPM
         1bEvuoHJ9lXpecjAcIrTfe3CUtzHoAXWkLQ/9YPNS2213Qiip6900QwCViM4ll1x5GoP
         IW/OgzPXeEQqZGeSWWHVhL81W2vRVn1u9EYhIMOsJ6/Npi6fhe7ubnWKwyoC9veWfSpK
         8ROMFxJcn0DgmLxuqayM+3Yn18zndg8l1UEJLthcXgtVomwqVwx/m28+rXyZ7tr/Wxh5
         UWAw3kDBNjb4h3zmX/hJP8rdwkcSxg92wFn7tZCiBStKPGXU6xlYQFR47eV6VvL33BkM
         Q+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228384; x=1733833184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n+OPgKd4OeVfRcOdyszAmWQAYwYUA33KJvbyrKBpj8=;
        b=mqxpCYF0LIG76YT565FKrKjAaFocRf3Rdl9cFMIP5o386YfRmulqmjFj7/tcKX5ue6
         bV4b/SXONZsigT9q+hWPEPs0O1fpNiPFHbY+oKgIyUTrSbiAAayZm9bxlkfGlTPmkfx0
         AMwIjWw/Kch00BnAqHOt9lyhgRbGu9WFKDD3Z/jkSxi+p8EUCWDEykZOzqcv4uNEBtLM
         Ou70/6ZYhjt0ibqgxk/1I8KoamH/eX4bzWY1KHy/2aZ21j7gsijeJqvxrTe9sXHKEnnr
         eowpKpH71ggx0KZJQ1b8tLi/D/sjAp9TBgz2FdIoUXD07WnzLnDCsoerVpHLqYrKccQ3
         LF5A==
X-Forwarded-Encrypted: i=1; AJvYcCVw5Znb6sU6CahYsAonzEndFQrMUYLtpUjifLxIzajVLquf9nH/fyzVi3UFxq9zY+yF8ZI1/e2wgCgEHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymD2C5Qg/b20ZHaGeQibZvdEfHqHXOPYVmjv1Xxe4ZNDHsARhI
	hRm5S6IEAe6rHgzgdmbHRe1FtH7Bk5BwDVDDfXBYVRALl7mzLDUqMRyVI7rvbGM=
X-Gm-Gg: ASbGnctopo3u+EA/06It5mvmO9Xq6e8DV4yjeSAnKxIVzkRRBN8qrizYZGxVIYrmXxS
	E2o+m3H1JP9xmluGFUSdWZ9HIQXcDGMNFN1j+rMDkMFF8rmwIScT4EwAvrZVO8krl3S79Xt4HzG
	fFoG3x8y5hmgovq+CyEcQOQMxvP28+piWsavlN3hmV9Vlv1p2IsRq+TARoFjMcvECoJDvwy4mgT
	qFFrMtfx0CAdOVNnl0wjWQnRJn5Noog+F88N2FtXl/r1gglSAFHQ33AV0THM2xamlXz1Pqos12t
	/751YUFprxFRKeQyys5msgasahITpQ==
X-Google-Smtp-Source: AGHT+IGqrNK3/JV3p7HUHgNYWUEc9ZkYpw0A4baw1aq7D6bW6M82dv1dR6gPJHjyZhTW0XLXbh3VUg==
X-Received: by 2002:a05:6512:32c9:b0:53d:e43c:9c5d with SMTP id 2adb3069b0e04-53e12a06a29mr1124957e87.27.1733228384467;
        Tue, 03 Dec 2024 04:19:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df643149asm1854312e87.37.2024.12.03.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:19:43 -0800 (PST)
Date: Tue, 3 Dec 2024 14:19:41 +0200
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <e7jngrc4nljdsksekinbkir2h76ztsth2xj4yqcyapfv43uryh@356yrxv3j4x6>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
 <20241202-industrious-unnatural-beagle-7da5d4@houat>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-industrious-unnatural-beagle-7da5d4@houat>

On Mon, Dec 02, 2024 at 02:20:04PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Sorry, I've been drowning under work and couldn't review that series before.

No worries, at this point I'm more concerned about my IGT series rather
than this one.

> 
> I'll review the driver API for now, and we can focus on the exact
> implementation later on.
> 
> On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> > Drop driver-specific implementation and use the generic HDMI Codec
> > framework in order to implement the HDMI audio support.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
> >  2 files changed, 15 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c00d593296a1e3ad 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
> >  	if (vc4_hdmi->variant->supports_hdr)
> >  		max_bpc = 12;
> >  
> > +	connector->hdmi_codec.max_i2s_channels = 8;
> > +	connector->hdmi_codec.i2s = 1;
> > +
> 
> I guess it's a similar discussion than we had with HDMI2.0+ earlier
> today, but I don't really like initializing by structs. Struct fields
> are easy to miss, and can be easily uninitialized by mistake.
> 
> I think I'd prefer to have them as argument to the init function. And if
> they are optional, we can explicitly mark them as unused.

Do you mean drm_connector_hdmi_init()? I think it's overloaded already,
but I defintely can think about:

drmm_connector_hdmi_init(..., max_bpc, HDMI_CODEC_I2S_PLAYBACK(8) |
HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_DAI_ID(4));

or

... | HDMI_CODEC_NO_DAI_ID)

The default (0) being equivalent to:

HDMI_CODEC_NO_I2S | HDMI_CODEC_NO_SPDIF | HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_NO_DAI_ID

WDYT?

> 
> Like, it looks like the get_dai_id implementation relies on it being set
> to < 0 for it to be ignored, but it's not here, so I'd assume it's used
> with an ID of 0, even though the driver didn't support get_dai_id so
> far?


-- 
With best wishes
Dmitry
