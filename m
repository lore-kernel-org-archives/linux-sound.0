Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02C2973D2
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723613; cv=none; b=ugWIGTAMprvv2tgGwwTbQmDFGa1d9dbSgZKUOXZaKQjxilVaomaczA2+Da20sTWgpRN1x+wg/CbgNRHLCR7egAlS+Ka6B1X+H8fUGmN3Kbp4ws5awgoF5SJuR7raFMEthLom5BEjL6vHpIsLBCm6X+PnhVR1LkkVfC/zYYPNtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723613; c=relaxed/simple;
	bh=lVXdbLNZc5AGCI/m+WH0+vrOmz260sal1dEBRrG4Lac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHknmL4kQYqLM8WclYrbLmKWKbWS1pQqQeUL5F7MM3n03W0VQ0rRGys425DcCttCA15ufu36StK7QzwekW6YxaeToO0oq8KJ1WV8lEcW3vVjvQjtgU1R3hC1MICJZ2b7u3qibb+Hh/TN5o4dfe0rgdvEw7hk83cj3+ESLvwXci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x84K+9JZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x84K+9JZ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso53052011fa.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744723609; x=1745328409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mnIUnyte0JjCrqPlk/shKFeBEN1cfamo5EuUJhYbWQ=;
        b=x84K+9JZ940rR+ZAqCTMQC8kYH8VKUBGulQTc5MaoMQlIdau5hMsOtxcMRkcJHv92g
         NK3LDYhtkPF19j6EMZGqEfSGxpy45vJ3Qi2aoIe9JQCbsSo+sXlyEQ+A2Mbv/FKtq6qI
         O+qdupf1eE5HPuYihO3dBl6uZGIO5bh4C3LW40sfjqVcGODvbl4ejOIFkvLv5G8GYLoV
         fYg5HTpHue80XuMTsEpK0SOPOE6GnRJzZhj55NNj8G1cch7YiHF6fjAlMZVzS3sZbR8v
         bhOeDLgODQHsLK2iIHMsO+c1dnh4e1zmK1zfqKYc9+jevR1+ps2FEFRlzSMbuFw87jiQ
         K8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723609; x=1745328409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mnIUnyte0JjCrqPlk/shKFeBEN1cfamo5EuUJhYbWQ=;
        b=Ue+tscpleNo1EC1v9OYCzedTOnx/x/4zf9EqvRLR0T5C3ZlQhA8+GpXLFmbXJSzCrw
         0CRhXMmEqnFUbHAcSMTQcJk1ayVq5fmLcL/GmSpyaRPLtnBdN+YXmYjousAHt1+LlvjI
         4x8NgP7j9QPg6k8pAEBqu5H7ifUy5czoWvHr/UcynAGjPGPWb6Mov0E/dvzABil3ulWG
         fJBb+g1LGKEvYvMk6yV6YnTX6dtceLbuFnU1ctXE3yXKeeF8oyhOOrPSbBoYGH0uRxVM
         yAfg/QrWShN+CXqxuQtCzqqFSo2k4EnQxTSshbbbLPz++2DAURBhmHwP1sO9fhkJ660w
         eNVA==
X-Forwarded-Encrypted: i=1; AJvYcCXJDPALObGEgLrdBLnsQQbK4gbtQfyFAcPXBG0WSgJnacrR1+Y0BSnzmuqD8mwyzPOae0yTBiRFlaOJJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzjEotWxHiZCpMEFOYcXgGt99+7N68IpyqBXZyCMMyhW4mzcf
	2CDs3rWwmB7uPU+chDJ2HDerxFVyEI7BACeRcxlOWANA5gjsnVxwNOjIcdYCArLoihniJTf3RzJ
	6or+4EgL5Teb/mbGreKn+bRgjXWAeKXiM44nKjw==
X-Gm-Gg: ASbGncuXB3Uu9tkiQwMdBxtnPde8hFWJzCUGCXLCkp9mTXjY32tKGfpT+R6l1Mp1A5I
	p3fU3iHvET5+hNlX2Sxsvv9BNJ4hRt4fCv2mQg2/kzeE4jK0hCAaXkbeNymyAKJMXM8+rgk3HIZ
	nt+i07s9L11YW+3/QjviuIoA==
X-Google-Smtp-Source: AGHT+IGaqMdDORoDk0oIpmVA9qaXULvhBDGAq3POpJ1BzdO1XxYTT5N0Ria/f7LYgIqZ49z5yfw6KL+iKeZIN3qeueM=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr57070551fa.26.1744723609211; Tue, 15 Apr 2025
 06:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:26:38 +0200
X-Gm-Features: ATxdqUFtZb5w1hNZ9E0eX8yQcoRtW5MfxsP225UqiyweepZUJaPgIck-w3NPl28
Message-ID: <CACRpkda=LhY0XCdA+YW=1J=YSpBtB7rxViz-3OBzXhkdxmxWLA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	patches@opensource.cirrus.com, Peng Fan <peng.fan@nxp.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
>    name.
>  - Use gpiod_set_value to configure output value.
>
> reset pin is active low, so when request the gpio, set GPIOD_OUT_HIGH to
> assert reset and later deassert reset with value set to 0.
>
> While at here, reorder the included headers.
>
> Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
> polarity for reset-gpios, so all should work as expected with this patch.
>
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
