Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87818FDB1
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421691; cv=none; b=OLniO8K/fMzI9q0uLgxQCjED9M1kt8BuP/iMW1GSAMtWV7dhkjulzhuvfkiLdHVdwD9hSBeEMYJp6vSSFnY+RAZCbSGXOWF2mv2yoihZj2I9Cg7HE38yNuuzbG8XgfoA/hgzz2EYVUQmEuvJqa2h5pW2fUK8RM93hn9QluKeIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421691; c=relaxed/simple;
	bh=Rs8XH5HRFsmAHuQJbnwuRO8BPMAU17Dus3YlR/aOPvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFGdnhU/BU4VAZjzjebmEurkPuyXvgoEgPpW4wwItvZ79vmncZkrsV1vIrqdXcOGyEetCCNqJisn/lRsBinQMGPcrc1xOxTWsSOzY3wWxbtRIl6UKqIoZvhSiwewUyAskQKq4quMf7Cx+EHS8QeTWTro2ZRswtIAQLaxZG0KKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KE2J0OnL; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KE2J0OnL"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-646645f1387so26712997b3.1
        for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1719421688; x=1720026488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hug4wgAXnhxoD24e1k6r+oEcnYqVVDIHW/ISTyq7kVE=;
        b=KE2J0OnLDtsLetPeIAdu5ZQTid69V6BRdA53B08RAyzzjc83g/OmG6GhkgAcLLZQzA
         1nyNNPWV6n8bwZwCGZp91TPzpS1EBT3oH3qo50HdFZRU4VrkF8L3bTvdJ9LycEK4YRW+
         VQwL7eciV1t0V9LU8qgFQgtTuxCgAzzOSrd8BwDH5cIY1h/+YGY+ApFDRwHawjz+KD6f
         6xfc3sT/etdCKAbIEjO/qQEAy3ONLm2lHR3TpKp5/ewzbC1U+jUF0kPKbEVumyZ4fH6y
         et9QzVnVXq/74hJV1ByBGDaQ+odnh1/Eljuq8Erb6q6HR4Ny1T7YyF+nPWG6xPBCn4rm
         EwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719421688; x=1720026488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hug4wgAXnhxoD24e1k6r+oEcnYqVVDIHW/ISTyq7kVE=;
        b=mnwm4keVv+MFZOM/fIbH90ZMVA5W1INJSfvgiFReQKHm9H0ZLrUaopwIUT0tHAlqgs
         5oIfgv86KCkwSbwfgFOP6YoCbIEtuCk9FwEQYPcGE0aBCfgZ075GIxefzGLHYC3KH0U9
         OPDaOoQ9ef+u2PZAaE0Ry8cv5JP4FSBpv5bSJem/d1C/Pq0saTH82xJOtDPWKdroFmYK
         0vxRMHwvaEsSPbaoaYynjfpYPsvTKtfcxu9q/h/n/V6sshnHJXrFOJicdS3WSC6JOV5H
         YEKS6AS5mExn2t8EmwzVO9NlJvS8YyEc7t8OCTegCHWldpOTCl3Md3Y5BFpJU4FTXqdA
         5x8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUY4gZ7iXg/fwv9vDtPOV6BBrc7DV7vDCYQHMyaRIv6YmtwPsf5aDLMMriN9aHxuHkOJEZyUK1kkYS4u3xkkrPD4UMZzgZZ5Vb+/I=
X-Gm-Message-State: AOJu0YxYUCEuECLTrRM/gSYyMGfxzU0bDw7DxRKVH7vq+rQ6a8CmIJ0r
	sxzQGvZzWV1EMixSwu1GPMdpDsXm4HClIvot0jbIXSnmJK//BW8t0swxfziITdodZDDc6SduzXH
	q7Qdgm+KCfgPDU3TI/8rm3SaxRObb6q+AM37ORw==
X-Google-Smtp-Source: AGHT+IGef53wQZYV8SIpLnPVQeM5KXZdDLHxp6Fi7FuyKkognl/w8npkNrMsRe8fOdyILv2/6zKWDIJ7ZgCQJdIVkLM=
X-Received: by 2002:a81:f105:0:b0:622:df58:2cf6 with SMTP id
 00721157ae682-643ac42da63mr86845067b3.50.1719421687834; Wed, 26 Jun 2024
 10:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat> <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat> <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
 <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
In-Reply-To: <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Jun 2024 18:07:50 +0100
Message-ID: <CAPY8ntAtxsdbOKDt3oT87iexXHPw3aHhi=3T-rVX8BfOt5hFfg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] drm/connector: implement generic HDMI codec helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry

On Wed, 26 Jun 2024 at 17:11, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Jun 26, 2024 at 04:10:05PM GMT, Dave Stevenson wrote:
> > Hi Maxime and Dmitry
> >
> > On Wed, 26 Jun 2024 at 15:05, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Sorry for taking some time to review this series.
> > > >
> > > > No problem, that's not long.
> > > >
> > > > >
> > > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > > > > > Several DRM drivers implement HDMI codec support (despite its name it
> > > > > > applies to both HDMI and DisplayPort drivers). Implement generic
> > > > > > framework to be used by these drivers. This removes a requirement to
> > > > > > implement get_eld() callback and provides default implementation for
> > > > > > codec's plug handling.
> > > > > >
> > > > > > The framework is integrated with the DRM HDMI Connector framework, but
> > > > > > can be used by DisplayPort drivers.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++++++++
> > > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > > >  4 files changed, 199 insertions(+)
> > > > > >
>
> [...]
>
> > > > > > +
> > > > > > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > > > > > +                                         uint8_t *buf, size_t len)
> > > > > > +{
> > > > > > +     struct drm_connector *connector = data;
> > > > > > +
> > > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > > > > > +                                                 void *data,
> > > > > > +                                                 hdmi_codec_plugged_cb fn,
> > > > > > +                                                 struct device *codec_dev)
> > > > > > +{
> > > > > > +     struct drm_connector *connector = data;
> > > > > > +
> > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     connector->hdmi_codec.plugged_cb = fn;
> > > > > > +     connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > > > > > +
> > > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > > +
> > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > > > > > +                                          bool plugged)
> > > > > > +{
> > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > +
> > > > > > +     connector->hdmi_codec.last_state = plugged;
> > > > > > +
> > > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > > +             connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > > > > > +                                              connector->hdmi_codec.last_state);
> > > > > > +
> > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > > >
> > > > > I think we should do this the other way around, or rather, like we do
> > > > > for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
> > > > > things (CEC, HDMI 2.0, audio), so it would be best to have a single
> > > > > function to call from drivers, that will perform whatever is needed
> > > > > depending on the driver's capabilities.
> > > >
> > > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > > 'plugged' term,
> > >
> > > Is it misnamed?
> > >
> > > It's documented as:
> > >
> > >   Hook callback function to handle connector plug event. Optional.
> > >
> > > > but most of the drivers notify the ASoC / codec during atomic_enable /
> > > > atomic_disable path, because usually the audio path can not work with
> > > > the video path being disabled.
> > >
> > > That's not clear to me either:
> > >
> > >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> > >     enable/disable
> > >
> > >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> > >
> > >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii902x,
> > >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at all.
> >
> > FWIW I have a patch in the next set that adds the call to vc4. The
> > downstream version of the patch is at [1].
>
> Nice!
>
> > > So it doesn't look like there's a majority we can align with, and
> > > neither should we: we need to figure out what we *need* to do and when,
> > > and do that.
> > >
> > > From the documentation and quickly through the code though, handling it
> > > in detect looks like the right call.
> >
> > We concluded that hotplug detect appeared to be the right place as well.
>
> Probably you also stumbled upon hotplug vs enable/disable. Could you
> please comment, why you made your decision towards hotplug path?

We hit it in trying to get Pipewire to do the right thing on
hotplugging HDMI cables, and updating the lists of available audio
destinations in desktop plugins.
My memory is a little hazy, but I seem to recall the logic was that
whilst changing audio destination when you unplug the currently
selected HDMI output is reasonable, but doing so because you changed
resolution or the screen saver kicked in was less user friendly.
mtk_hdmi was used as a basis for the patch, although it's all largely
boilerplate anyway.

Yes the audio has to stop on enable/disable as HDMI video dictates all
the timings.
I've just checked with aplay playing audio and kmstest to change video
mode - audio pauses as it is disabled and resumes when the new mode is
selected.
One observation that I can't immediately explain is that if I use
kmstest to disable the HDMI display that is playing the audio, aplay
still completes without any errors logged. Using "time" on aplay is
returning the same duration for the playback whether the HDMI output
is enabled or not. That may be down to the vc4 hardware with the HDMI
FIFO accepting the data at the correct rate whether the video side is
enabled or not, but that is just a guess.

  Dave

> >
> >   Dave
> >
> > [1] https://github.com/raspberrypi/linux/commit/051392bfdc6dc54563ed9909cc1164e8d734af43
> >
>
>
> --
> With best wishes
> Dmitry
