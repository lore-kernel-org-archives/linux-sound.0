Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF92D3A75
	for <linux-sound@vger.kernel.org>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181049; cv=none; b=Lsi6y28zWqxbEYa78KlCdRHBDOEyXbjQ09Jbgga+Cf4iEX09E+rdj2Y412q5B8/loMzS2Eq0Pj9IkQ93VqNWkRMedMke3l/vms39IWtycftMFAfjQEZV/LVglsThCdsGggmTOsq39dnWpnYjSIojhRHbN/5GjLbjWSSLqz51eG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181049; c=relaxed/simple;
	bh=LcIjzS/QX9OdfzWd7S5fStct/j5BiQOmeNhDz/vl8LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIAYadlyyE6+2TUfjOp8sjNuhSPmIe0kNop9txT7xxCWiuO9KuGto5pkEc7my2HAOih947k6ATteR1cMt6PSI1sWHh0D6wYstJx6R+8X0HTK7DDa4cPxy1HTSzLXwZOA0zBLePaa5Xz1m6JIG8+P6Ma6ww5yz1twOR8FC6kXdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSTEl7vD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSTEl7vD"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4071258e87.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=RSTEl7vDc1dcrV43f4lJp71x71nXdxonolSC+FgFuW2YrEJPE+ZMyPV0P1/UvbeGg7
         3rIAzVfJ1h0EgIoQYtz2j49lWTVnmXZgCkbqWODl5IF8edwdTqlPYrNnRJGjJ9zC9JJh
         jg26EOgV7P0Vm9/2A8Ovijk839KiGACsWcyvRNyBTYzLEo9LOdlFT5Hmcx8vEXK1tV1P
         OQIras0Rhqw/3cV1AH8p6GpM/2+6Cr1ogNpf2swjA4i7kItSWxFyxyy2T3nBWQHOIzPo
         Qd4p/0Tg5LLNMbWm37CZG8gcG4QXRYLWvsCywPbO6ahrgrZi4l19j8AXaL1xAa6vmOoO
         x3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=RgZ4dz+HQHP6epzTxiQ84JuenvoqKYFelXkIJt6hFWrHQQTMSey+M0mAM4sYk0bCws
         cVIecJr54sINLmaR2muLHB1c/fs+ovW9xwmE1EdWh+uadVmHfMawxXSR/lXJq0gAo0jZ
         8AwiesGdXuvAoL9QOinOEX6tnwVC+ReZll9iGZXz9iXgNpAaZdoHXN5vYx3Gl61Q83x6
         44vHueL83Rd2isu2d/LDijMN902bhLMq5kJmLzODIGpdxy7+dHf+jwbdV2In4BYiJq3A
         UQk6JWfDFb3Dp+rArwvGMaVN964a8va7PO0bys4TxYSzriAL4YWc4xvh68ShwdJYPbf/
         wb9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9nHtSLsdRjnoEr4kW78FCCYfxV4LHZRLimvIuPXvqw/fvyTanMq+3DSxW9WLgMU82koxhGyXX1BoLKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KzD5qIQCdNLp8+f7gYSBgwMmZoHAT2c9xLdNWviv9Y3mLDh0
	GnR3879eGCfLFU3lU+7KRySI4xAhkQ94geemP3V+VhXLjTsoaGYb2n7c
X-Gm-Gg: ASbGncuDywTKD5XzcD7dSG65p5tw7EZO63FwcbECLaT8iytCS2kAra1vS7egOIHH1qA
	ULuT/M1S3S13arj3Qv2XkeNrdfodC0/a6/ELCnmB8yJh+pWoF/ximHtf88nxzfk0tU3VftOKMhr
	u+kG8OMx7hPjWpRYtqRgjaNl2Wckov7woIbHJOlZAUZpdNxGr+/33IaRtblLPUQJWd4So5wx925
	5E0rAJqlzmwgsjxXPAG1XGYlnQ74ZeIUxkQKe1+kqYBRsN+e+0cqcwX7+xvC0Zcs6Cs6kxgx6zx
	NFnNECgqN6G1I0fmjThiHilvWYNmw5BADT9VW76YRdn8tYs2q6XtB6kqofsjH3+pnpwQOCccZXo
	BgII7y80Px32VOr7ppU7z5ZNX4EJcHURLZy9gRYNwvTjYsIRkc166aMFRMTVSd9AHHB+kQwa6eU
	sSCMJ7PVEUVD47aW+sStDkFaRwLiOb8TPpUctqOb/BUUrKxgxXg9adk4UUrbnAR58mWOUoP4RmI
	t4HUI4=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
