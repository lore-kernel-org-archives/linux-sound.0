Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364032066DC
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371394; cv=none; b=ognJK0izl775OaCsFqteTJ7wcH+dCxvLe12iivF8pZZZktDIP4U5UjjzNVNsmLAEmIxF9pKvbLdFKe95KebhUyGpQdP+ljwnAJQvXKWNIrG6pVwC5sUofO9df7htdfiNKOynpkEGPuZjTBbzBN1Lez83HaScPnpqwGPEsqm0ydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371394; c=relaxed/simple;
	bh=lfnA6uNiRFtkap/7RIz1BvgDV1eEViN/vIY8Ipgyylw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxFn/6NLjlSQzsaR42Rq/7BO4KIp9vPw5iCzdid82BhPfGTyyyKp4P4erPZ+f0NE6rNdIm2peTa9lScs+W2Sx/p6im4qFZ2byvOSpkeCkGb/8nor5hhsHPdR0jrBO6F42c/2QP+MfWaih4TpVNvBNd5e0PohgIwTAMY6xML9bRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5OHQPqk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5OHQPqk"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4383730e87.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371390; x=1734976190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
        b=k5OHQPqk4AhfS2c2JG/Ypk1h8bZn3NJUmfm6MAsdzr8pAB/ASEyp/2NnI8hs4UD3M/
         oJNS7vWrvuaclFxfn2xPwV/JXSNkAg5akxK/0M84o6T/pwQP5UDdjKBQRnGKxLSdz/7t
         ntqPCvWe3G9cTltV5tV5OSkKEBW8roArU9duQNWH6CHJi0dqDgKg/YTJXygKgslPT63d
         TGfCY+T9Sq2kBJ9ricerdEB5Swd1QTm8vdCHPQmB/OThSPJNIs3YbskS0clqI9U5GPhY
         JOt0NhUfwHKue7dVz3//BrtY4viSZbAeedXdDdYe9euYEIfNoHnBVVddjraw6ZXs/5tW
         Swxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371390; x=1734976190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
        b=uklA5rPKw3krNdeAtqfVO7GoSTvijp5D37TXPzRBF81aaK6cu0rMeWndIdK6jFrNY8
         dk3nvbzSJ4yy2xgdc2DVLL45Nn+sMlGSQtCfu0aoTb1mkceD5JDpzfSWoCTJjfeUcZr2
         Mtb/DJ0wU9qH4BXk/blQxaLb+A6XW4biv9az0rU5IKK3fvYsp1Sr1IpXbDf0ERKa3Ow0
         +BrXhfxhPKG41WZspsk1qTzqgOJkf+PVUDRWzQEyDf8D6gvVU4DS78KubZGKgz224NS5
         ElMuDVe0QFZ84VzONTtbp1Uk9DPoClY18eirjJv4DSphgDQB/iDp8qXyRzwJtgtLT77k
         CYrA==
X-Forwarded-Encrypted: i=1; AJvYcCV3I7JBa5eqGp/sjfXRkdRIoqs6QJsOHSS29cdZr7kXhq/0HDt9dPIhWEtcAvcZSyBvOHTla+0xDeJMKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiG0VUO2AxffW5cAqyjt8byVxeIZMNxQvxXZF9SvismKhd7AB
	yT9xjBa3L06/4qhNBkScoZEhZs8SCqWWdy98BFlzGF83kSOS84MA0d8q4A/uECo=
X-Gm-Gg: ASbGnctezp5mWh8u7eXcei+dZIW7FV9P2f6yEJIzmC48WAczYRSuDrAPKBJjhsmnGUf
	PXm1/uJJAL9FdPGX8BA+RFuY7NIrYA4tPffm2E/3tzQRHsDA0IYJOqr1UOmoe6tEB+R5dxy6Ji5
	S2lTBf1QrqMwN9ez+rTTYXgt7woqcqSbvUM/R8ZwHmT3N2wqxJTyC2a3OHSPgvVzp3bcmMivRw8
	mxwh5//WvG6EK17LZplGp/BiqNtJ+bEfe1GwxcIw35AndAuEZif/sU5Orkh/88JJnVXqs8BWPWX
	rknP/lFzl7wEt/R3DizzodHb8eVpuDTL/cQ2
X-Google-Smtp-Source: AGHT+IGejqU6hvp6CTUn8Lo7kd3aSi6GmIf9oBeaAY0N0VSQP5YDDaQsXS6dw98iZgXbtRgL0xzwjQ==
X-Received: by 2002:a05:6512:31c6:b0:540:3561:666f with SMTP id 2adb3069b0e04-5409055837amr4736533e87.20.1734371390228;
        Mon, 16 Dec 2024 09:49:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c0031dsm921971e87.117.2024.12.16.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:49:49 -0800 (PST)
Date: Mon, 16 Dec 2024 19:49:47 +0200
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
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <3su4cgtkkysztdvog24tkltvcflfbhdb24c2acelmbtt3dbm3n@dxtsuiqnxawz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
 <20241216-benign-amiable-grebe-e0b3e1@houat>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-benign-amiable-grebe-e0b3e1@houat>

On Mon, Dec 16, 2024 at 06:14:43PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:15:58PM +0200, Dmitry Baryshkov wrote:
> > Add necessary glue code to be able to use new HDMI codec framework from
> > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > hdmi_codec_ops interface, with the functions accepting both
> > drm_connector and drm_bridge instead of just a generic void pointer.
> > 
> > This framework is integrated with the DRM HDMI Connector framework, but
> > can also be used for DisplayPort connectors.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 100 ++++++++++++++++++++++++-
> >  include/drm/drm_bridge.h                       |  38 ++++++++++
> >  2 files changed, 134 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -21,6 +21,8 @@
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > +#include <sound/hdmi-codec.h>
> > +
> >  /**
> >   * DOC: overview
> >   *
> > @@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> >  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
> >  }
> >  
> > +static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (!bridge)
> > +		return -EINVAL;
> > +
> > +	if (bridge->funcs->hdmi_codec_audio_startup)
> > +		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
> > +	else
> > +		return 0;
> > +}
> 
> Nit: it looks like you return in other cases, and there's no need for
> that else.
> 
> I'd remove the else.

Ack

> 
> Looks good otherwise, once fixed
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
With best wishes
Dmitry
