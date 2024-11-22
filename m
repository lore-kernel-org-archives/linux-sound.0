Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908B1DDC2C
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732275326; cv=none; b=CZ8g4ukgl3wTmtXZSq9rfXVt880wjKSDBVxanL575sisK2hrkMpx+iRym0Y6Rnv91LYaKe3wapu8v1PXgCd5jXH0h0OkZZ72hVzSt8e43u8o5I1jn87GmvcNw43PYtWF4nQqnIgv1bVzKPpsZ1yTBFHXrEAAs+2dX+M4ozAOsKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732275326; c=relaxed/simple;
	bh=6Xd7rJOb08RMaqyYb/dd6a9HoYlps8DyV1OZBY6cLOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YohLo4zc1kzNH7oOFw+wRDP32flh6IUNgcPo4oV8Ht0ELauES2WEbz/Whr2UUA6YmLCKniFC8hSSCQp4HesTO4NifkKbMVVGeuOvm0DUbLoUB+YenG4LiB+pTyOM9hHwXf3ZaL16l8nfe10R6bGPTSCQU46fcjVvFkKFhC2GeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGooyY9r; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGooyY9r"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da353eb2eso3413609e87.3
        for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732275323; x=1732880123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=rGooyY9rZyj2FYZ0mDfR0hvGn5g/BsiydIW6qk1ixiCTewn6or268/rpKR7n4XwRrr
         GUY7fVFUHcvJWyeJg7HJBeI0mKxx63yVSELWcWt09g23PHMS12qOIwm7bkkRGTBg3o68
         aBdxu0xsGW0NAo1mjcqtnPl/zGj12G06DQbEdXPMN2jYF+brA7krc9NE/VV7wosVstIz
         GF2hIIDV+jfJL1a9cQfK6pWxz5j3kKIMZ8ASHMDqOCBEM2504eXDjy2XwomWRZza8lrc
         jZalEHiPTEMP+CMf5kx4dnHCH5CHW/bfAMab4iJGdLmHcqcFAIs3f6wnP2Kdlyt0yK7F
         iFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275323; x=1732880123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=qelSv9WafAJtBiUg7FQ4fmDW+zDgsdhPR60pOMtfKhH8ULkPwCPiS2TNYdeeZViDx7
         VJ/zNURNa4DR0EiqDijmpUHmzahq/7etySHI6qzCiW9UoR9jhEszgaScUolXbQVg76I1
         /iw/B1/GDXWBZzn8KqtZNOQj4V8+V35jRu0jPyf7bkKhR3vTWVYabi87JEHAV7xQo+/r
         HfFoysIylBriPqNNQ/eyd3/f3EfSG/1AsNsGuvMTUG8nOkA/yGVG4qqQm7u1LqSOO5zy
         6QoSgnUKT6Zsy0RJ+fWae4IH4egqtQJ5G+HLQGUD4sG8xeZmiDI9ULL1ESheL8P9AUFw
         GjAw==
X-Forwarded-Encrypted: i=1; AJvYcCViwJFvuoY0gPOZNwlr5jaB7o/O9s0YqYyJTz2q6Cw1e4zLR1VZZDxnNIRLTl6w3844LPVm0uwcaBT1NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhivswiGyhfx5cxQ92vBtr5CVxImZ137OdZRxGq4hgtCRg/iUA
	6479hMcseq+yH1xVfkc0ghF78oX4Ix8w+OqnVMAQg+ZMfyB8zcHJsaJnqkc/dIE=
X-Gm-Gg: ASbGncs5zuhqeknZ1+qqEzAvkSr++iqm77yr28Y47uRmJYx2/XZtmhTyzwLUTWrVOzv
	wUQS8xkmnHYUwVm6j692XGaDAzcyXOJNtrGjpB5dvy4H7WDAkjaGp+sfG4Op9RlX3fFqbWqWRWZ
	JTVLZp7PqGmuc2ntby3OwbvZRPBGYs+3QVg0mYXCY+NlZ7+DOKrmjw/ik+gd4uJYGRa9raplA0m
	ayTz6tmaxbmYZxSLf7NF9MZA8uHBeoAs7KCNhCVEbmJnucPOZRsRCG0OidJjt9XNUUGLZZVxHZh
	fcrVln3FhgxDV+hLKlwcPNzkwhDE2w==
X-Google-Smtp-Source: AGHT+IHcS5D0tQAmLEPHu7UajYtNpfZvhiuBwDM25QDIUqbvD9w+ge3SD7yoJlUUHrhodq7JCz8ehA==
X-Received: by 2002:ac2:5eda:0:b0:53d:d3ff:7874 with SMTP id 2adb3069b0e04-53dd3ff78e0mr1407682e87.29.1732275323001;
        Fri, 22 Nov 2024 03:35:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd3f12809sm270502e87.38.2024.11.22.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:35:21 -0800 (PST)
Date: Fri, 22 Nov 2024 13:35:19 +0200
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <altuhp26ntnpltvfdmikggdmibyizdwnrmwshte7sa2btmbgvj@mbhlvwb4xrzj>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
 <87ed33zf5e.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed33zf5e.fsf@intel.com>

On Fri, Nov 22, 2024 at 01:22:53PM +0200, Jani Nikula wrote:
> On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> >  				const struct drm_framebuffer *fb);
> >  void drm_framebuffer_debugfs_init(struct drm_device *dev);
> >  
> > +/* drm_connector_hdmi_codec.c */
> > +
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> > +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> > +
> >  #endif /* __DRM_INTERNAL_H__ */
> 
> Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?
> 
> Maybe we could use an internal header inside display/. Or just 1:1
> drm_foo_internal.h for every drm_foo.c to keep things simple and have
> fewer interdependencies.

Sounds like drm_connector_hdmi_codec_internal.h. Most likely we should
also split or rename drm_crtc_*_internal.h, but that's a separate topic.

-- 
With best wishes
Dmitry
