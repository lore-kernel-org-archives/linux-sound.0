Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC23172799
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968234; cv=none; b=T4VBVySyZs4WVAoYOpvb/hWIoomWIRmrYUthsjwuqRRECt9hNlEJln+bbQLIRE/q7i3dkZxqntpOWD1bcO6DNNeo5XdoPSaqrFPfYYKPfncYnfl6BinabUAmIYO9khgxRMX/0y6scyN/Wp9OV7hiej6gSDCkqF8lrXpzvi/BkPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968234; c=relaxed/simple;
	bh=tU0sblYbVCUHXuQAGr9IvIi+QR/cG41+CU64pAQS0RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXqa5NcTlCtuxBDq0PZFXvLKCGJto6o485zhZggkdPqXYaHQrulYA3x7oRQr1tXLXneTnfK4z1HaPuzEOmCDWjagw5+m+bw9H8B1C4W/1MHty2WfJ/PB7Zh0aC0orQGpwnCTrMiu9ZRKmxiTMzkXAxVkC4fuL/ONeFfc+v7H0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5QCmarH; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5QCmarH"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63bf3452359so18951237b3.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718968231; x=1719573031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+E1WxQueOjtD6kE6cKZDHDBQDZbZc1l4ovt0rekH1Kw=;
        b=P5QCmarH/+ErmF3tzpPQ+5MID6QuMUwzEQvk5zlm+KGDuBZFx6fR5i+Ube3uxek3pf
         LTulbKlPRkxsZwEGH8gcCSTdM9RO9m580vHeEW/sfSVdtdarBP/mYlYb1IcjbqLoYxWT
         +5yvdm2z7501SfN9jU3DuDRZiK9ObmWGAJVt4AXn2FvvS4t1MVR5YlYCEpBnRW57rQBE
         9lJKu1EcDEF3OPotEq7SXL6CzHdAMAg+T/i/BClcSSOCoHadMege3EFF6PekisfBIyW0
         RrbWzbqXJJ3IJlBGP+drAh+kUmgHn+tRW3HUwnLCOcsx/SQQPDczKqRYsPRjWFpehdZT
         qdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968231; x=1719573031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+E1WxQueOjtD6kE6cKZDHDBQDZbZc1l4ovt0rekH1Kw=;
        b=bkkf8FvdsGgfMfPJXFFwV77BIfhJ5DugEZIh2Lq4i+qlmmDsb5qWUlgI0xMCxbqotu
         vTkB9VBxyMtFVYIrtkl5VsD5lz5ivV8eOPlK7jLLavvVJeEN+alQ2bhiM3c48VwI4Cet
         ZSbXBepG57Ix0AB+vfeMA3oACz539k29NTrVk9cLGyOGEFeVj5LjTX2J2PLIXQ7Td99Q
         ihl9tklgKPjnMSxaTS0hGs+7dFgUHnisYv44qPKZIgZa8VCnl04Wi9+4sAJOXHY3Fxg2
         QS4pT2de7FrYFpPpvXmV2OjkMH+72gxH//ResbafN0Q9lQsDZE9M1/d4CguDDMHGrpc3
         pSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsKURo8FGSGoiNcNuuJctJu4c/1XnaE2zT/zc23BqkmQ+rFwmcH6VJHa/vKyahMS1EM7ojnpi7xI4ruTiy9QsA/oA9wmZ+OMHiNPQ=
X-Gm-Message-State: AOJu0YytKx6G7z78KZXxvTkLTWGtbC9BK9oeEDrh2/hbGEXFGvfAL+EC
	+UGVo/8qU4yHRqngKJJbDWj1iRf2/1Bf3HfZYbDv45aXZ82XIdz36hELVNZbSjPSU9b5IE+Ntjw
	YFFUxhZHb61fLYNrx+lMGs7ceP5yqvPgcrpw9LQ==
X-Google-Smtp-Source: AGHT+IEXBAmA+PTZy09VnQ1dqNH8zl9QK3W3FwghMXSXtL+Qdc/ocbqK9PhCE4rLdN/ODpaYb6SHS4FV15K0wd/rI4s=
X-Received: by 2002:a81:87c6:0:b0:622:c964:7e24 with SMTP id
 00721157ae682-63a8e89bed9mr75983307b3.27.1718968230585; Fri, 21 Jun 2024
 04:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org> <20240621-polite-ruby-hyrax-c4020e@houat>
In-Reply-To: <20240621-polite-ruby-hyrax-c4020e@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 14:10:22 +0300
Message-ID: <CAA8EJppryh=LR40_5cBH5+0LZdRP5bsZ9iyqHDBFdBqu_H=1=A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/5] drm/bridge: connector: add support for HDMI codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 12:30, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, Jun 15, 2024 at 08:53:33PM GMT, Dmitry Baryshkov wrote:
> > Add necessary glue code to be able to use new HDMI codec framework from
> > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > hdmi_codec_ops interface, with the functions accepting both
> > drm_connector and drm_bridge instead of just a generic void pointer.
> >
> > This framework is integrated with the DRM HDMI Connector framework, but
> > can also be used for DisplayPort connectors.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 130 ++++++++++++++++++++++++++++++++-
> >  include/drm/drm_bridge.h               |  46 ++++++++++++
> >  2 files changed, 174 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > index 0869b663f17e..71d6fdc2391f 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -20,6 +20,8 @@
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >
> > +#include <sound/hdmi-codec.h>
> > +
> >  /**
> >   * DOC: overview
> >   *
> > @@ -95,6 +97,14 @@ struct drm_bridge_connector {
> >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> >        */
> >       struct drm_bridge *bridge_hdmi;
> > +     /**
> > +      * @bridge_hdmi_codec:
> > +      *
> > +      * The bridge in the chain that implements necessary support for the
> > +      * HDMI Audio Codec infrastructure, if any (see
> > +      * &DRM_BRIDGE_OP_HDMI_CODEC).
> > +      */
> > +     struct drm_bridge *bridge_hdmi_codec;
>
> Can we have a setup where one bridge would support the video stream and
> another one the audio?
>
> I think for now I'd rather make them both provided by the same bridge,
> and we can always change that later on if we need to.

The same point here (and for your second comment): DisplayPort audio support.

-- 
With best wishes
Dmitry
