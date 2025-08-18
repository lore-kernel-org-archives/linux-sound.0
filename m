Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F31137C2A
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530187; cv=none; b=ei65w1N/yXb3rsVbvJ4v5ZplPV1xB455abdtmIsbPQ5b/vCzr0zLkc93/b0flpBOwbwvKeATLqLWeefqq8XXruU24uw9OjFytAyaDQPlmCe04U6R2s2anJtFjkOmhrF8f9G1xK/10ogb1UTfpE96p0/l8uz2AEUNq1uAd4CmuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530187; c=relaxed/simple;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8vbUyQvs4Qgxm4gbN8lpU+maW5pXW9Eop9mVKpUGH1RWB4mAlL7Ggewf+rqiXPrc3zEt3IPD+OzgmgKpoeyukx16SXxoHIcCg6CUCojSm/qM5eR427ZZXk2GfydX3uLxdDcCngADa5sFGRoWbZJT2oa4injx/TB7UWgFpxuSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRWiZ4Hh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRWiZ4Hh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8db5aedso30982841fa.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530184; x=1756134984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=DRWiZ4HhajMQipwt5VgmjcjbAgFaTzu5dOHCeOm8wgz+TuTymCz3Xvd/uvYowflnks
         lrPUb9WpvXqwR2eiUgXD5DaILJHL4ll0yk6n9E51imjvtNfsB6+jHcm9+7OZtJAtZgPY
         v2WS/ZTXfyu44y6w6+91J7nIHXoSwE9AIFXhyiUDxpghkjtNSil9+/471Z2jN+wHjS4W
         ZgRcyuG63jZ5CdapfpZhecMM7MLaqO3g1pupwEtO520OXuyVXOiKUTgTROGD/9Qmmr4Z
         bSfSz6+4OiGUSVq2oSXg2mgsM2DKZa0W0ImYEG/fiVKnJFiZ00+eOT6IC10/IYlEpyrA
         s+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530184; x=1756134984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=rd+lq+vWsV4QGPv6rdWEjKaRy3+PiDAlNBlwlsyEAgc4xQpPi9YUvbfT8MqEo2sPHw
         ZNh3p7KrGioN/7HXCPaVktu9MlqFYd5f4MIz/F4jm3k8kBrP+pHLLfhHr3cChqtLz7Ao
         PknYykkhO2pv2B5f9NItpSaW/yI05MPhsPc+S55Vw15wivJGKsCBRNokn28tdph/gPuR
         ElSbPOl/0fpORRNhbMmZdbIeZ7geqByvuizl8MvcEj1z7tmwshbhqA8nSeTx7dl7pVnT
         DA3pC3+LYeS5dVXhWnAwDMA8bsKhjb58AXiKpG5XiDsgpEz2Awdfag7h7y2mM7NDqgke
         fXGA==
X-Forwarded-Encrypted: i=1; AJvYcCWjfiGI5K8HN6n4VpA8CrhJw6jySIWnca7NyipaltJUralJJXPH0FuoITDGamRgR0WEBW6mQqWStW1LJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnSbl3gVtQ9cYowqvb0qZtdjDfvsHFi3ftfOczd0qu7ApcjU33
	uuWZgnZlUJqMYmV7ikUQvJGVyTjz+ZGDjrO2KPhTiquA8kiFl31y6h3HTmzBMBJ+W5kcpmjf1rX
	uRJti+tEkNgfiBtgjHFT10B2egVU5zhEQvg+2Gd02Vg==
X-Gm-Gg: ASbGncscJceba9OuP8+LFb0z5epKnJtH5ALUFiEveD82RiTe0v2UiqTDYj0HBG8yfo0
	KsGemwuC2jEmc6CiKOGx53rkGBnU9pxBA5DzH99YvSVqGwFpJvDMJ/pFMxLMPlwS/k/qQc8hgkw
	m+ti9SjKDKq0toGPF6/OY69Htp0wJD9N7aCig4m0v0dympYYNi3TLy5Ymyop9djn54KQwRU0O4n
	2A/3kk=
X-Google-Smtp-Source: AGHT+IGzqxCnqLVvPxKCko2DlB85KniY6TF5HHlMzLUiXgvNhvXoucfmnrbgjKUH/ALtayc9hnqKx6ybbX/dLc1uNDE=
X-Received: by 2002:a05:651c:198d:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-3340996011cmr37441011fa.32.1755530183649; Mon, 18 Aug 2025
 08:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:16:12 +0200
X-Gm-Features: Ac12FXxjGtIqn77Wg-HXxURZEtSYdu71ByUfcWhpILl9XIWrUY16-cZaSQJoAaQ
Message-ID: <CACRpkdZpUhPERPFvNTwormrqz-H-5VUDaOrRQQ2ap+Oe6YN2Qg@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 1:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:

> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

This patch 7/9 applied to the pinctrl tree.

Yours,
Linus Walleij
