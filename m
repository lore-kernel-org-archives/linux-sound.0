Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C111426C
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733282299; cv=none; b=Id0UtUets4e4XR9FXrDjCuGcy9YfUCLBtE8dXeiIjxMpSlCs33H2mPQy9wC7DgSjEAPASwAuVyog3aUVvE2kJIl/e18ypvymIEfbFSRKFXbAZKDQs0XveO9YwNPBAqjG10kLV1EYwIZeLDUwDArGW/WF0YG8dR2WPNslXgslG7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733282299; c=relaxed/simple;
	bh=ZzkoTxzFwdN3sVW4Abdq+hmUBfCh0XNTwwDjGZQPyUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jo4LE1NyZGDtDbp2VDG0DhNvPEurNUQRu1Nf6wHrO6ZbMbNiv4jj91YsWokiYsda65TYML+YHuw82uuoRgEJGHL/L+WWR72qKAWL4Z1HQA7QXpxxAZ/tUoBjTMyWvlWDzZ8U9z8qAeYa92te0hXLKzmcfTjdBKLaA3K8dioquLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HF6HVH77; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HF6HVH77"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df63230d0so7629205e87.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Dec 2024 19:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733282295; x=1733887095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=HF6HVH77ngef3B+UTvtrlFveqt3xpWkslUZUg/vZFQyLiy3Aulw6yfYt33icJqK17y
         Kdrwt3tJCCKfHJiJ1mC3wIPVn/55XhFjl6V/knHpY66hyKzYsdJMx/VRdH0c0nM91Wic
         +B5vPP2XykFsEzXU8lyAnmXzpJFLscWkkhP+SJkuDtbsevJZZuSCibBVd9pnmw2BDlLh
         0nKuEwm9YkAHc/gZ/puek/Rzglv6uKT348+3bZKTq/tHPB5QwsnqcZscbhUpBbwgY/RY
         LAcPVR7QNXZUTbK5kMcoLQllN9hdmtEy7lN8jN9litFYUF/Qib0D/XGhIEaFQeW3jzXf
         M4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282295; x=1733887095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=BQNuYsfe+tww+3iduIDvf3hfvxbvmHGdgwNySB8+cALP9bTu4jacp5c/aNo1oIR6QC
         pEAZo+h2o00lR7hGNxXYQepOPlLXmCTFlxQ4XtajnwAzTq0Ld12TKfNd2kFfyxP6RUjT
         uUSXNzFO0+7EwSY+PKSF44SY7ZtJPRUkUyWjXCcSC4puh1IykT0U3B8SNnYY2rbTKs3M
         tdFHmLfLQBjrWCbqthMhHLNVIAXHkYlvGK7APZH0gDDWPNu+FgSWqicWnjBwgM3DvKdU
         KKpJ1NND5zs0bRq6WRmDg7hrz0l/y9KwoiXPNqBDLcy5jLaOSvP9Ob+rQDXBK0cA7GJt
         nJiw==
X-Forwarded-Encrypted: i=1; AJvYcCXke7gJJNIeluWJQXK3jXJvXsVxYjMxnGYqLsIYCym2gJuGbnjRjhVm3d9rq65A/dlGMDgBQMkO/2zNng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWNdrDq9zQSsfkb/R42hQISVUkYFT0529Krff4vY60G5IQoPVV
	reedwiJFQLlzNHa7nCGvcJL5wbrriQO2oPoDxOKmHOpKcdhor84rSpC6EeUOeeU=
X-Gm-Gg: ASbGnctQi9E6HfSnBK0OW0O8GcK9YSbKzryR+hsVDAGyIhYRWn8fydSeaFCTkWL3F+X
	ikd7dUl3tJlmNyUMewD/E8ZcUpBlcsFfrtQf/2V9VmDXwJo4tEpwwKogNXzGxyyVj449fI/iBdh
	o5pfq1Rr6AN61z34sXPfmX1BDQ42znS/1FdSzvjm5DsUldaXMZKHu2bWpt3ODeUnYQsH461zPlz
	fULdMttXfJmxmzNpYntVbUdLnZ+Als5EiKqpVTjPoqRY9Q3VP/Fdw1jAuoQxmkr4sEAM05DdiG+
	iyOdZ7aqMEkWWCJzqKfODRe+gOoz+A==
X-Google-Smtp-Source: AGHT+IFJX8QZfHrEBC9Xxxj95DpGajpX3DiwA7TRxy/4ydOL7I3C5fwKfR6CJxAdfz87Jxn9zNInqQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a550:2885 with SMTP id 2adb3069b0e04-53e12a34282mr2179215e87.47.1733282295266;
        Tue, 03 Dec 2024 19:18:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f13csm2058532e87.230.2024.12.03.19.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:18:14 -0800 (PST)
Date: Wed, 4 Dec 2024 05:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
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
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5dc4zd5.fsf@intel.com>

On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Extend drm_bridge_connector code to read the EDID and use it to update
> > connector status if the bridge chain implements HDMI bridge. Performing
> > it from the generic location minimizes individual bridge's code and
> > enforces standard behaviour from all corresponding drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
> >  1 file changed, 53 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -17,6 +17,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > @@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
> >   * Bridge Connector Functions
> >   */
> >  
> > +static const struct drm_edid *
> > +drm_bridge_connector_read_edid(struct drm_connector *connector,
> > +			       enum drm_connector_status status)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	const struct drm_edid *drm_edid;
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_edid;
> > +	if (!bridge)
> > +		return NULL;
> > +
> > +	if (status != connector_status_connected)
> > +		return NULL;
> > +
> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> > +	if (!drm_edid_valid(drm_edid)) {
> 
> What's the case this check is for?
> 
> My preference would be that bridge->funcs->edid_read() uses
> drm_edid_read*() family of functions that do the checks and return the
> EDID.
> 
> There are some cases that just allocate a blob and return it. Would be
> nice if they could be converted, but in the mean time could use
> drm_edid_valid() right there. Additional validity checks are redundant.

This was c&p from drm_bridge_connector_get_modes_edid(). If you think
that the check is redundant, could you please send a patch dropping the
check?

> 
> BR,
> Jani.
> 
> 
> > +		drm_edid_free(drm_edid);
> > +		return NULL;
> > +	}
> > +
> > +	return drm_edid;
> > +}
> > +
> >  static enum drm_connector_status
> >  drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> >  	struct drm_bridge *detect = bridge_connector->bridge_detect;
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  
> >  	if (detect) {
> >  		status = detect->funcs->detect(detect);
> >  
> > +		if (hdmi) {
> > +			const struct drm_edid *drm_edid;
> > +			int ret;
> > +
> > +			drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> > +			if (ret)
> > +				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
> > +
> > +			drm_edid_free(drm_edid);
> > +		}
> > +
> >  		drm_bridge_connector_hpd_notify(connector, status);
> >  	} else {
> >  		switch (connector->connector_type) {
> > @@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
> >  static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
> >  					       struct drm_bridge *bridge)
> >  {
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  	const struct drm_edid *drm_edid;
> > -	int n;
> >  
> >  	status = drm_bridge_connector_detect(connector, false);
> >  	if (status != connector_status_connected)
> > -		goto no_edid;
> > +		return 0;
> >  
> > -	drm_edid = drm_bridge_edid_read(bridge, connector);
> > -	if (!drm_edid_valid(drm_edid)) {
> > +	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
> > +	if (!hdmi) {
> > +		drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +		if (!drm_edid) {
> > +			drm_edid_connector_update(connector, NULL);
> > +			return 0;
> > +		}
> > +
> > +		drm_edid_connector_update(connector, drm_edid);
> >  		drm_edid_free(drm_edid);
> > -		goto no_edid;
> >  	}
> >  
> > -	drm_edid_connector_update(connector, drm_edid);
> > -	n = drm_edid_connector_add_modes(connector);
> > -
> > -	drm_edid_free(drm_edid);
> > -	return n;
> > -
> > -no_edid:
> > -	drm_edid_connector_update(connector, NULL);
> > -	return 0;
> > +	return drm_edid_connector_add_modes(connector);
> >  }
> >  
> >  static int drm_bridge_connector_get_modes(struct drm_connector *connector)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
