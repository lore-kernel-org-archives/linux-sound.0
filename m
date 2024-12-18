Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F3182C5
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533544; cv=none; b=F90kKRMuBaV7wOsxDzo1SNi9ZF7h1+U0Kq/1+GbsVO+QG85YgFcUF6Nq2ooa5MoCXhtUqS9J2E9dVMBOZ32PJNvp76Mv50FlI5/SVHJIEGqmnUrVp2CbiOXA18XfdO3BR+92BCRNBf0jwg5HMyiKlawG55gsg4BuesK7R7nW6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533544; c=relaxed/simple;
	bh=SDJE/oFxW/O5YSjjzOR8mQPr8l0zvp13htRjwQKmEVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUVJARz4BaTGuiQui5wgMaMYOSNLnmFSt7y8mBRKv8b7k9v8/HOZQiTdO0lUAsh3/iglOCHz+uVl3hUEF7cu/X0EA6M4Q4jketamEZmaX7o2m87TYEuPRQ1aRzNBDw2lC+IYDUV5jm1A8vg+aaun7+KDulcLa3+H6E7Jf3D7Tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gHytFyrF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gHytFyrF"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f150ddc86dso53249647b3.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533542; x=1735138342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jikMDVImI7Pf9+NM113vi4yTRoWYSpkiHuuI1ghgiGU=;
        b=gHytFyrFNc3BEmCW57WHyCwhtGC5Rkx1nYeZOmW53I1501WeiZWBmpdOCT6xJuov+X
         4VFVIozs2bBrUwH6hPiC7xyzTvVIq9Py2Xfve0cw1PQMjKR0eXh6KUcjFTKiDJV/2cDC
         Oew+vY2/5pnqfzpAlfWmecDjXq926oGvnVn1ZRBMY9buvG9e41kvZGAG4sZQpdluz8S2
         1n9CdmUA0B8Kw0oyi1uQ2CFMKHE35eWqSFdSGEq8POEl5hiwGQTCOUfq9epBgnWV8iCH
         Wm/xMtmByfEA8b5S+dZmmtetgD6URb9w5gcW5vI0W0ROo7g+egd2maTdoOAA+5tP5kT0
         pMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533542; x=1735138342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jikMDVImI7Pf9+NM113vi4yTRoWYSpkiHuuI1ghgiGU=;
        b=Zqhlmi/ILnHiFauhxUF1px9+wso4sA1tliPdJVdLZRj+hFPBN97Ip50RpTgsd2imKC
         C6fN+Xehq+QPTrqBZimBJSJPFfGtj7nOZMkAKxm2nmDrSvTyyvhfBpQIhpImLaMf2L9j
         ASo8WgOQc9T/0juV4SVbLMOQH9clB5hxdTSwgMZ2dvUBTNAT6sUxnO6h097kPKICEAZR
         ChJmVYLgbB4zOMK0iWhJ7j/UiVdo994nzLnrb9JVOkIYC5x9wj9ocDTCE1KIsWUVtR4f
         8iqdQNdPDIBcNPKE3SUTHWHdpAF7g/OZkC+EoR6/R3DQEBGAMvG9i+q6cnaXA/cbt3wz
         01KA==
X-Forwarded-Encrypted: i=1; AJvYcCW3UWVt8coqgn626qjJS1/Xj8LYUODHI7CcXiMRyhAgjtt/ayE6fVBfs95GJ4u12O7CeVTBbgFZ1iuXsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfk5JZYgP+WiQcHx6WClcBSlJPFnE+NDc74KaTfgll1McVFiPu
	40Iz3URpvKw3vojftDzAh1tYucN+DXHAriSuRQxgbum0h/VDxzEPoSFSfPfW/hEkRlXHgyP0YGn
	uzE2eWXVRstgceKXOxbR+Whh2xbKF5X1zUM56Mg==
X-Gm-Gg: ASbGncurKgs17NPu33WO89RaoGJJAnC9xg9oQbopn/j8bWT1KbEEaK3U92JDJPurBnh
	ypaf30FCv+xzw90mMLeIKqoo3IS1nI9AkA/vLUg==
X-Google-Smtp-Source: AGHT+IFROOIaavezTSB4qbIDqYTANawNmOriE8EjpWA/iXMqK2VjNXjnSwbVB0kRn8qDDZTN6lGUdQkOSisxyeutzXQ=
X-Received: by 2002:a05:690c:6c91:b0:6ef:a4bc:8bc9 with SMTP id
 00721157ae682-6f3d22573a0mr22613297b3.21.1734533540880; Wed, 18 Dec 2024
 06:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat> <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat>
In-Reply-To: <20241218-wild-red-manatee-bb2a34@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:52:04 +0000
Message-ID: <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime & Dmitry

On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > there was no simple way to get the drm_connector that stayed at the end
> > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > expected to get drm_connector instance.
> > > >
> > > > While looking for a way to solve the issue, I stumbled upon several
> > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > implementations were able to handle codec's 'plugged' callback. One
> > > > third of the drivers didn't implement the get_eld() callback.
> > > >
> > > > Most of the issues can be solved if drm_connector handles
> > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > implementation, be it a driver that implements drm_connector or
> > > > drm_bridge.
> > > >
> > > > Implement such high-level framework, adding proper support for Audio
> > > > InfoFrame generation to the LT9611 driver.
> > > >
> > > > Several design decisions to be kept in mind:
> > > >
> > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > >   generic functionality (ELD, hotplug, registration).
> > > >
> > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > >   supported).
> > > >
> > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > >   framework.
> > > >
> > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > >   drivers should opt-in capture support rather than having to opt-out of
> > > >   it.
> > >
> > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > tested?
> >
> > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
>
> Yeah, we definitely need to test it on the pi3 (polling-based) and the
> pi4 (irq-based) at least.
>
> Dave, Maira, could you give it a try?

I'm on it.

  Dave

> Maxime
