Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494E1C683
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706870; cv=none; b=p/qPp1cAjAmhzXDYnbFJI96RW0+5Qf6wNdZ55cLGu6xxTMkM1jNY7DMMnCaUAaRt919YyLt6H4kH/5X6uZrvJ2A/5h0udNvyBD9tX0VewPXwpIWhW1y0QdzeoE0BA7sHCLMHxogzya/sszD0a7LmJbeeV1L48TB/xF3yA62fnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706870; c=relaxed/simple;
	bh=JwJgy9jGi/IEiQ8gtXWFUphwmvZ+lXufDYIJrwLYGGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJ1G9XN7AE6qhPWkrK6gd64KWUXV0CQQPL5ylEkWdVwUtGmUTYAY7xtZPrBbvgXVbL0A9V/Ap3yQNAIuoYDvIXVSQhXh/JLEy+yqGytAqqN0vgNaZp3AKgOK98nFN4w70wMQqM6ZxRdm1Fcq98N0xEDS4O2p8wHg/4n/QTKp7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Gf0oYKg8; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Gf0oYKg8"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eff4f0d627so18548557b3.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 07:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734706866; x=1735311666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgldlIqebxHMCQPj7i1Mg7X3Is8x4PWsXNlmpVBX+dg=;
        b=Gf0oYKg8kFOjVigCRECZboCJLYmygrM3RI4vjunugyUlvKqmsfcchUywQfzbXAy36Z
         CBTEquYSJUKMGY+hrV4i5JQAg/C4KKk8gkY6uCqfRhPeZbTLjOin6LA+trsPvJD0AB4l
         skkuE9xcG05eG0C1eqYTuhnt36pMh8pRA1RfDkn98wH4cIHdJCj0iCMMHXIlgxxlFZvi
         XTXPUFMwH+46bt7vUJEzxDyQ2B/XNkAjC7TeSRgz3WCzY1pqnHMW3jWwTBqv0Alx9a/f
         7M2o6LljjghOD2mT6L9yB3QyXYDlguwEmxfQcK5X8tLyJwmpB9SOzwt3sDUtk0I7AVx3
         uwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706866; x=1735311666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgldlIqebxHMCQPj7i1Mg7X3Is8x4PWsXNlmpVBX+dg=;
        b=kbiw807zy7nPDVQy8uTTbv7FRjenD9JBRx2L5ZW0KHSXKWHmmZT1s36rU+w8RiC71W
         d+Ypd2paWw8j2+ERSCWro1hFsTphlxJEJFI9akHot7THGCI1eo135vOxpZJnUCoyWcDs
         /FoJiw+WcgeAlfldwHX52/w/LVVG3jInTLViy7z6qBIqa2m22Lo7oHkeZY7B7KearDVO
         bqYKGtzoGM/2/6VjamugwTEL9U6dCvjMrtJc7O9lukQo9MElODt3/RXKQ7Y0Eyr0/7yj
         J1enmvggc88GB/BL/8m0FezTjxwcNGIdU2dr0WFYiCXtLYrfCyGFlU7E0LDvyQ7/trQi
         vB3g==
X-Forwarded-Encrypted: i=1; AJvYcCWeuLkICkl+RVSqB0eRAE3uJzCGNPuddUfqf4h2PcOVaZHtHLACLQJbmfUHL/t16bZ9psgwkPF7dcCshw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XC32U43URx2AkF3nDm6VSTxT/naURBfEcmWioiI9aGzQzxU8
	by4394uqpstWZHxM/nECy+SUV0K82X0o8+CGNVgY7ZqTVjXG2YjOiNAZVcloDksEGooHPsttmDx
	winHNbjg4SgfxGnLslqfDqRn/K8QvowBnKvd4sQ==
X-Gm-Gg: ASbGncstQZuNanu9XqVkWtpljEiGWzTDwbFZ+FxOWBvHaYFNn0mN62YC+3M1GfdLZqK
	FYIEJXZnwoSapKefsuEkZE8D/L/GpIxOWNpll+Q==
X-Google-Smtp-Source: AGHT+IFc+oEnOShcdDC1byWLp4AC1qmPpTDBu0FWi/xC+iJe79EAhDsdRcF95l9UsCgekChEcx5oa5DdzDkNKNuDTEw=
X-Received: by 2002:a05:690c:690b:b0:6ef:7372:1131 with SMTP id
 00721157ae682-6f3f8251854mr22921827b3.41.1734706866390; Fri, 20 Dec 2024
 07:01:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat> <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat> <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
 <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com> <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
In-Reply-To: <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 15:00:47 +0000
Message-ID: <CAPY8ntDUaFnvkjkqES4AkrzZ2z659h3w5MFSd8vW04Eh-iJ1FA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
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

On Fri, 20 Dec 2024 at 00:45, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Dec 19, 2024 at 04:16:37PM +0000, Dave Stevenson wrote:
> > On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Maxime & Dmitry
> > >
> > > On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > > > expected to get drm_connector instance.
> > > > > > >
> > > > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > > > third of the drivers didn't implement the get_eld() callback.
> > > > > > >
> > > > > > > Most of the issues can be solved if drm_connector handles
> > > > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > > > implementation, be it a driver that implements drm_connector or
> > > > > > > drm_bridge.
> > > > > > >
> > > > > > > Implement such high-level framework, adding proper support for Audio
> > > > > > > InfoFrame generation to the LT9611 driver.
> > > > > > >
> > > > > > > Several design decisions to be kept in mind:
> > > > > > >
> > > > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > > > >   generic functionality (ELD, hotplug, registration).
> > > > > > >
> > > > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > > > >   supported).
> > > > > > >
> > > > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > > > >   framework.
> > > > > > >
> > > > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > > > >   it.
> > > > > >
> > > > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > > > tested?
> > > > >
> > > > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> > > >
> > > > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > > > pi4 (irq-based) at least.
> > > >
> > > > Dave, Maira, could you give it a try?
> > >
> > > I'm on it.
> >
> > Basic checks look OK.
> > Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
> > works, and all the EDID parsing seems to be correct.
> >
> > Ideally I would like to do a couple more tests though as I had a
> > couple of spontaneous reboots on Pi4 whilst hotplugging.
> > Most likely it was just grounding issues, as I can't think of an
> > obvious way for the kernel to be triggering an automatic reboot. They
> > seemed to go away when I had enabled drm.debug=0x14, but more likely
> > I'd connected the serial port and therefore provided another ground.
> > Please don't hold the patches waiting on me though - I don't know when
> > I'll have time to do them.
>
> Tested-by?

I'd held off hoping to get the extra testing done today, but that
hasn't happened, and today is my last day before the Christmas break.
So based on what I've done so far:

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> >
> >
> > Also unrelated to this patch set, I have noted I'm getting
> > [   60.780897] WARNING: CPU: 3 PID: 501 at
> > drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
> > [vc4]
> > ...
> > [   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
> > [   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
> > [   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
> > [   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
> > [   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
> > [   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
> > [   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
> > [drm_kms_helper]
> > [   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
> > [   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
> > [   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
> > [   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
> > [   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
> > [   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
> > [   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
> > [   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
> > [drm_kms_helper]
> > [   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
> > [   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
> > [   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
> > [   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
> > [   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
> > [   60.781790]  irq_thread_fn+0x2c/0xa8
> > [   60.781799]  irq_thread+0x16c/0x2f4
> > [   60.781805]  kthread+0x118/0x11c
> > [   60.781813]  ret_from_fork+0x10/0x20
> > On first plugging or unplugging a second monitor. I suspect that is
> > spurious though and I'll look into it, but probably not this side of
> > the Christmas break.
> >
> >   Dave
>
> --
> With best wishes
> Dmitry
