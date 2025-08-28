Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C657299AAA
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414777; cv=none; b=mH4EZpSJ3c/PfYTlkJ9ShR1tI0M99P/Pdv9UsDwCQKkGZCWoYEpc/C00NQ5eXOUtvZEHAA6T4FN0kcR0H5imbkudNllEA55rRHtoSD2ifkhHAz/NRC2Lkwd4x9Qw7IfjXtWC9PxwWChvY0RhSvMO63Qq7TE4XDqFNQHPhqCdJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414777; c=relaxed/simple;
	bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNsZUXYhuihbAsaWTWI7ubEIOXG6hBgH7qtrtaD4Tm5MuBkFb15Cv8VV5uJWGxobzFugNTzq/ZtgUHi3UdN8j5bJoxHnSDpA+YkgtV75DEXCUcPk8o0LP++sUg1qUIJTPoeJq9G7eBsYDOr8KZIcTSMFFi0ZbdK4I4Z20ZbZACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ma0UHEbi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ma0UHEbi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6507bd53so846044e87.3
        for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414773; x=1757019573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
        b=ma0UHEbiqECEh1ErdOJKkoTyNFYpeCWAacmYShnvRQtRoLZw0bgzRlsCjg9W4G05n9
         +tZq90pA8y2W96oo9gJz3DFMyIbReffSe0GCsxR7W4QNpvMQMajQS11gI9WjHmlS5/Mc
         PVErZ3LQQg0yK71YfAMF89IX6GMDptM56tP2AKp+h7SkBnQ1TWOPdQw9Sv7C0qcWdwEi
         45VtKF2ccAVKTJMbuQSGsqXuKZLPWwCdxAxB742/7pA7mmvOtBPkvL4cTNMwOKQRVi+z
         1x0asfo3p0mDwZxQTQa+qVxw1A+GwnJGx7QDVH9uk/k80sBixcSfQgo1INWRs/KflI72
         hnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414773; x=1757019573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
        b=AG5YC1EN+fd8vGcQ698CPsqv772YzBdEmMiHbLNc7IKb/PZEXX1yKPfHmSkv4YC3In
         3WKnnhHZlUXsbG7QmsNpjxP36r5KKtcAToTJz8LdWJQblUAXXE14y34LUPQUUUOrNFMt
         n6WP7ShFPM24V8AvsKquapWUjfz9EAkvZYmEgPR+TZ3YhXbr50I8uckwkPTgB7d1ohvH
         FM2BR2h3VWeVj5+T1nCJp50rEOw9/kKQjVAOrNTwzw0UKU8wM9yMmwd4RGUbsWgJPv8u
         ImGgByowqSx7PDKAmfnJJHAQSxKYmg3vQN5D9EQLwI5NzDfKOR+fiTO+lTxSmcQamPGI
         mu0A==
X-Forwarded-Encrypted: i=1; AJvYcCUWhPO+rx/NOmTnXZJyKImZMLpXWxsho/2dwZIDAOk5Bf2AR4VsIJcOrlBphdasK+qYf4vZOq+4v4VL3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxITjOWNLaE9QC/8fUjzusWPRomELuixLt3Y/pbHj9QPEzaNT+u
	uK/d0VGQK7NCxrAD4AyNc8tu4VnrMJyui3J+lAEKN5PN2d2V/+WWrULIfqY7QHenj2SbV+rCGoi
	yOjMy7XB0A/iskEUsouquXSdrauq2YgqjQY7xK3w4cw==
X-Gm-Gg: ASbGncuY47MVsms52BsBFrLjE9bJm8WxIapQsL5IN2W1CDHMPYt1iQzR/jTVT6GaLmW
	HVE7MNIH0G0O5EDFgriLSoNm0W1jV4RSCvHRwfLBGp821koIWVNsjBhZ+2mJAqvETicLqCpgnhI
	a93NFQPRIQjmwAFV0Pe36+cHdgVaFUXFNNIshC9uerZm0qUAQmEXJ/mfc8wUkYothjIMkzU+HAO
	GadlRk=
X-Google-Smtp-Source: AGHT+IGkAeRfSepttrAWspST3WxeFhzvmsQkOJn8zGWgyydoFU7mfe7dFpmDKHnPoU/jmN1MyfkA6699WvyfKPSV4Ms=
X-Received: by 2002:a05:6512:6301:b0:55f:503c:d322 with SMTP id
 2adb3069b0e04-55f503cd585mr2344975e87.40.1756414773211; Thu, 28 Aug 2025
 13:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:59:22 +0200
X-Gm-Features: Ac12FXwdi56r5WxKQlnuWh0e5CWqxbReZCdYkWbkMywpfjpFF5zgYMlMEAzYzgg
Message-ID: <CACRpkdbvLhTQ8EujGg9QMbuGVRDnH9ApVxVt1NdmSmPw77QXdA@mail.gmail.com>
Subject: Re: [PATCH 08/37] pinctrl: apple: Add "apple,t8103-pinctrl" as compatible
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 4:02=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pinctrl" anymore [1]. Use
> "apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
> and bindings were written for.
>
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
