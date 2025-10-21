Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B12EB843
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033823; cv=none; b=YpyAkwFj3wL9YvjgDkQOBH4cCJ822X4FuXtNZ+Fhk4BfTAjbzw4SEGqcFuTXvk51ISl2dtK7TP1X+LWN1ClaF4oBEpBKn3PJk+RrxEjUphYDnlJWBshYoU9w5xrRYLsFH/CRaXXZLndqf7Cz/lna0XiY+j6C9qV/SHaVv05j0bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033823; c=relaxed/simple;
	bh=6Mv7HAoZABWuGvs2JyOm9HSzUH3AHVBCynCtVRwyJAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3503fvq5DYcsRPLhysUG5PcQkKXOjGoLJQDm8nE3isiHvA9QFjJgl7Mhq+weZpMDxkrPaHNRpCRTIIyJ7Kxsvloi9xgqU5jTzBcGhZMhlg+K6i/I7l/ZOycymlfvrQIpeL4UW9hx/FJTBHOwrMIkzpjBjps1GUrTRnOHXQY6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FM7/+tP+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FM7/+tP+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b403bb7843eso978457666b.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761033820; x=1761638620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=FM7/+tP+EKbj+UA6g5fOHhfJreNzSMKP+JpMgOF/U8IigPesS5v5MNxSr8D3y+6g5w
         5tdueylmRsGBZoY21maiZU/f9Ne79UfV10jgyKgQf+n7N7aZ70nUsyGQCYQaJc1G+pB4
         PhnwE76FSFbhl7JJCkVlCL/CEBkGPf+DNktxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033820; x=1761638620;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=wQjQ0wRrZeVjaN/E/hWAutH297WqzPdZDpED3cApvOjO8XzOsXgNyZS0RT4DKjAl89
         /GvBePMVGtQL04nH5+LzU4/z94W68XXN3Q7TMw+t82IA3klM5yQ/Mq3YoE6Prrov7val
         ZL0JyqHWgKIa8RS8atPoOvt2Dimy6prJ3OfJISPulQpIhyzL/JfimwW4RwYpQiCotS3w
         4zxjuRAUo7q9d/znXWZOHyuBuXulA4qpSA6AW5ftc0Mj70+uAKdki3g0MFHq05m+Vayy
         kdIouLcmqUrIEpahW9cImvOILp2gsUY6UjSkrYqPoSEMQgCp7Y6y2fOXzPZM8kxN3ToC
         bLjw==
X-Forwarded-Encrypted: i=1; AJvYcCWurJRQHGFCcwyhX6vLEKPLl5wV4F+LqmZeHg9qFdTdhG1Y5aZTYIlqggnvRfTy9vWxsgukznCioHzXUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1ojGKB3upGpaUGkLNcIrSxKeR99Rm0rex3U53SO3mroxgR2i
	UftLnZTDSJANmg/q+E9ri6YBtfCm7vW3zMCAvejBlZE+rpGtdnLr35Zcfz2HESBfJWA=
X-Gm-Gg: ASbGncvs9T1u7soaLD2JRQaIOIW9z8Q6tbUO5NF8CZ3Sp/Obr5/WGvit1MAtk8sj77o
	0R+43nlUfRj4IoTVlFakwdYhgsmsV5tUvJiQvH0gNF6eq9UtBVwJDwccexsGNr79GaSa1cS6sRa
	agQwycD7X3fEltklAmmhyEe9mpLd2N8b90bpRU4WwnCeKwqcyhzfxE5UwGGcxAfdclPc/PJYiAL
	l/yTFkE2To3/C493wltEdCwGp6zf4X4m6CtKofug7bOYdbs5Bs6N3lrJLHJYQjx4vaVQaGl8QZn
	A57ck2J+VgH7vLRwklCnET0JrJa3+4aEnK8bEaIrqxNKiTpWL5CJBsPMLIQ1SBuMIEpHn7aKOrG
	1beiy9vjVIZqfaJRhe3PLuhAWc8E0krd5u3YP2gikJb3zDBhyP3aR1bgGbbWT9Gf0AzcBLudwQ/
	8Buy1l5l8/mkM=
X-Google-Smtp-Source: AGHT+IEbmSLB+yRFZ86qxeD7wG4TxM9uG6ayZpPpFTz88clAHcJph5RIG47VQ/I34aUFg3RPcxflIg==
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id a640c23a62f3a-b6471d48347mr1967108166b.13.1761033819926;
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm992513566b.31.2025.10.21.01.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-3-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Would be good to get a formal ack from alsa maintainers before merging
through drm, just to be sure.

Thanks, Sima

> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..c4a929d4fd51 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
>  
>  /* AES/IEC958 channel status bits */
>  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
