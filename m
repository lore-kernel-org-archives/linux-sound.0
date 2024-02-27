Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49CA14A4DD
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709056511; cv=none; b=rAc/gdG198XzFm3KwI5fGx6qfaXI5f+X+mm+VO0ZRP8QzIkIuszfOAZnxDWmeH1II+uEzymxNOQkjsrixX49LXNAXO5SReelHEM3/wwt10P9l9QrB6YFxwI1NGZm+Sqpj/sr5uHS5Pr0J90ibrs+iZTMTzIpj+6ORUTo8zk+SdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709056511; c=relaxed/simple;
	bh=4mxpcwtJGmPAx0hGuHiSF19sttpDcfgAzEqkq+js9w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/qIG/yQdIer8gch90mNkbCqQ0foAnjUFYcx025FgPcmREBo8OqZNjfNAPiXJLVHFFJfj0YrvRSu7kgTQMMlMFG51ya6FhrL4SQX77Qwpz4JSx1JeFtcf2uPswjTJZ17qqhjXa+3Msu0zS6jNjRqgda2n9e7U9nBSkhxcZKhPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=chESIHFZ; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="chESIHFZ"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c7c984699fso107409939f.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709056509; x=1709661309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0z6oy3tLEwRGgu8/omrsseYREQZqlDjlucfwbridRR4=;
        b=chESIHFZopoekdXZAIn5yr8L36LqKiRAzMmBw0JBzQdug/CTAodhBYAHHvD7wNUm7O
         yo4UCYJAOc4GbOcIf/OFhVNYZ5ssaZkAGjeQcVoSFwmTwDttR51c8WWCh5ULH12ghuGq
         2UZsNyck+l4Ae2E9kGCporZr2CKI+1eDAI/b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056509; x=1709661309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z6oy3tLEwRGgu8/omrsseYREQZqlDjlucfwbridRR4=;
        b=tTdcao2WLSNEZ0oCVqchGArf2S0LTU+BEQpS7/g5+bqP2PJn4MQSCP/lWgbR/ETbVP
         StPasHY7Op5kQV/J3x0KRX+0n9tRdRX25ZXZNfLIlg6YtuJHLICaGyHVPnTFMm1lkVPM
         6J5pGqZxNZBPaEflWDVzm0638WtfMXLOR2OjoG398mAP8VqvovHYsHIm0+WUGMs79Svu
         PFLtvrRccVjBt9zc9vfYQyYIk4P/7bC4xYx0iqWcUzCnPfJcmRumBGTtvuACb5/UWwOm
         4tVA3skb09ypkTju73K5F/WxhABW7TznuDGv+avEStYOYVhKt674K2Z8+70gGE+Po6sI
         NEug==
X-Forwarded-Encrypted: i=1; AJvYcCXsKlraTNYCJmu31gSkrl6MD3mKd5trw5Z6PcU8gaA0SQn7LnewMWxJ4xHbbIzJx5s9rNchqWKxNb1WpH544kHHVYXXY3xh/UrtHQc=
X-Gm-Message-State: AOJu0YxXdxunl77DGmaObguLyhSAGbL+UVMJsAYwvwWBgYDLLomTWIe8
	Rxqhq9kYE3HDihETqTUQK2ozK/3zrLTa5yefQvYBwkMcaU+EDX3cqswmj6o6YQ==
X-Google-Smtp-Source: AGHT+IE99IEm1bwDJq2IEwn8DzuSvhEObNZduooC8XEtgQeAr6li7TB9E5Onf6yMe4pPR4UCVj/fTw==
X-Received: by 2002:a5e:c007:0:b0:7c7:9184:df98 with SMTP id u7-20020a5ec007000000b007c79184df98mr13293582iol.12.1709056509170;
        Tue, 27 Feb 2024 09:55:09 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id u14-20020a02b1ce000000b0047464deaba5sm1816183jah.114.2024.02.27.09.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 09:55:08 -0800 (PST)
Date: Tue, 27 Feb 2024 17:55:07 +0000
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
Subject: Re: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd4h-4Nm0Kl-7mqp@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
 <ZdZN3FIS4zcKe4Kw@google.com>
 <174ce57a-3197-4251-831f-205ec5cfeae9@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174ce57a-3197-4251-831f-205ec5cfeae9@wolfvision.net>

On Thu, Feb 22, 2024 at 03:42:26PM +0100, Javier Carrasco wrote:
> On 21.02.24 20:24, Matthias Kaehlcke wrote:
> > On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
> >> Most of the functionality this driver provides can be used by non-hub
> >> devices as well.
> >>
> >> To account for the hub-specific code, add a flag to the device data
> >> structure and check its value for hub-specific code.
> > 
> > Please mention that the driver doesn't power off non-hub devices
> > during system suspend.
> > 
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
> >>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
> >>  2 files changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >> index 2103af2cb2a6..f43130a6786f 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.c
> >> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
> >>  		if (!device_may_wakeup(node->udev->bus->controller))
> >>  			continue;
> >>  
> >> -		if (usb_wakeup_enabled_descendants(node->udev)) {
> >> +		if (usb_wakeup_enabled_descendants(node->udev) ||
> >> +		    !onboard_dev->pdata->is_hub) {
> > 
> > 
> > This check isn't dependent on characteristics of the USB devices processed
> > in this loop, therefore it can be performed at function entry. Please combine
> > it with the check of 'always_powered_in_suspend'. It's also an option to
> > omit the check completely, 'always_powered_in_suspend' will never be set for
> > non-hub devices (assuming the sysfs attribute isn't added).
> > 
> 
> The attribute will not be available for non-hub devices in v5. However,
> if the check is completely removed, will power_off not stay true at the
> end of the function, always leading to a device power off? As you said,
> 'always_powered_in_suspend' will not be set for non-hub devices.

Even without the sysfs attribute the field 'always_powered_in_suspend' could
be set to true by probe() for non-hub devices.
