Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190BD15D5AF
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134639; cv=none; b=NuFnj2iXup00pGYC7y5z9/2UA+AjkXsA9sFfZBIadHBIfujjnSNLP+AvhDUtXKkefQImsnDFyECwubiNVe2VVomCu3SvZIGZvw6BqG22cxaZbQzgRmpmUeEOBw7mfa3lDyxDtuUIjoLihf4aHFxj9j5hiz/OZf9Q9w7yrUzAGX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134639; c=relaxed/simple;
	bh=YrTM7NclhRirvO5ov26nYLcb/cIPqgB149/aYYtK3+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqVUkZ6Q/q+rvTEQU1D41CHJEPakXdFw0+Qqi3qG2RDgkihk2pSECv/WLrQrpQjX2t3li8ZjPX3/ZFgpQ5+F/AH/HfEemB/p1URKMhi5geojxfrISJ7dQnaIk+BeUU/sPXvB7zy+MnfNlz9uhql8iFtnYg1YyW/0enUPUT7e44Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OxBB1/41; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OxBB1/41"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36523b9fa11so19514865ab.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709134637; x=1709739437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=svD1W1a7QFf9Gza+G3SPXvK0VpFKMCR1+Xi0Z1FWhGs=;
        b=OxBB1/41F8A5SVmH7WKmwol1l9JkBUCE2aZRvp0MoMgt14h5YhBEKDK08u/e6MCRz8
         T3+mQ3gcFNwIx+dA5Jcvhew9h9HqHpI7b/oxrD1SYn5MHEea71e2NRaCgi8lzXD2Gzru
         fjPLs/8qPvLxHxrf1LNf3uxIUgFwv91YrC15U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709134637; x=1709739437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svD1W1a7QFf9Gza+G3SPXvK0VpFKMCR1+Xi0Z1FWhGs=;
        b=dd3MqSN1AofQiZOIQDRtU81tZyVMTl6bQBCn7AL3pkmw/QurbQSvVyD27JrEr4kUQZ
         995Dy2zE9xKN5Cy32t4VkRUzMcAqb7Ysn2BL9vz1v6rtFYDlCiJsOOBznTkoeeIMhwkr
         z/LwjMk1Th2sIDgsRA+XpysvY6JBd4oLep3VifwgjNICYWxRSx4bN7dy6TZoYxG0B1Sf
         +2Je9Jmf4fi/z8QnQ9j7q0u+ka/wIY6AXHDDLFKOALJ9o+U34CKOFZ8DNccgA7RXuGwn
         BHBCKICMRFOU596JKVg1hBZX+2vriAj5iBrWKq/YL2L5u3oFBkHCNvWOcK5RcCnTBX4E
         K2dw==
X-Forwarded-Encrypted: i=1; AJvYcCW6tYKkRykIHcUQ0wxZzFfvEte4w8LcbfDBdIZNJYzhB7jk52pcDPTrk3c/uNzxdoEKWufkJt9TLdlXdXKXnGhZ5mauCtTmMRRM5R0=
X-Gm-Message-State: AOJu0YweCek4s+JCHIJi1L+xgOQ8hDzNShDej7gdF68XrPmUrOaFU7o4
	mF1nFYPclqQtCn42M2S2oCmoCxjmZwDpnG7t6xUjKMcdpwRC4l6lbNaeb5QC+w==
X-Google-Smtp-Source: AGHT+IFwnHar0bSnDcMYJo9D3FZDjlUk0s+GVf8S+gT0uUdrPI6XVBO5n/eqspfTGLxTLggHdT93YQ==
X-Received: by 2002:a92:de43:0:b0:365:1e8f:1519 with SMTP id e3-20020a92de43000000b003651e8f1519mr13223206ilr.27.1709134637291;
        Wed, 28 Feb 2024 07:37:17 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id i6-20020a056e021b0600b00363ce0ac359sm2766041ilv.47.2024.02.28.07.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 07:37:16 -0800 (PST)
Date: Wed, 28 Feb 2024 15:37:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] usb: misc: onboard_hub: use device supply names
Message-ID: <Zd9TLL0IM08Wh63i@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>

Hi Javier,

Thanks for moving this patch to the front of the series!

A few more comments inline.

On Wed, Feb 28, 2024 at 02:51:28PM +0100, Javier Carrasco wrote:
> The current implementation uses generic names for the power supplies,
> which conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names for existing devices to keep backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
>  drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
>  2 files changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 0dd2b032c90b..3755f6cc1eda 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -29,17 +29,6 @@
>  
>  #include "onboard_usb_hub.h"
>  
> -/*
> - * Use generic names, as the actual names might differ between hubs. If a new
> - * hub requires more than the currently supported supplies, add a new one here.
> - */
> -static const char * const supply_names[] = {
> -	"vdd",
> -	"vdd2",
> -};
> -
> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> -
>  static void onboard_hub_attach_usb_driver(struct work_struct *work);
>  
>  static struct usb_device_driver onboard_hub_usbdev_driver;
> @@ -65,6 +54,30 @@ struct onboard_hub {
>  	struct clk *clk;
>  };
>  
> +static int onboard_hub_get_regulator_bulk(struct device *dev,
> +					  struct onboard_hub *onboard_hub)

Let's call this onboard_hub_get_regulators(), it's an implementation detail
that regulator_bulk_get() is used for getting them.

no need to pass 'dev', there is onboard_hub->dev

>  static int onboard_hub_power_on(struct onboard_hub *hub)
>  {
>  	int err;
> @@ -253,7 +266,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct onboard_hub *hub;
> -	unsigned int i;
>  	int err;
>  
>  	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
> @@ -264,18 +276,9 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  	if (!hub->pdata)
>  		return -EINVAL;
>  
> -	if (hub->pdata->num_supplies > MAX_SUPPLIES)
> -		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> -				     MAX_SUPPLIES);
> -
> -	for (i = 0; i < hub->pdata->num_supplies; i++)
> -		hub->supplies[i].supply = supply_names[i];
> -
> -	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
> -	if (err) {
> -		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
> +	err = onboard_hub_get_regulator_bulk(dev, onboard_hub);

The local variable is called 'hub', not 'onboard_hub'.

> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index f360d5cf8d8a..ea24bd6790f0 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -6,54 +6,66 @@
>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
>  #define _USB_MISC_ONBOARD_USB_HUB_H
>  
> +#define MAX_SUPPLIES 2
> +
>  struct onboard_hub_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
> +	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */

The comment isn't particularly useful or accurate. Not in all cases
real names are used and outside of the context of this change the
comment is hard to understand.

I'd say just omit it, the name of the field is self-documenting enough,
there is no need to repeat the same in a comment (as for 'num_supplies'
...)
