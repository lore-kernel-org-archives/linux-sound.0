Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7C4C8F
	for <linux-sound@vger.kernel.org>; Mon, 24 Feb 2025 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740366930; cv=none; b=aqdV9yVLN9B1+zJmkBov7SrDXQQ8F53u9twFoS1W5cFERGm244qzd8eXL4cSaYxSx5zfjEvrpAlEnm+Zt7T0B3asOQ8/TJNThZXTaV4aDDZauApPwXBAMGAwdQq73P+K09iE+ATPLHZsF3FXFKAAEhFurNZAH4VJ5Y42zKRjIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740366930; c=relaxed/simple;
	bh=TolZibTye9Vgmxg4+PmIgf1+lFbxpf6v2FBrinSOxHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcU207cXDcZxgI6e0XqqCJ7m1gs+lcVRr6kXWjmMKODKhX3ep49HYHERjmtPY5aFZwEtrRDQxxYh1hSx9clxoeL9S0SATmTnPen39fNi12RojYb3KT4tDcHB0VSThQ1XbTuire+uuDH2HjYZzgPOdClM/heJTLcQhn1zuaGX/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQwD05d8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQwD05d8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a04so41761171fa.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Feb 2025 19:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740366926; x=1740971726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60oW0NE+5WvAkx2Mu3B4WEX9+Sk/VuCzxW52FoixHDs=;
        b=oQwD05d8vbFPHYMhonTUQb5O10c2dzcOWFMWus5JL9ZLMrkoMVCzpjRIPqmuTN8FK8
         Q07uivrj0hKX/bhZ+r0v8xD2aLdWm3dNtd5wQPdx63S7A5KEkTy0cDtca9JyQ+CxL/2Y
         rSWhOuruiHcA4FQqYQN/LvgVLCZCNvS1NSLstF8SBqWByZ1U8jgrOnc5GtD1fAxjz+vO
         Gr5ou1M4/yPCgo7yzwFHP7LQAnkHFXH/A0UyPFwsU59d8dlHbeafTZ3V/3Xef0u8ghlE
         TS1FSDvCmLgMedzbtoHIZE1AmeaLVCBJv03yS5fZZxpjAzIO9NflnTd/8YDoj10wQRdu
         /y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740366926; x=1740971726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60oW0NE+5WvAkx2Mu3B4WEX9+Sk/VuCzxW52FoixHDs=;
        b=rIznQhyAEDkERyLjG8ms4VUH3zxwzBj8it/XmnmjunItySNegewF+RDIRNvqudJGe5
         N9ZTNxoSTbNuBMcmd0ryS347lXq34+Q9gP4lsnuIXw3BRQIkXN6t5aZWW97/tcjANJ8B
         pHGubVLkUtrRv1u7HOb9HevBZ8Mt6tqryn/E+rSRXovRHgTk7L+VD+PSkn4kGA3gqQnG
         p5jgZATm73QlkXYaBpNeWoAEL/1szkQogbsG2nbDxAY5SjMM5j9jh1Vw5BS4PeG1cQUP
         KCdwgLk4tMCizxcFz90ZcDT95bKVdyxQSKYLypJZxUsbo0c4NHUcs2T49c6hF4HOyfa6
         a0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM8ZxYUqLZhcULw1I7tVkycLR7NJoXMwUVhTIE170jsz9psG5WTTy11Dtq3Ic0uuqLtBSF4W1tSQyW2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfYBqTcGdHk3ADW/Vy4RLt0SOqlHr2ejNMTQcF1BLFY+IFE8e
	Ytyn9FHIkNRrXqiVLZE7imAduKRoPXhXMG9s1EB8YgZZ2DJt1g3kmKKHMyKUDic=
X-Gm-Gg: ASbGnctqQ+zqAIec5SlAFbJOs4qxXhqHIJNL3YCbkoaC36eXMCyfobRKksqHHoW5lgY
	JJW76KzeAU13l/Rotfn6JVJ+hiAAPF/wOEYaUwtdgEt4l3bpiBmU5AEFKbX6k8BJMIVrDEcgw7p
	wR3X/Z0OqBjmPFd/zsqFRm3kMqlQtT7LzzSOJgcEBypZs8SddOTQK6SNMXb1xx2NWKpTykcwDSh
	JytRpbZHDSFvxAPKRGzLNbPzD3eog6Nqs9iblfpC3kL5y87ECKLdXAN40jLhfGZtsrd+0bkUyNx
	drlVQw9TNOGKVyaHAJz21VCJya7J4TGKifkqASAkpmOEEH4xMRBx+WJobL95T/i3v8ccKDd7JmK
	dZEMtig==
X-Google-Smtp-Source: AGHT+IHhiKmfrH5ka4uDKdUNP+Kqb6vQhRfA/nDzn2mvuW92iiRvCMWFslhv/a7ivXaSSdw6dmkihQ==
X-Received: by 2002:a2e:9f06:0:b0:308:eabd:297f with SMTP id 38308e7fff4ca-30a5b182b9cmr32215911fa.14.1740366926080;
        Sun, 23 Feb 2025 19:15:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a23dddef9sm28895541fa.37.2025.02.23.19.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 19:15:24 -0800 (PST)
Date: Mon, 24 Feb 2025 05:15:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	kernel-list@raspberrypi.com, linux-sound@vger.kernel.org, 
	David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
Message-ID: <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
References: <20250222102921.75496-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222102921.75496-1-wahrenst@gmx.net>

On Sat, Feb 22, 2025 at 11:29:21AM +0100, Stefan Wahren wrote:
> From: David Turner <david.turner@raspberrypi.com>
> 
> Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> when to add/remove HDMI audio devices.
> 
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 47d9ada98430..d24ae86d799e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -51,6 +51,7 @@
>  #include <linux/reset.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/hdmi-codec.h>
> +#include <sound/jack.h>
>  #include <sound/pcm_drm_eld.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>  	struct drm_connector *connector = &vc4_hdmi->connector;
>  	int ret;
> 
> +	/*
> +	 * Needs to be called for both connects and disconnects for HDMI
> +	 * audio hotplug to work correctly.
> +	 */
> +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> +
>  	/*
>  	 * NOTE: This function should really be called with vc4_hdmi->mutex
>  	 * held, but doing so results in reentrancy issues since
> @@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>  		return;
>  	}
> 
> -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> -
>  	cec_s_phys_addr(vc4_hdmi->cec_adap,
>  			connector->display_info.source_physical_address, false);
> 
> @@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
>  	.shutdown = vc4_hdmi_audio_shutdown,
>  };
> 
> +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> +				    &vc4_hdmi->hdmi_jack);
> +	if (ret) {
> +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);

PLease excuse my ignorance, but dows this work. In other words, how is
the driver exporting the plugged state through this jack?


> +}
> +
>  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  {
>  	const struct vc4_hdmi_register *mai_data =
> @@ -2316,6 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  	dai_link->cpus->dai_name = dev_name(dev);
>  	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
>  	dai_link->platforms->name = dev_name(dev);
> +	dai_link->init = vc4_hdmi_codec_init;
> 
>  	card->dai_link = dai_link;
>  	card->num_links = 1;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index e3d989ca302b..a31157c99bee 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -4,6 +4,7 @@
>  #include <drm/drm_connector.h>
>  #include <media/cec.h>
>  #include <sound/dmaengine_pcm.h>
> +#include <sound/hdmi-codec.h>
>  #include <sound/soc.h>
> 
>  #include "vc4_drv.h"
> @@ -211,6 +212,12 @@ struct vc4_hdmi {
>  	 * KMS hooks. Protected by @mutex.
>  	 */
>  	enum hdmi_colorspace output_format;
> +
> +	/**
> +	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
> +	 * ALSA jack detection.
> +	 */
> +	struct snd_soc_jack hdmi_jack;
>  };
> 
>  #define connector_to_vc4_hdmi(_connector)				\
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry
