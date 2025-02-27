Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CD4A1A
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740638842; cv=none; b=kx5uWA+BenXPJ73st/uBLBwQiP/YBx8Rk73oGp3wPBwut/3F719nX4YLJLCppfCNPITV643AOehi3sHgiUlkmr21oESdrzhloA/a1W64bAMx58SsLIpbShpR0em8/Rt5fTTtWsd28bNQxc5FQCRQW1g23evUmo5q1idXYKII/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740638842; c=relaxed/simple;
	bh=ltACxuq8nTMONEPJe1EllLxYhaNz+s9j5jsZV8Jj/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMczZeNvP4hx464BbJEN4tCqjoZ2mkPpNgAqsysXct7MQgMpT/eVhLHQoMSvRvtEE9wyfzUC+O6G87mK40Xl4nB/Lup3+cbJF45MZmMc2YpnBejO6NAHN+LBSzn/ATbDqPKfeV+gKJ5QttDLPqkSqtby6EtWiB7ebaQs8T797UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KA6JJOyq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KA6JJOyq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545284eac3bso488442e87.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 22:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740638838; x=1741243638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXLsGNXwM63LVmn4MvDLtpepLIPBf52F5maI2gCJVyo=;
        b=KA6JJOyq5YvyGC4gsaZ7BrUAg0PSJa9X95yL9vXRxUWp2LrpID7PVUIw8yU08tIfY3
         AgOky/sG04uO6OOqiC6Ex4IN4mEa3P+69vxmVwC7L65g1X/Hep0+Z4WlLbLphCH3Cryj
         EidiWANzTbVqYhSXOtCKE9p0VvwNYmicScWQYunomqwKsToQ/WZJgVnBGYtbLfWY3IIn
         zRoWKHbSrE2plyU8dWLNVcYDqStW9umefWrHPfMZkeT+W7FkMHfyTRCPRCYTidbUnFGt
         y5OnSKnv8VOcWdpY2duDLbvEjcpA87+phvt82J9aog//BtERvrky8PeAJVX/rTtegV/v
         G/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740638838; x=1741243638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXLsGNXwM63LVmn4MvDLtpepLIPBf52F5maI2gCJVyo=;
        b=BMIY8uAJ/LjRy/Sf41rCwZ3799EXA3TJ747gkkV68TjdlQGgySCiRuY0DkJJ7ao+uW
         XvZKTMv/aiLPGoe3+vhy4DEmZTEDq8bD93ON62BuHWk4LYhUu5TvLnB71Q/aelv+k0k0
         wTdfv/zTtsv1BWm5YKlDGe0a5/Q3i0OiEsJtGWwkcfRISufz0UYEYS6JOjcKx01H7Yq5
         w0ojVvE+24pwkxW7BNx2HT+aAACbQ/o3hSQOyJRM3s79z9kQZvFR9FH4wOGye0wQUGkR
         hDCUjSKoHmqqz13r2bCA20+6G1rvIUJo4yRFBHUxAPWS++NtqFRwM0kCIawRDO99FQe+
         oZUA==
X-Forwarded-Encrypted: i=1; AJvYcCUrorD6CQqJ3UQp8AJmeWReEbdtplgjXYjeueieevabMEb6evD/ZSjJEpPy++NNx+aSSjifziqVz7O2xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUm/0LeXFt3uoX7XUDXfkTJYG6xZKlgUd2ksTGR+jiCjG7PU4N
	l3bG0Icnfbhuw8AsHa5ikgWAZ1GMFhmvH2kvEsssPK5tm4ws26QU4P9ySPJmY1k=
X-Gm-Gg: ASbGncvtKPib8Kt11VJ2CqUu7jdVfWscQAzTOMvZGhMqp6EShoA4bZxQKFkM1xx0T+5
	peOg4jM2W05+SUvTUAgYLbc4zDFWJnJvW5lRsaqAeCnUK2kaDQDRDqPGRkhGe6CsekNUwr0tKW8
	cIM3eUl21h2SKcVR++4BbY86eWf7oPq2EwSpMl9kXow7B5KhhBoGmiwt78X8xvvQ/mRXT6aZK0F
	4YwIIAFC7rm7qPrCa0JT7CMPN2rKZvxvfGlQMt2kPlWwK9ZOK10CZvDxdkwpNuUJm9+yE/UsngR
	nbN3aaSEboBpN9A4VNHOCokItBVW4J/A1ykoi9w0TtI7d1+0Y4aB5Y6uRFAXfhn6Wc9ja4zLAti
	7fxt4hw==
X-Google-Smtp-Source: AGHT+IG9t70T74qBx7CnC8jbRQLKhKqSlCT5clW047lLHMojYBxAlx+j31tvWwzmtDkV/C7tQU0QOQ==
X-Received: by 2002:a05:6512:15a6:b0:545:b28:2fa9 with SMTP id 2adb3069b0e04-5493c56f238mr3743928e87.16.1740638838376;
        Wed, 26 Feb 2025 22:47:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443be5c1sm89087e87.175.2025.02.26.22.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:47:17 -0800 (PST)
Date: Thu, 27 Feb 2025 08:47:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: kernel-list@raspberrypi.com, 
	David Turner <david.turner@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
Message-ID: <kyoyebkotesmmwtonp3xp5tl6m5rd7bcmceaebbwsazmos5t2j@jh3yzmoaoi5z>
References: <20250222102921.75496-1-wahrenst@gmx.net>
 <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
 <2585e14d-bb91-4d0a-b0e0-39e60b0b88bd@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2585e14d-bb91-4d0a-b0e0-39e60b0b88bd@gmx.net>

On Wed, Feb 26, 2025 at 12:04:56PM +0100, Stefan Wahren wrote:
> Hi Dmitry,
> 
> Am 24.02.25 um 04:15 schrieb Dmitry Baryshkov:
> > On Sat, Feb 22, 2025 at 11:29:21AM +0100, Stefan Wahren wrote:
> > > From: David Turner <david.turner@raspberrypi.com>
> > > 
> > > Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> > > when to add/remove HDMI audio devices.
> > > 
> > > Signed-off-by: David Turner <david.turner@raspberrypi.com>
> > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > > ---
> > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
> > >   drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > >   2 files changed, 31 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index 47d9ada98430..d24ae86d799e 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -51,6 +51,7 @@
> > >   #include <linux/reset.h>
> > >   #include <sound/dmaengine_pcm.h>
> > >   #include <sound/hdmi-codec.h>
> > > +#include <sound/jack.h>
> > >   #include <sound/pcm_drm_eld.h>
> > >   #include <sound/pcm_params.h>
> > >   #include <sound/soc.h>
> > > @@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> > >   	struct drm_connector *connector = &vc4_hdmi->connector;
> > >   	int ret;
> > > 
> > > +	/*
> > > +	 * Needs to be called for both connects and disconnects for HDMI
> > > +	 * audio hotplug to work correctly.
> > > +	 */
> > > +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> > > +
> > >   	/*
> > >   	 * NOTE: This function should really be called with vc4_hdmi->mutex
> > >   	 * held, but doing so results in reentrancy issues since
> > > @@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> > >   		return;
> > >   	}
> > > 
> > > -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> > > -
> > >   	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > >   			connector->display_info.source_physical_address, false);
> > > 
> > > @@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
> > >   	.shutdown = vc4_hdmi_audio_shutdown,
> > >   };
> > > 
> > > +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> > > +{
> > > +	struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> > > +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> > > +	int ret;
> > > +
> > > +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> > > +				    &vc4_hdmi->hdmi_jack);
> > > +	if (ret) {
> > > +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);
> > PLease excuse my ignorance, but dows this work. In other words, how is
> > the driver exporting the plugged state through this jack?
> there is no ignorance just a valid question. Unfortunately my knowledge
> here is very limited and I just wanted to minimize the delta between
> vendor and mainline tree. That's why I marked it as RFC.
> 
> Can someone from Raspberry Pi helps here?

Okay, I found it, the hdmi-codec calls snd_soc_jack_report() when
plugged_cb() is called by the HDMI driver.

Please split the patch into two pieces:
- one which moves a call to drm_atomic_helper_connector_hdmi_hotplug()
  to a proper place. The "Needs to be called" comment should go to the
  commit message insteads of the source code.

- another one which adds a jack to the sound card.

> 
> The patch seems to fix an issue? But I don't know the broader context.
> 
> Regards

-- 
With best wishes
Dmitry
