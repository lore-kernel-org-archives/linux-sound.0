Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018614A62A
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 05:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499473; cv=none; b=u776vzMVbU6Ot5ztddv395gnZZtKlWiR25zg51Ye8KUEbVoRmAgdm3ir/svnLpD3Q2T3d5Ec1+70oywF04giI9Ot8fi4j3H0kYh0snfs4dh2SL5Xg2T9yYUTdK0Rc+FOxs5haDYspt71W2O4qxcujXBvonl3Hd3Nf6y8W31JWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499473; c=relaxed/simple;
	bh=obNQjfJ6/sTLIAJyOUduAweXRFXDGUq5hEbrASZiiHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rV6yxDDjHdKljN/tqRqnTuDN+WHs1SHkw+O53L5AEXDZ7TYj2EtWg1cgsXOPq07mhUlpfYXDEXsjl/DYPPAzc0DB0VVdiKU7fhjeKUSXFQePTVECo/WBhYNdpSPUarHAdpq5PYLdYOZ1W2v1aO1mL35qlXeY6rwazGvMXSDxeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zambi9Fz; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zambi9Fz"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e460717039fso3327605276.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 21:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734499470; x=1735104270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
        b=zambi9Fzmt7NvD5nBSymjGjQyPs+xFYMyZ+SYMUZ45UHXhVc0La/qo5e3hj1k5zZ7V
         t7UcVJsr8bfNEHbZGpk1hd2KC5K4/Ve6NB7HdDHz17B+/gEQMd0f38/dtyiAzy1Nypxq
         0+sdEpFuqu9fgQTCbjWa4zeYQCFak+wJogUdzcSRDfn3fvVmf1Hacw5MzXWpOHEwJUfu
         WxUKuGXZ15glfAPqgoY9xzj4z4V+w+e+l9peKQLNA/35ogGvPb3NHJ42yf+37vQHu1WG
         5w8mnAXgIKynK8m352brO+zaCLBK0UvI1NbsHPwQNZsILvw9WqTM1+S6TGYvaCNTrpBh
         Xu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734499470; x=1735104270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
        b=clGFVCiYfPZNvf2sVXn9pC3PseVxEhsdqv6kv6eKZEPyiU6vMFRKlCByi1kxqMn0d9
         6/nr9MCCj3TlLcuocZmtN8IHSQx5HTrw/2Bno6dZ/IQbcRx/txWJn1+DffiihLemRCs8
         nTPfVdaQCulME0G2pHwrZVZJpP69ww79Rz2ORIbHNIY9YjGk1Ge1vdJ/uSlvIftKkqAI
         hVa00KGGj2K59Nh5QySdBDcfhD10cT5OQlVhQ9Bg3P8xoCDP6SZ9IoFL0DWzX5r3+E0F
         HHcM6AmjYnWWMu7pNLyVa4mn+o4vyTohntR2BuJCQeh4nT+kphScC83RsDwxi4Zr42Yc
         hjMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVZaDML2sMxAsvYMpzveUne5YSPnfRK8R6b86tbXjsNIR53shFvBbbTdGwQpcTc2/ZACZHqSV2ksYfVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzK/k8/S2PG6AqXyed7J7x4CpWH2QPi/QyX94mydKBzNdpIP2D
	aL/JCzAG+zjXDmQBl0qxW7RHyTFB5cR3iZok/CnMlsatVzdX7b65SMqXGqdRvwz/IwT9Z1LTGhg
	zFWKjYjT4Yo/yE5wLmf93z2TGRJMiHDYD7BON2g==
X-Gm-Gg: ASbGncvFKOAsJ/3c6CM0S85+entjnbjSnEk00BBxrIRr9tu3t+rPV5a0ipQ7FSCzxDa
	bdNSBFfz+egVvI1fQkNl0JHNrCGwXwIhiiRcalS0URfUt21qZd+rxbD/YLD64+81XmRuNjw==
X-Google-Smtp-Source: AGHT+IE3kqRdPneJyqqtRpFDLs6soyy+Bdc+Cywd1EGV0t4/4nnntxQS7NjaTVS7xOtVNpAQwVKUJPYkOMozlg43ysk=
X-Received: by 2002:a05:6902:70f:b0:e49:5f2d:e729 with SMTP id
 3f1490d57ef6-e53620cdcf8mr1205674276.4.1734499470459; Tue, 17 Dec 2024
 21:24:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org> <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
In-Reply-To: <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Dec 2024 07:24:23 +0200
Message-ID: <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > While looking for a way to solve the issue, I stumbled upon several
> > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > implementations were able to handle codec's 'plugged' callback. One
> > third of the drivers didn't implement the get_eld() callback.
> >
> > Most of the issues can be solved if drm_connector handles
> > hdmi-audio-codec on its own, delegating functionality to the actual
> > implementation, be it a driver that implements drm_connector or
> > drm_bridge.
> >
> > Implement such high-level framework, adding proper support for Audio
> > InfoFrame generation to the LT9611 driver.
> >
> > Several design decisions to be kept in mind:
> >
> > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> >   generic functionality (ELD, hotplug, registration).
> >
> > - drm_hdmi_connector sets up HDMI codec device if the connector
> >   is setup correspondingly (either I2S or S/PDIF is marked as
> >   supported).
> >
> > - drm_bridge_connector provides a way to link HDMI audio codec
> >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> >   framework.
> >
> > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> >   bits. Only TDA889x driver sets them, while it's safe to assume that
> >   most of HDMI / DP devices do not support ARC / capture. I think the
> >   drivers should opt-in capture support rather than having to opt-out of
> >   it.
>
> Sorry if this isn't clear to me and I'm quite late to the party, but did
> you test this on vc4 with both a pi3 and pi4, or was it just compile
> tested?

LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?


-- 
With best wishes
Dmitry
