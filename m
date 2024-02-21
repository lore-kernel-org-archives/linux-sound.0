Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C586139
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708543456; cv=none; b=njHb/5rZY8olCUiHocnHz0vxjiY4bXuMq44PhHFlVeGjOnzmnY+709X1Cc/990FapcpV3us8oq1u2uPA5DPuDlE+45suPnAdd27pwDknYCohgDLtFCQ58P6IoVLa3E6+7TOJb8dmRBgrtuHRv5SCzYW/mWqqgQjLWwGyyve//0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708543456; c=relaxed/simple;
	bh=3T+4Sowq+/a2cVZqSXKH4sBJEPnTUsRKB2xiZ30Hff4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGUgoQsEk2n2p9/QqZYrli8OtWG60J7Jph0HtDtXMtDK/DrCFQ4dELydeW7KpQgkuG1Hi5bIGXkNt4aa0tQ3SJ1lAFhihQ86zQZo0e/BTYMSnxFgsKoSSdNuFtDp1LAU371Z6ktCTjM9ZXXrRGw7Ui1veOD0lD11B57GUACiL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZi07Wty; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZi07Wty"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c488a5af5eso3166339f.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 11:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708543454; x=1709148254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
        b=PZi07WtySJY7RDcpykVgk8yCt4XeyzKR4b/MLOYnEfo/9gsVh9c06tUTGt7UZ0N25Q
         pzn2QrHpjg5szoyuYmHF6ymWPS4VT00vRRlFybrI6xhOHm8IJZYCkNDb/yvGiS1tpfoW
         wgFZpy/LFhQJKLzlVa43vbIRQ/PfhGi6Urqc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708543454; x=1709148254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
        b=dlMGa8O2SJCC39iQUvhTswdIfAxQbI0YifpcQ31KgTNkiR5WeXsptUADgsGI0Ts0EG
         93qxgNXK0S7ZvKKNJt7kYLldHvHEnLo9x/LJoUfAtTwNTWdee9eFmF+NtFOgqup0Jfz5
         M/ixu2ryAI8XAmoGDKx0fgrz46BsBFMZ6R4bM5GoDAiL8rqHBCIe7scsFn3TYqRK5em9
         WRmhAgIHSQJgFMz2NjTHh7MD95f5S8peN+KZFJz09rBGf/jFZUq8neSmpwBY6mad4mXq
         581IF7Wqc4Z8qBg1hrH/Vi7zZ+RpyHi3cZAky1Zwa3oNQ0AUtObvpxKPAIvPEdYzAAA7
         a+7w==
X-Forwarded-Encrypted: i=1; AJvYcCXBTt0XO1i4bMKc/IQ6T2FyCgwklfeK7CT/h/SGvvp/ZBej8Wm7vFRpPXtJ0qHKYdHI0TpX4yf0IMSNwA227WUuESW1pDrZBo3P5Ow=
X-Gm-Message-State: AOJu0Ywhw7cT8ZAceP0OLuw86GNkJDUnqpTFTpdAS3Lv4Fe+Hy0WDEW9
	v7adkY7iHQ1u32aa5hEgscR2141YxtmRGSwQ/e2p6d5XbXLygIBQMSNQLmoo5A==
X-Google-Smtp-Source: AGHT+IE291cBjzdobD8lyxusA74siOxGXcy/qiDGaMre5yQogt2xjfceKZiBvFi5jaiIFeXbw+8BWA==
X-Received: by 2002:a6b:e519:0:b0:7c4:89b2:8084 with SMTP id y25-20020a6be519000000b007c489b28084mr423301ioc.1.1708543453597;
        Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id x17-20020a02ac91000000b00473f31f96desm2836260jan.90.2024.02.21.11.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Date: Wed, 21 Feb 2024 19:24:12 +0000
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
Message-ID: <ZdZN3FIS4zcKe4Kw@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>

On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.

Please mention that the driver doesn't power off non-hub devices
during system suspend.

> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 2103af2cb2a6..f43130a6786f 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>  		if (!device_may_wakeup(node->udev->bus->controller))
>  			continue;
>  
> -		if (usb_wakeup_enabled_descendants(node->udev)) {
> +		if (usb_wakeup_enabled_descendants(node->udev) ||
> +		    !onboard_dev->pdata->is_hub) {


This check isn't dependent on characteristics of the USB devices processed
in this loop, therefore it can be performed at function entry. Please combine
it with the check of 'always_powered_in_suspend'. It's also an option to
omit the check completely, 'always_powered_in_suspend' will never be set for
non-hub devices (assuming the sysfs attribute isn't added).

>  			power_off = false;
>  			break;
>  		}

Without code context: please omit the creation of the 'always_powered_in_suspend'
attribute for non-hub devices. As per above we don't plan to hone it, so it
shouldn't exist.
