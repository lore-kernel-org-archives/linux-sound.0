Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176B021930B
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278365; cv=none; b=EB1h5Uq7N16qpLHOZzvUksLkEQBxGTWGsuUkOeMd/cjPSGqUhRhnN9W2hrNcTELhf9dAk6BGXIzG6ZeW7hb8YngUP1AKhgsS687JtZEWznXPZoA9wfhKa1vGkzQlQjUtZk0a9D6YRt9i9eVmiBIVCXTewKiZYS6BQA/ZA4vlg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278365; c=relaxed/simple;
	bh=pSYDkruvUULKK3wPdp48wcqzBDYZ+NQq3fxOD/8l7dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3oL+xD/sLTm4rSMIuH+AeAPTbTUlHqpXl12Hw39cIaXvWUZCQ7kNvNmZFq21KSv9unZ0RU0p19Ebub/Mfo0GpFBOTcEwEn+v2OxCKrF5RhRCsyI4UYjwUZJIPr1GfAYv144lmpPGnMNxflo/Nq8r+Mzzcxsrt0Z2o+08b/9aTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGj7gPP3; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGj7gPP3"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6feaa0319d8so5829297b3.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Mar 2025 08:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741278363; x=1741883163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3v8JKXAUz/cikqcFkMkfK+7rsNwqE6VvbBGzuyv1Gso=;
        b=EGj7gPP3xQ3nV8ZAuHhp5sD7mFvzAICcIOCmgsYYQmAYfaXY4lWrF1Si9tm4A9uK+P
         F+JJR30VuacvCKjvz/wFTyjjW52OkYKOxxaXSzDfRDW4UU8aoNsGw6l6KRvgBqGPDZ26
         DbV7u2ocka52b1FoJgKUXM98/EIriF/hgJb9taB3ZWQy/L2tgqUespTak95VJXn7EOaF
         50AAOnTJOUOCsCU7C+ud/qmgTtPAOrL5XjgT04mRdUVSz0sWBD7yRRpWSKEFoAOfe7GR
         syxEcZzBCeA5ht+jczuZhSAG7KCFO1R6r8IC2Zc34J+0RGLDz0gNv5Mq0q8DMrZWXCfK
         aMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278363; x=1741883163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v8JKXAUz/cikqcFkMkfK+7rsNwqE6VvbBGzuyv1Gso=;
        b=sOxfW07W5mWc6RaAR1ZP8vV6yow0VNhrhLntdtgIz2Kup+OYAjDRl23LctL/weG5+v
         qoyqrEl8+smMTgUvE4MJV3RvONwD7BV7vrO1VP2Fr9P39UD3ueP7tR/5xYjtWBaChU2w
         D5Tad9CP1SBBBwImrcFXBoLCVEzOzaWowD4/M85sDgA6nCZ/k41+jcnMOTwn0dkKmbXL
         R1QbM/NwLyZKz01YjEYLIJCQ+FduLWaTqkzXXCzmPUSJjRoncXBs7SbFtFamsaeSTYxx
         aPBJ/8MakDwshqNEZHlXp7HU4KIoLMUQLmUNcIYjIQW7L5z+Nd7eDxAGsxrSthaM96fn
         HO/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnof88qK6ZThlHud4DDms4H1CwkAWi5GlZ6VOpjj++FMKsTUn+MQjJ+8Qprgp082BG0aZ98XCH5HppZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywnvzZOlxpamY7n75GectdqPyC4GwIrK6dWx/F9x0KJRE0GuWG
	py61T4i8m3nvOJcmE+TV9xSRkBTU2NPjiY+LEpROjKfFXFYYlts6keNIht8+Xd25NdgO72qEtY4
	8uDQIbjPpZHvErZQDFFF0vX1UVNXpwC6ig1LqsA==
X-Gm-Gg: ASbGncu6XrIZayXu4ykdS70cexk9P3/FQMw2rLfcTDiK8aWH0vFyl1f73PoAFdglewN
	GK4D3uMQH1/93aoK4tf1L8fdV3tDBzi0Q+zf6LXq0yjyU/2QNxaoj5T2k3HcqiD1VZ2DIGmIaCx
	9hXF8RhGb8VYk5VfoAgOf1Vtlxy26jsrErcacHQJEzn5QwHwxOOYekx5Ez
X-Google-Smtp-Source: AGHT+IGMRsrRoHu/LOV09AkxuZCKxwMIKO/0o8NEY6i19VTDJF4iNwlslzQz72J6S8S1Vrg0KcM+/xh415MqzOyi6CY=
X-Received: by 2002:a05:690c:610b:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-6fda2fd9535mr99878457b3.17.1741278362850; Thu, 06 Mar 2025
 08:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304193912.5696-1-wahrenst@gmx.net> <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
In-Reply-To: <20250306-delectable-quixotic-polecat-ecd2c3@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 17:25:50 +0100
X-Gm-Features: AQ5f1Jp8n9gmsLnAfNriD3ocfnEesGqbUAsa-BIm3T7TejCg6svP9KJiKanhKY4
Message-ID: <CAA8EJprK2Dm_MuLkbF0cywPsbLKZVwvfnJpzy=56tGMrJ_ac4w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Turner <david.turner@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 14:39, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Mar 04, 2025 at 08:39:12PM +0100, Stefan Wahren wrote:
> > From: David Turner <david.turner@raspberrypi.com>
> >
> > Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> > when to add/remove HDMI audio devices.
> >
> > Signed-off-by: David Turner <david.turner@raspberrypi.com>
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index e4b027616d04..f46a135568b2 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -51,6 +51,7 @@
> >  #include <linux/reset.h>
> >  #include <sound/dmaengine_pcm.h>
> >  #include <sound/hdmi-codec.h>
> > +#include <sound/jack.h>
> >  #include <sound/pcm_drm_eld.h>
> >  #include <sound/pcm_params.h>
> >  #include <sound/soc.h>
> > @@ -2203,6 +2204,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
> >       .shutdown = vc4_hdmi_audio_shutdown,
> >  };
> >
> > +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> > +     struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> > +     int ret;
> > +
> > +     ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> > +                                 &vc4_hdmi->hdmi_jack);
> > +     if (ret) {
> > +             dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);
> > +}
> > +
> >  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
> >  {
> >       const struct vc4_hdmi_register *mai_data =
> > @@ -2316,6 +2333,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
> >       dai_link->cpus->dai_name = dev_name(dev);
> >       dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
> >       dai_link->platforms->name = dev_name(dev);
> > +     dai_link->init = vc4_hdmi_codec_init;
> >
> >       card->dai_link = dai_link;
> >       card->num_links = 1;
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index e3d989ca302b..a31157c99bee 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -4,6 +4,7 @@
> >  #include <drm/drm_connector.h>
> >  #include <media/cec.h>
> >  #include <sound/dmaengine_pcm.h>
> > +#include <sound/hdmi-codec.h>
> >  #include <sound/soc.h>
> >
> >  #include "vc4_drv.h"
> > @@ -211,6 +212,12 @@ struct vc4_hdmi {
> >        * KMS hooks. Protected by @mutex.
> >        */
> >       enum hdmi_colorspace output_format;
> > +
> > +     /**
> > +      * @hdmi_jack: Represents the connection state of the HDMI plug, for
> > +      * ALSA jack detection.
> > +      */
> > +     struct snd_soc_jack hdmi_jack;
> >  };
>
> It looks fairly generic to me. Is there any reason you didn't put it in
> the HDMI audio helpers?

I had a similar question in my mind, but after checking I also could
not find a good place for it. I had an idea of pushing this kind of
code to hdmi-codec.c / hdmi_probe(), but then I understood that it
might not work.
The codec can be registered independently from the platform sound card
device, the codec doesn't have a knowledge of the platform's data or
topology. We might not be able to specify the name (even through codec
platform data) if there are more than one HDMI connector / codec in
play.
So, I think that a sound card driver is a proper place for that (so it
belongs to the vc4 driver).



-- 
With best wishes
Dmitry
