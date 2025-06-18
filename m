Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8A2E54BF
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251430; cv=none; b=keniMZe9wQL3Ga3APItI39rlGM9Sxr7IdTDZlwQP8dD76xb9Pye0T2mRcy1QrwnOyJAnE7/CeoMm8Ij591aPtVkettfmbcg2yN7EQ6VFUvo/O7OfOBgsXZgPZbld1qEgJYDT+h9ZAfSz9OFgxqP/LKknTAQQez2FWsl0ARqQzZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251430; c=relaxed/simple;
	bh=chU3ZzgX8ixQ80XuNsDpy9w595hkOFK6g+6/L8GwJwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep5f+7FGEclyvXxtfIGGFzGMcQ1fRn1KaqIJZjO141Xo441Q5fMK8I5xgyko7VZ1Mwzrz4EBa+YpNuUHCtG2lf0uoP6rdZHt0d+zNKTnWZJIYoij5UcaqlojkGHKsQhWLNYMP84QETLoB27356+LAmGrx49xRIm1R2c3tuVBdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vooGQp+c; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vooGQp+c"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e81a7d90835so6583732276.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251427; x=1750856227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=vooGQp+cXA7Bl9EdDFb5l+L/SbQXuI4V5FZ0RzgjuAXNy2/KAcAyg2o0IWDzripkkE
         tBcO61mGf6On7hilM9Kk8BA7p/r54kdadUGCT7+RjJWLFtKtD49Ey3xovothllGuoj/4
         cxXsMsagUqhtNDY9xe3IgmmjXPfqYXJqlV92vCEkihxdk3DWBzTR13Wc9w9peHStJI3V
         2RGg4jkTHOtGpN/1nexrUJ0QdBXUzSHI/I18yISa6Mx4qaxv6QSZzxrY1VkWUzOfo/r6
         IL7vbyCJIta0JWgxjWOjrHPMkACNqcs8A1MbsIp1o40U5q2UIjPOipsV3G9Vi/CcrE/r
         7Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251427; x=1750856227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=G/6vrq//c/wVr3XLcJAnqyN1h4ZVLVxINe4LKAl/E3BHCn2f2YxKNQETPMMiDrPmig
         jAgSoqWZFsj1g6D9KQa29zEIScfQwez1xJSGpKw7BOiWsLf/5NOMdejwwpk9nhmIUF5L
         TMptNk7XK0R6NTGUpolt3lTLMUZUiPaSLCwif7ebwBbymRoIfMHkrUZY1HO9FinPQi7Y
         7CIzQxXgZ5JptD6KQM4rGv43EovpRW6oKSf2QoIpol679hhnAhjURFtJ8MUI5rDRKTpg
         DJhxJCV42QCvErZoI3hQ0qKyMbzSHrp4gSj02m2NwGrfHcya4bpQ833MW3OH4EVEpkRe
         KWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeqMQY9PQNcsIMz4Qg20UTl+0t0E9PT/Kvl4OyZZ/dXfJT4lZPPxz+6WrVCcrscVQVM6LmxD7lGWYR0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3ZyIOk161KjOBNywKeo2F80a0w/TSXzSBKdMqJZYnhOP1LCD
	jrJD6tp4yQNrXD5ChhDI5FL9rh0Y8w1HIRPy3lgZDbiix6ectC6+3wLCs/w6qzBWFsAFp+KiJXu
	Au5k8dAUgBHdhlQW6TqYFqgQiuYFfTaI1PL7/8whvnA==
X-Gm-Gg: ASbGncs2+8ZvZVkc1M6M4zgcOCv1LafJWZV+XeAUcFl/YNA9WqEY87k/b8EpX9KHGfq
	x5for5Stvd0MBzEwJOBu3TkVaOfZiMlMzVX2FgD5VGdrdCyRbnl7wUe6VbR90xDppD+gwaZwU5U
	Gyi+iNM9BGfs5QWw7+AdnBGLc/Dh2Y+YtouRD18OzkCwk=
X-Google-Smtp-Source: AGHT+IEZlf2SkQ6pDtcOhhdvV3LmUw3iR0H22QpguHg1V4liWBddtmQy97+4HMMAxIbIevgaVnIrB0SHGsEYRyBVYzQ=
X-Received: by 2002:a05:6902:6303:b0:e82:2b85:ea3a with SMTP id
 3f1490d57ef6-e822b85ee43mr16723424276.32.1750251426746; Wed, 18 Jun 2025
 05:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:30 +0200
X-Gm-Features: AX0GCFsnEI_9cu3U9fY7I_D0EnrNerJPcmhYfg39LAqv66uN774UfRLbAU6VCkM
Message-ID: <CAPDyKFrQ3Uj+coa0WCG00_pyaxu-yEnH26qmS6tevZ_772oZVg@mail.gmail.com>
Subject: Re: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 23:12, Sven Peter <sven@kernel.org> wrote:
>
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/apple/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
> --- a/drivers/pmdomain/apple/Kconfig
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
>         select MFD_SYSCON
>         select PM_GENERIC_DOMAINS
>         select RESET_CONTROLLER
> -       default ARCH_APPLE
>         help
>           The PMGR block in Apple SoCs provides high-level power state
>           controls for SoC devices. This driver manages them through the
>
> --
> 2.34.1
>
>
