Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E719DF66
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354267; cv=none; b=J5QdbRe0dXDmooZkVR+qyHczmnPu/aBp8feMVsKZZdYD2foHZG7I8A6ASSONez/DAm52uw1l32TQ2cglz3k6lPMwRL1YMqT1rs6ExIBGYsbA7JFqF1ARSf9lwF8wBLtzeBjpLUQerGMA9GYqHuzcH1RXycWA5kKv5QvnI8z7tHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354267; c=relaxed/simple;
	bh=6gz/5JCvku0V5yr9ixVyR9+FNlFCkvwcxxf4D0X90ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7vxSoN8JNz0d1nhcuJeaGbGFOREJyDY6OQAsp4/nsED/TwR34O3ZGFUsOl3jVZ+28zmXQzbJHD2bTQJ8Rpvuu3Nl7FeWXlBRkwHoq6QQjfrXB7Kyfv3Qh7Ny9F/Q2aaotdJub0DTTIb/qVLvihpZCPgFPHI9ryCNJOkbp+u8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FotN6tnC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FotN6tnC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e0844ee50so355576e87.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733354264; x=1733959064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=FotN6tnCZCSpJq3dIQKpLY6hsyU/QkOWsmUZWT6AoSl4H7VVj83y4bykbZH+QYhZ/D
         CgngLSiN2uxozRcewUkdHitjzNLLcozG+AKLiN62HiJwNE829/Zv/LlIp27hHt+QGU/D
         oTJS5Ff2IdwgvZIAuj1t3XPPXmWizukxB57tFLqu0xp55cTJgJ4h0NljgXALyriNlU6X
         dq2LFmoNOG+jRo4J5KzDRbnn5RoM7SkY/WwbItpSxg/NSPleJMpXJ1phiqs7TjXQq+Uf
         ANIFAP/FnLt0HyMNQ4Pg14q/chrOSXdS9hi8vEjzK6fDWOcjKBoMnEev4EhydtpxGFK5
         HaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733354264; x=1733959064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=YLq77SoN4BEmr33L6RSjOnGbX4nWRKU1oV/WAsr2PZtVTH8segxKvxUDLLrST1bSgD
         Ruwoni+OQixVcc8jon83pk8E5md/r2wwnesRQst+CC6jQFVa/mqGZz4p9cfQhIyQoO6h
         v5QVGfTb8kDPqg0W8VjoWqHjPLhENPvfgy2Jvjzc2ZeVcgvWKQav2wU3pCnJW+QI8DIK
         uWKZz62G/URwLIVTCEjo+W7/A4qER5PrSzl19vMlbvfIAI6hI/W5bz8Ptlt5XJOPeyQg
         8bC9BvNgWHeOVXJtVPbWcfGOMJnm/bOe9hzko/AYmCuKmgQ60DcXcpZZM2Os1eDqgJLL
         cXSw==
X-Forwarded-Encrypted: i=1; AJvYcCXvKLF3XfOMMQwnoBrOI/Sd8vXERGWH7IY4xWJoYmQ7nbV63f9XImGesESmUbvJTgt/aU1gwsPdqCzVGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPvKWV6Tj1pndeRsKcs43CLUODbbpq9Ao7VlI89YSfx3KnYKe
	rnx78IMm1BJYGMUilzcvWczmPl0sS9nshH2X9dW+3In0mPVblC5wFXW2K7xhSj0=
X-Gm-Gg: ASbGncsAy1zlRTyPrmmgtbDE09Wiwuo9T9+7J6vDmv+pn850JurBQW2NjfH7oPWj9nM
	LfoEXslZu9GazTO41+1GwK71I0fTikDtMlczboLilTpuL/qmRdOtWr1f4tiLchPuMtGCSoWQ7kt
	xqt7hgtja5IgOJ2KS4BYutlmAUb6jfncfEd3LLtf/+y/9/St7Pftw/3jDzbcs4Yi5iQYGH/2uqD
	8W5nayVPHASFkB5Sv1N5WUtTbOMgicE3MLvGuCQd7Dq+Roq1KcNFLGFFb+9Wp5NKWvksSC2G9V3
	dx5rCpMv3VQRbjlnAeHg/IunuUxQhw==
X-Google-Smtp-Source: AGHT+IG2aNoUrJvkerXSq3eWJ+qwjRlvZ17m+biwTB/m1eLy8NPmwfbxly/t8CsrnbMCJEk1wfQi/Q==
X-Received: by 2002:a05:6512:3f16:b0:53d:dd09:124a with SMTP id 2adb3069b0e04-53e129ed245mr3412222e87.8.1733354263629;
        Wed, 04 Dec 2024 15:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca4c2sm31823e87.269.2024.12.04.15.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 15:17:42 -0800 (PST)
Date: Thu, 5 Dec 2024 01:17:39 +0200
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
Message-ID: <3oz2k3ywwdkxhi4t4setfqjl54yzxg3nxe7upxwl4syyyygf42@3ynkabu2bmvs>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
 <87v7vz3ne4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7vz3ne4.fsf@intel.com>

On Wed, Dec 04, 2024 at 09:42:11AM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> >> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> >> > +	if (!drm_edid_valid(drm_edid)) {
> >> 
> >> What's the case this check is for?
> >> 
> >> My preference would be that bridge->funcs->edid_read() uses
> >> drm_edid_read*() family of functions that do the checks and return the
> >> EDID.
> >> 
> >> There are some cases that just allocate a blob and return it. Would be
> >> nice if they could be converted, but in the mean time could use
> >> drm_edid_valid() right there. Additional validity checks are redundant.
> >
> > This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> > that the check is redundant, could you please send a patch dropping the
> > check?
> 
> Mmmh. It's just scary to *remove* them, and that's the reason I didn't
> want you to add one in the first place! :)

Ack

-- 
With best wishes
Dmitry
