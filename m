Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122013F425
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 19:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709235793; cv=none; b=ai39kVpnxVCyL8kY4cP8sqdaLZnsKo+yQMG+3ecVtSUiUOIfGyv5+3VBUR4RNBWy+7jkR6erHNrw58n7tKpdXzG/b5QYR78PieZDISCmuZ7TMuDvSyMajwia/Ktl43w6Xmfg4HRg2nVoBn3udncmdJPk0sWIFb1KklhfhVcEMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709235793; c=relaxed/simple;
	bh=z4br7zD9nOzBiMkwamc93pBabVM0YG6eSQefAbwCJkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukyqWy9NxuziGqVtg/pBpC0Xk2kdETgMWJ4wyAqJIvRQszb2ejHYka4vFY5Eu5RZMrxpTaA0buPDiCeOPZUoct2dKb/KCPfu4vynUsASJAfP77qTcXlOpiN+c7sQpUheeWoOi9LyPuHxOzzyNw4YG1J+NKWEarmgtOt1y9j+7xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mvcMvTv1; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mvcMvTv1"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c785dda899so66111139f.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709235789; x=1709840589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8CJpd2zjevkw27a8KH1DmVXJgw/Y0RSSqYs/uQ6sww=;
        b=mvcMvTv15lG7dodcDtpO9NtWIUGjtxjefBjg7FVxl2jQO9eWyzJ1gUKpV3O6ZV6MQV
         fLVNylwF7wVDURk194kTF3qfs3FyuCgwq/2Rq9W6r2Jsp06lPuwpZfCZOiLK2CHFEUHr
         HH2/lzwDcpJlHyvSqVg+SD3Ws8Gjv0USid0K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709235789; x=1709840589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8CJpd2zjevkw27a8KH1DmVXJgw/Y0RSSqYs/uQ6sww=;
        b=K/LxPKahmcz/FUSm75SyluuC2+ojAnfK0596nStAcr4/XP5KiG0r06AIH6dgzgoO1U
         vo/BNcjfMoqdMLSgxBSkC8ILAp4xbXhWY+n6kkGAeBv1q8ooYWg2zVKN79UTa6cUyXfS
         RefPoyDOyCkCEBVLW2YzltR753v1bfhMMMD6KtYCZMQvaAeRMrgY0cuRgRjwmkKohl+L
         fku0yg9gMWw5iimTMLA59KYKfnsRccwBPPyJ+yq0dPiIm1uxHxjqv3bw8IMEq6Kt0V+Z
         Zr4/nSA8Xn2b1j4A5UarBoW+4D7afeXOKV951F146D+H0EFT9j34pc8byNObs/2UVT4p
         lVQA==
X-Forwarded-Encrypted: i=1; AJvYcCVOaRtZMl8D3j5VLyFBj7JW02laqPb+ahkgWna8hh5DSEtFcQRv8jJYQ4+XC/p6FsEki5NP3T4G1FJiSRrBqZEyAftyvc0T3N6RxR8=
X-Gm-Message-State: AOJu0YxtR20fYPrZR3X5lLYW1LrKeM7cCV+8/i8AYpFb4tTQAtOyIDO8
	n5XLo0A2ZPvPDywjPRvZ6PthOW4EXbpNGrfEulpRyoj2j2BtHD9i7//Oplz04g==
X-Google-Smtp-Source: AGHT+IHgIo2qPrUsuvVLTw7+MTktv0oQumqgBoVoBnnMijf9sWuRrwq2Jdy3DJ/2sgHur6o+XReVVw==
X-Received: by 2002:a05:6602:1c8c:b0:7c7:43e0:335a with SMTP id hf12-20020a0566021c8c00b007c743e0335amr3364192iob.2.1709235789521;
        Thu, 29 Feb 2024 11:43:09 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id x25-20020a029719000000b00474663a39edsm460221jai.50.2024.02.29.11.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 11:43:09 -0800 (PST)
Date: Thu, 29 Feb 2024 19:43:08 +0000
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
Subject: Re: [PATCH v6 5/9] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Message-ID: <ZeDeTFh_V4Eux5uK@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-5-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-5-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:48AM +0100, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
