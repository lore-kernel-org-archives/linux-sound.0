Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEB1350E4
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709236352; cv=none; b=n7/Jib/JkCDBopGVZg6ZS0CdekYPKN/mmkMybCeuv6LMofLTDT7TehWd/2tOxO53LAnWNV5iHNbOdGjV1dJaY12Yur3JUCn1uiPx45SENXrF6Y3+mqodQ/7zlC44Msd7gqZfbtuH3ZYBWtl2uxX3G2Qw221kkkjcnuriXvIf534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709236352; c=relaxed/simple;
	bh=BP7MIA4aqWsMyk/DGZfI6PyI07QVMNIRBi3JywY0eHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibzl8fqoINgQr6JycvOysDkHeSU+8Z4yZuWxMjzl0cTjVHk8zs/z/CSPhHQvQSdpm+BdW1YPmi+Jb/3UR54uIJhFnuMi4MF1F6eJ3b1rTGCT7z9YeANn6/TRFqoW+kfsuqePXhOBKQ3x/tDrkKpm81zRXPn8mLKKtVLAQnOVRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HypF3EI9; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HypF3EI9"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3651d6dea15so4238915ab.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709236349; x=1709841149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2t6iwGhsnNUxY4xM8qxSPssm7+cm45B8gw+DhHQKME4=;
        b=HypF3EI9hLgQur8I6NBhRnURfqFI7olBYhAmwesAxfVtKJ6jcKGaOFMnuEL4pd+Cnb
         rCzJyadxlNFrmvS9HJrV6QSm/B2irlD8WqJrVpiM411kdNarXQJgZz0HGwz53/H13oLK
         35vOknB0OWFPxxFCT9XdgoPn7FvQI8XYZRbLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709236349; x=1709841149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t6iwGhsnNUxY4xM8qxSPssm7+cm45B8gw+DhHQKME4=;
        b=XrpIQ+XUZD+Xx32b7fUPrCh0b+Hwe7jCNuczwGWGTcuXF/B6e/thlOOt6t+RGQQE/2
         NG9GoW73ZcoUh+8cyd5olIhZVqS3tNKqjCNFQg5FvLsWAnFkaR8IV9Za/S9RXDeVrVuM
         0WAgVDITUqvI46yJfaZVK4jSclvdJmAFUv15aguG1S1UuVuMsSJK79mEAotUPtIH08/e
         dAccG8FPlL3TzcrpmYeFYLX5tB+hJaAtbisFLd4DnCK9chKpamrie+sV5O7lb6vNdh32
         41HHa60Uq2fX38fRllsWqqYWDQsAks3a8+ZGvayIJsVHFIXSCrGVNgIz4b7cxU13lSZm
         bwVg==
X-Forwarded-Encrypted: i=1; AJvYcCWaGD2sq6iqO4bM/cBJhmNkP2VgFxztlXrx6w7FIUTrv40SSlrjJy3uoXLbYKedJ9+Vc0Dcpbsx1BFnjG36D28y4s1XhKVgUVhLWXE=
X-Gm-Message-State: AOJu0YxqbOPUMCUdRVu0kmz7hBASVNWYyUOdmPAScGLdJrrQc0Ks+BWd
	WXPPfZ+LuYzSMGdqDTzjonOu2P5CC5HfA99fGYsPEuR2X2LvAN0VwpSoV1EdUQ==
X-Google-Smtp-Source: AGHT+IEZumlIxb4G0d4K62o0AbkepaXShc33hqlL9UEbLbxcWjF6LoBXCm4td2IpRYXolb4bY9ObCA==
X-Received: by 2002:a05:6e02:1a8e:b0:365:185a:83ed with SMTP id k14-20020a056e021a8e00b00365185a83edmr1768942ilv.10.1709236349457;
        Thu, 29 Feb 2024 11:52:29 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id 6-20020a056e020ca600b003653eb24e14sm492989ilg.78.2024.02.29.11.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 11:52:29 -0800 (PST)
Date: Thu, 29 Feb 2024 19:52:28 +0000
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
Subject: Re: [PATCH v6 7/9] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <ZeDgfIojODIbhs6N@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-7-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:50AM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.
> 
> The 'always_powered_in_supend' attribute is only available for hub
> devices, keeping the driver's default behavior for non-hub devices (keep
> on in suspend).
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 25 ++++++++++++++++++++++++-
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 4ae580445408..f1b174503c44 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -261,7 +261,27 @@ static struct attribute *onboard_dev_attrs[] = {
>  	&dev_attr_always_powered_in_suspend.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(onboard_dev);
> +
> +static umode_t onboard_dev_attrs_are_visible(struct kobject *kobj,
> +					     struct attribute *attr,
> +					     int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
> +
> +	if (attr == &dev_attr_always_powered_in_suspend.attr &&
> +	    !onboard_dev->pdata->is_hub)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group onboard_dev_group = {
> +	.is_visible = onboard_dev_attrs_are_visible,
> +	.attrs = onboard_dev_attrs,
> +};
> +__ATTRIBUTE_GROUPS(onboard_dev);
> +

nit: remove one empty line

>  
>  static void onboard_dev_attach_usb_driver(struct work_struct *work)
>  {
> @@ -286,6 +306,9 @@ static int onboard_dev_probe(struct platform_device *pdev)
>  	if (!onboard_dev->pdata)
>  		return -EINVAL;
>  
> +	if (!onboard_dev->pdata->is_hub)
> +		onboard_dev->always_powered_in_suspend = true;
> +
>  	onboard_dev->dev = dev;
>  
>  	err = onboard_dev_get_regulators(onboard_dev);
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index 4da9f3b7f9e9..58cf8c81b2cf 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -12,60 +12,70 @@ struct onboard_dev_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
>  	const char * const supply_names[MAX_SUPPLIES];
> +	bool is_hub;			/* true if the device is a HUB */

nit: either drop the comment (the variable name is pretty self explaining),
or s/HUB/hub/ ('hub' isn't an acronym).

Acked-by: Matthias Kaehlcke <mka@chromium.org>
