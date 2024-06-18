Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370615746F
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718703279; cv=none; b=AVYPq1MokkkhK1VuW/q044PjRzSOllOVwENP2bpSEwQ8ccqkKwhjfnVr/bh3FaIPRSR0C4rKKjaLX4h+LVptyWg4gIB5t88N0eORDYzg7iWVUFidrzw1VN5CrUeQzkCnuB01V9BpKHnNgYqzF0WgjGIDHMZHc9s/GP53hB/1Fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718703279; c=relaxed/simple;
	bh=OwBXLxTgIxhAvEWHZw59Np1NM6d7ZgJiEzitI93blL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv9MRhiBnCGjRyAT2CQ3WCXB0jouxgMNjlWt9T4Q5iLtc4M+RVYPHbDRnC3WdM2hhR3JWunQrbv3A9AOmSBFEU98EQh3J7CgRlbx26NEsmLU2sxPp4ngVR0+15FWz0IAlXEkgJGiUinDyLlhSWCxVYP4bZfYGoAIpyj55VwiGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kF+aDvLh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kF+aDvLh"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebdfe26217so49211041fa.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718703276; x=1719308076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OtPQx/Pu4izNrX/Re5hWMRulfkvuWWXAK3KKNMzu7g=;
        b=kF+aDvLhde4JkYi3rCKkxUD4K8OiLz/i6+/l8oD0Z7ZQJQI1MqN0ohZYJyL7VP4YSy
         EeNbjb3Cr3RYPiLV4EZ+pir/WeF3vdWFtD/6DbDmBQwXJ+z544pgmDU5gKp3pGAuPkFu
         R9uVoohSAv938mkWrpQodb4jLifYmmuE5F9icAg+Lig9Z1w9jRNoVGAMUHQtWrQSCW08
         gTvI8TGdv2ug/uQMUPWfjeOwFOiwIBhPkMhJA25loyOi8vnUh4Y7ApJ/+a0Pw3/hpsHf
         i+nYj37B0OZkRo6Wx6QQ7amjWAPyM5eJX7TkqMDgK0aHzCOIu5URjYmzmYcjM8aJypvD
         uMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703276; x=1719308076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OtPQx/Pu4izNrX/Re5hWMRulfkvuWWXAK3KKNMzu7g=;
        b=iBzwF6UgSEvX9RRKjCaqYQBq0gaY8keSOoZg9nJ3mAJLxISz9Bjk6b5Q51AMNHL0I8
         lJJnMcMCxLxyJVBz61FI9hwkA0Ue5ZkKlsb8g6Yi/gASwZjAhotbOLvOF6aBALnYW0KU
         g/gojX8cYvw3s5xK1ZeZ/wLf8nbLf4RaZmth5ICkV5glUlQTiVDU5wwi3Z8K2zKFOr0r
         FqP7Qb8PB8A0wKbq0Yw4zEgsRGDbAkgbbM2N7A3pTxZCry3xgJAt6fTiCLSqfI6OZ/D3
         Lgre1FQlT6IBgM+UJ+qq+I8Q0h5NXxZx/IlZRFoUOwfwjfc/s9tbUh4Et51+j/A4LGmC
         +9uw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPVwGMNaEioxCoqNGrTQMFyt6L6PKKHWNfxcsXNFzaBleK0Fv4wESh5ePX4i7MfpQpWpYAZ3/uX8ILznF1YamuEwkzj9cTLSJvpg=
X-Gm-Message-State: AOJu0Yyf2dx1usyYGxjxT6e3z+qxNRyAkZHRcj1amsoY02MI8jF1qnVB
	mAcbt/jvYP5Pc8fJbRUZiDrdeYJEtHc92KZYGyCUbBG/2uPny1qmKJji63FTX6g=
X-Google-Smtp-Source: AGHT+IGV3fdRHGz8W6Ml8JMRCptiBjlFKzjIcCxhI6Uj5qvvYAKo3j/iWUDBncEItZIdRBsrs9DQOg==
X-Received: by 2002:a2e:8609:0:b0:2eb:fb9c:5a85 with SMTP id 38308e7fff4ca-2ec0e47b5c6mr68554821fa.23.1718703275629;
        Tue, 18 Jun 2024 02:34:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78422sm16495521fa.95.2024.06.18.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 02:34:35 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
Message-ID: <fal5jtesucasboygxde2uiamq6fhycwuhor6g4uqi54jx3sis7@gw5im7xxss6n>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org>

On Sat, Jun 15, 2024 at 08:53:34PM GMT, Dmitry Baryshkov wrote:
> Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
> framework. This enables programming of Audio InfoFrames using the HDMI
> Connector interface and also enables support for the missing features,
> including the ELD retrieval and better hotplug support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 207 ++++++++++++++++----------------
>  1 file changed, 104 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 4fa0dfc5539a..02953468cb76 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -45,7 +45,6 @@ struct lt9611 {
>  	struct device_node *dsi1_node;
>  	struct mipi_dsi_device *dsi0;
>  	struct mipi_dsi_device *dsi1;
> -	struct platform_device *audio_pdev;
>  
>  	bool ac_mode;
>  
> @@ -688,15 +687,22 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	/* Enable HDMI output */
>  	regmap_write(lt9611->regmap, 0x8130, 0xea);
> +
> +	drm_connector_hdmi_codec_plugged_notify(connector, true);
>  }
>  
>  static void
>  lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
>  			     struct drm_bridge_state *old_bridge_state)
>  {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct drm_connector *connector;
>  	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>  	int ret;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);

Of course this should have been
drm_atomic_get_old_connector_for_encoder(), otherwise it crashes because
connector is NULL.

> +	drm_connector_hdmi_codec_plugged_notify(connector, false);
> +
>  	/* Disable HDMI output */
>  	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
>  	if (ret) {

-- 
With best wishes
Dmitry
