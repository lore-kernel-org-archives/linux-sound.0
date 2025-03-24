Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF118DB34
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802461; cv=none; b=TIFHnHrBoVhNYSrceSYSF7WFMhhYgyDM+faRk0alY9oAIncwwKP9blkHOUNYCzcUtp2veeLYOHYNxl1AbOmpyGey3jKgL8Ayt5s43hL75MYgaSQSVLjlENmctZa3J9n70dYF/EsVfHBo6qMiQWRp2iVvmk0zwLWgKyP1hAEjJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802461; c=relaxed/simple;
	bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXtSVEZrivGgus05Q7nQ2BXYoWlYKz5SccorhPurmUqxH2Om5HKxC8soRMzhISHkP+Rh04wfJqmw6pBDnAbB11xX0WN/RskFxXlnwdi24XvvDBVTDJEJzEsJDyppkhdDS+wexfaCIj04MZ9TH1QhkKgbQ4p9x2PBnLDDeIuwBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFubLlqx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFubLlqx"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499c5d9691so4483199e87.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802457; x=1743407257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=kFubLlqxdANp2SaBSJ2+aCPynJ9e/fXGr5+x5KsTu0KEQ5Z1rx+KrlGUENa/0QMuaH
         /5/t5mcT6gkVfaR4n3y/X4KhLEw2JF5yP0zVYJ5yn6ld+Be3LJKfWXuQ4TI1URgLrNyu
         9pt0pjs7qtqpLpGcU23v782REk8MgkyBhtq3q261lfdA+Ru0hNFCI/VLzVSmB3pPHhOZ
         GXl1S/WBnLQe7fRWeCtipLe48yeN+K+4eJtMm6SHFHLG5+EXn8A6BOwxzv8T1oQujO9E
         u6crXoeupzIXprAianNGWSNTAU5ckrOsndm5I9CHxAlJWJ+6IFWixJtyZvchiCj8ozXq
         58JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802457; x=1743407257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=esf/SVmTpC2OY+/1qrwmIWOH3l2PtXApUDoklihm3kPz3DybnNhT13s35GtiCyB9bZ
         YNTvj755MVrqJNfV4l/nZjBReAEdiF3nrwnP8A7NbElYWfl+iH/fqOxMTKOCvhFV+0E0
         PiZZxbfLmdzRetOoGpsU/Q4QU75ApoUVBHkYFVTXrqowHsZwMiOtXmi1INkbcSzimBuj
         jXA82+1K0W0xYb/o79M867aFfoOcHKEPzriqhQyLvTaHkAImzd6sa+rOVf5a3piMUwfm
         ukBoFqd/HpqvPAYDW1L/kOIJkKLddxUwddJa1j2MvRwROCIErgcdCBDAhEjtWqY1gMmP
         P8pw==
X-Forwarded-Encrypted: i=1; AJvYcCVHzBaVN5VgAtxC7ktEiw/N6gn2S7fOvrW78fbUyzs0YC5jQKwhPzFXt0qg9N4hMZU2Kel7Ib6zNJ/YLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FhnKC+hKEO5XgRj992sR+rSYJZVLlZh5OgWS3N081/SrbACV
	L+1Ra/u4jcnQejadaUXU8TrtyUS5zDVtuVO7nR2Hc/3tTjJiSahj0Tndn2ZSWyu8pbSFk9g6X5v
	0WJp/ybSUOtgKw34Vh5nKNWbrhCh8KMcYmhfNOg==
X-Gm-Gg: ASbGncs5c5sARZqUdqDdTfe/dSsZ8tqBHzDSQ60MH9T3artrdH5N7gFVTFn99HvmmHT
	+6vfY1zm5xbhsL76u1+NEoPwGQ8u4qd6k2HvN+S+hvQc9K7++sLlLAfT6IcadKNlZEuydG8L3U/
	U/zD3webPSlCYjBMfWRcPfkGk=
X-Google-Smtp-Source: AGHT+IFoKZEu+cWJ6kUjBS4RpIBDAR0l8rGtHeVCikA1xU6nS5VUl5q1Ld16dkGWapP7A6sIfZYBs2kqSSLj1B5qKIw=
X-Received: by 2002:a05:6512:3f05:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54ad64f7da2mr4777907e87.37.1742802457021; Mon, 24 Mar 2025
 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:47:25 +0100
X-Gm-Features: AQ5f1JoLqXpK62k6ENcNGiw40yjAMqH6KjKoeHo5l6jpodi-SVCf3FhtdJEoj-w
Message-ID: <CACRpkdYLMJaC7XREXL4m62B6x8fc6XvmR3FfXYUfh=QKM3whmA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> - Use dev_gpiod_get to get GPIO descriptor.
> - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
