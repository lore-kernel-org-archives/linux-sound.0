Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624719D88B
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462953; cv=none; b=k5Au/OZppi1PbaIgFFO4mw2OYThar05aOctmoNIykVvzp6pCafJ/bAfzjniqhuIE5sN6CduNKrqachPboUnHZ7EAeAr7mvsMSW3lK7AH4RBLlWLYWZrj7A+3vnLVfCCugvmABaoDmOmGsJ7N8B3tBVYcYpU8kvKoFmnQ8qV71T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462953; c=relaxed/simple;
	bh=qtcPJL9JZ3Qlo8jAoWPIV55eqSOR2oLeq5CJfNjra3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwzOIvBEhHmsKnHL4GHQm6NFBkYcap5q8f9SVmHCD3S5mjtGOANbZRRNOTvCa4Ytu7i77Hiz6Wd7x1QeEDkDadr8BA0BwZOeqhx3INf87sbBEaZUkl5l7hVTgPxz2mIe77yBqNsVfZDqp7h+LrurVQnKU9HjhOwX1dbPTM0hsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJS3QTa0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJS3QTa0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2558738e87.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462947; x=1731067747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAhQCRcMiUmuMbWiOCOKS1oH6Z8vsXpQznKWvE4jlME=;
        b=xJS3QTa0j1k1mDsbN24Ng0E03o1G0FK0L3PW2E4uoz+spkEaU/gUUUjmL92cnO3X26
         HH1ZIQi1FOWI8Z/jdIwsEnmtc04WaBndkS5TeNK5Ch4ZkRTAmtnOHvR1WA4NshuAwSBD
         JZ8z4EFclCIy3nD9LIvwqh8oD+bs5ppRXgZhV8x947HIbMS+9HNLJzdx0pxsChJjNniy
         Q/hLAGZF8hcx5ot0tfe9xTlHasy3vHCcQ47+fIWGad+cfR/fB096GTCX7USJxHB3nvDg
         /1Yj/66mnn/e5ngQFdijGHEAeIxZ7sm4L6bpypfaKYqA9XJRvSwSwuuqwDtr3+uB1AI6
         zZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462947; x=1731067747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAhQCRcMiUmuMbWiOCOKS1oH6Z8vsXpQznKWvE4jlME=;
        b=ks1eHz7AoL6qQw2JGDhIn+r4RE2UJjzNMHvzbluK5VSgOXqHITqiqeeV/oUXv1Akte
         i3KqxqlEknVvGEnwhfD+BlGnIAltUVTwMMGEKivvf5bmD0Hg3hTbxCjwh4Ww67IyP8GZ
         SR7wj9Pk0w7EoQwe3DeTP/ZjbNAHhsXuO5eOCCWvqoOdNpc4972UWzKcgNjONONZVY3B
         NaVDAbYO9Shn4DfxfADZonEXEltW8XNSHYL0qGmZ5Xe2gU/f71Mik8RmNuJ9+I6zMMtr
         MqebSTjnOHqlTXbhbgJkkKYDIQvjKVNjDJf/gXjD2UFGdyUnaUCX43aeHlKEuSYN5nas
         k6gg==
X-Forwarded-Encrypted: i=1; AJvYcCU7KQF1bH7gstdyfJb/1HEXbrX09MfUQqIpA1AT7jPe5OfPDy8lr4MgQ3L8/nlutZso719UTYa4XBYQgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/45v9LIahT4hBSLpAW9cgkCnA0yfzJG+wAnaBI+PZ7ODv+qR8
	1DV2irdPNDC4dUOJ+QQk9qUM3VX/G+M0BoNE+qIdRygD9Tp0CN+I8yyIDURCIU8=
X-Google-Smtp-Source: AGHT+IHyAbSEgE4oV7BsWrSuBbwGPbBwncS1nrZBHG68qMqQ1XtsqRRKKfWPtVih1dkSCYyDRwz/RA==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53c79e15746mr3712339e87.5.1730462947418;
        Fri, 01 Nov 2024 05:09:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc959casm536926e87.49.2024.11.01.05.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 05:09:05 -0700 (PDT)
Date: Fri, 1 Nov 2024 14:09:03 +0200
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
	Alain Volmat <alain.volmat@foss.st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 6/7] drm/display/hdmi: implement connector update
 functions
Message-ID: <26rhzrhn2vjq26foxifsuytby52q5ggxwvhpnozuaschm3iq2g@rimrszg6s526>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
 <871pzvjk2t.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pzvjk2t.fsf@intel.com>

On Fri, Nov 01, 2024 at 12:59:38PM +0200, Jani Nikula wrote:
> On Fri, 01 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > The HDMI Connectors need to perform a variety of tasks when the HDMI
> > connector state changes. Such tasks include setting or invalidating CEC
> > address, notifying HDMI codec driver, updating scrambler data, etc.
> >
> > Implementing such tasks in a driver-specific callbacks is error prone.
> > Start implementing the generic helper function (currently handling only
> > the HDMI Codec framework) to be used by driver utilizing HDMI Connector
> > framework.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h     |  4 ++
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index feb7a3a759811aed70c679be8704072093e2a79b..dc9d0cc162b2197dcbadda26686a9c5652e74107 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -748,3 +748,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> > +
> > +/**
> > + * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
> > + * @connector: A pointer to the HDMI connector
> > + * @drm_edid: EDID to process
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data. The
> > + * function consumes passed EDID, there is no need to free it afterwards. Most
> > + * of the drivers should be able to use
> > + * @drm_atomic_helper_connector_hdmi_update() instead.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +__drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> > +					       const struct drm_edid *drm_edid)
> > +{
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	drm_edid_free(drm_edid);
> 
> Not fond of splitting resource management responsibilities
> asymmetrically like this.

Ack, I can remove drm_edid_free() call.

> 
> > +
> > +	if (!drm_edid) {
> > +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> 
> Is it a good idea to tie connection status to EDID presence at the
> helper level? Nearly the same, but still orthogonal.

Yes. We have been discussing this in v1 review. Basically, CEC, HDMI
codec and some other features should be pinged without any userspace
interaction. This means that get_modes / fill_modes is mostly out of
question. The final agreement was that the .detect is the best place to
handle them (BTW: this matches the i915 driver, see
intel_hdmi_detect()).

> 
> > +
> > +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> > +
> > +		return 0;
> > +	}
> > +
> > +	drm_connector_hdmi_codec_plugged_notify(connector, true);
> > +
> > +	// TODO: also handle CEC and scramber, HDMI sink is now connected.
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_update_edid);
> 
> Feels wrong to export and document double underscored functions to
> actually be used.

We have enough examples of EXPORT_SYMBOL(__drm_foo) in DRM helpers. But
I can drop double-underscore if that's the issue.

> 
> > +
> > +/**
> > + * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
> > + * @connector: A pointer to the HDMI connector
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
> > +{
> > +	const struct drm_edid *drm_edid = drm_edid_read(connector);
> > +
> > +	return __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
> > diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
> > index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..ea0980aa25cbbfdd36f44201888c139b0ee943da 100644
> > --- a/include/drm/display/drm_hdmi_state_helper.h
> > +++ b/include/drm/display/drm_hdmi_state_helper.h
> > @@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
> >  int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> >  						       struct drm_atomic_state *state);
> >  
> > +int __drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> > +						   const struct drm_edid *drm_edid);
> > +int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
> > +
> >  #endif // DRM_HDMI_STATE_HELPER_H_
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
