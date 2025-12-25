Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13093161B1
	for <linux-sound@vger.kernel.org>; Thu, 25 Dec 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653678; cv=none; b=j5tz3fYy/jnfYwPX0H0hN0jBJAwIrIPO99lDIpWpBs/q74DoGl5Kkn/+OWoVNOaLQ/XcW44wc66menjlJEpfpw9UYxcXJqo2boNwI4Pf6UGFldnz6d1TsgVgrbb6/j07S15r945aIE1UrRwzgzNys2m32N4Ax9kdSpTmPy+6RxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653678; c=relaxed/simple;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMpGKO1uqkPyTKuVgWGFbiC97/f8ghV1i7O8+008YHXr8mer4YH9TRw3oAkrdnrOYGOmF6d1o6+9vZnf8Pgmd6qOriO1hd+Izt8jvuislr6rdPTHShrK82KJiJ6RNsKFTeiNDWLXEuWt/wRgp3NM8GZGi2ZoSzhmoxehG/toXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL2McMyP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QL2McMyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1BFC4CEF1
	for <linux-sound@vger.kernel.org>; Thu, 25 Dec 2025 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653677;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=QL2McMyPUihTERscpyEIBjt3MaiXOfZVUT+q0Y+KbFHwOk8fDGGMxVWl6Tah2OR1F
	 86J2mje2RitzrD/PP7taFc9MM5LrOGTrAeXoyoB3fcQbtu8wlNlC00njeDuvuvk1Ow
	 FepC1nxHjF4epHEYjsXceIuzbGAkcWV17ELOLidbRGbIN9WXfOZx6HPeKiDxSFCSVP
	 S87gWUvvlPaVxrVx69Tce91k/2TxfliPs0CJkTt2eOVCjNzmd7iTUeHOY3sM8bcwkM
	 1u3Wj4RPk1c/WkUAFbO/rJlC82OyrcvrIBx3JLyIBaVV+YrV9IJqNauN+ObJUZKCji
	 tWe/PHr6BHSjQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a415a22ecso35472631fa.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Dec 2025 01:07:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2QHiv+/fpDb+8gF3HTOICHXH/N97Wy1kp+d51qT5PGgfsSNswI5BwUFWbQjyHnuY5roBuQn78JVBjgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHJfgeQFOIk30FqtfAfwiamIzI8Fip+zD9fdqe7ytYyOaAjSh
	HVdbKh99N7Co3WksjDM8lHn8aN2m+iR3J8evf11Fumis2eS7q/M7QKa7zKtmLsA6wST2qMETL+q
	BZaHTu8g8kl6sg+yCY4ogLPaUHnZ3ck4=
X-Google-Smtp-Source: AGHT+IHfPWz1heWtm82AOh8ny5sgT9kzx+lyzDjyJcBgqVf6WZJpwpmEyZeQVabkjvt5oV4xlzU03UcKE5H1xk8UgF0=
X-Received: by 2002:a05:651c:1470:b0:378:e0f3:53c1 with SMTP id
 38308e7fff4ca-38113275820mr72648701fa.18.1766653671109; Thu, 25 Dec 2025
 01:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
X-Gm-Features: AQt7F2qwpZzDsTD1g9DqdU3xoJFe0KlIMNtkshCEa1nlt61s05fF43c85tHciK8
Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 7:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/oxsemi,ox810se.h    |  19 --
>  include/dt-bindings/clock/oxsemi,ox820.h      |  29 --
>  include/dt-bindings/clock/qcom,mss-sc7180.h   |  12 -
>  include/dt-bindings/clock/xlnx-versal-clk.h   | 123 ---------
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h   | 133 ---------
>  include/dt-bindings/dma/jz4775-dma.h          |  44 ---
>  include/dt-bindings/dma/x2000-dma.h           |  54 ----
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ---------------
>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --
>  include/dt-bindings/memory/mt6779-larb-port.h | 206 --------------
>  include/dt-bindings/mux/ti-serdes.h           | 190 -------------
>  include/dt-bindings/pinctrl/mt6397-pinfunc.h  | 257 ------------------
>  .../power/allwinner,sun20i-d1-ppu.h           |  10 -

For this one, a node is present in the DT, but there are currently no
references to it, and thus no users of the header.

Also this chip hasn't seen a lot of interest after it was initially
brought up. None of the peripherals that have a separate power
domain have been enabled.


ChenYu
