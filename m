Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE392FF648
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933434; cv=none; b=m5OzjM+7J+TLt8SpfJGMtLu+skP9+yYV3kH1GfJekzEyUP7tCX8dFzEgpLtsx15Me2nLOSbxoWMaDcfTjREK+1T+bI62BrqhzipywGhxBx31R9pbhfkwEOE0LB+ffwl+j7jJ1qss61pvLmrOLOLGMP9JZsiu3ntzjqmgWiZijek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933434; c=relaxed/simple;
	bh=kARumPxqfmMMWgp1NvnsY+8lw/OMkVWPKeLFtKSIlME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIilW2HGcbFcEuUhOfaG9zJ1etuUqh7hkPv31S8Boly560ON5dicYUsYbDA7q1WPPUuZSXlYBddW80po8NfDVzZzqye6mPZIuvSRG/bRttA/oyxWxL9MsvDPFYy51CeFzXyxoQ7aFzTPMdepcq5XwnPoV5zYgpFLKTkX65Leu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dsm1gepW; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsm1gepW"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-62adfdda606so985268d50.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757933430; x=1758538230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3UAx19vK1YiNrAi97n0gU/rRiRg+M8i65mS2Lnx+jM=;
        b=dsm1gepW+64GUvS7kMWqaTSMnvOb4DE2XTTvWEeHN+RE/+11IMxt7/VT5nrAsrozPj
         LjW2VVhrxJupJV9qXK3qo8acFznWW8EUfnwnoI4vzGcKbj1UMmf+bhA1qOvMvaSEpSri
         JxWMtmdA/Sij1xAwa/AkWOoJWA5FL9LcqfNjqBUys25YDzn55KJIvJEGu+5RMQH+vPpr
         P8UCDM4suEIwAfOvYk3SwbegH35M/X9YI1gUIk0XqsFMHy+ZES0t8yI4pLpuClLxwNQX
         aI3en3/nuAnC9ZoXdtEoEmEg9DHc2ZK9SllMJGfkcANMbMEBs5t6ih8A2jNMaQ6iEEy7
         zv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933430; x=1758538230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3UAx19vK1YiNrAi97n0gU/rRiRg+M8i65mS2Lnx+jM=;
        b=c6MvkITfSN01bHcbEmnu0gJK+DWdJG49kttKfEUuAtbiDUviI8/1EmVt0N+aRBvk7J
         9J2JfaFXPoZzNWRO6ckkQc6UEBGeaNfKYqifedt/Ef/LjHV7BaTPmY4vK1c5u0AnlAgU
         bGuaureeWlDydznL4rMfFnRUDQ9PB1Azwzt3t3QBDhA2M88zn+y4gYYyRVLfAEzWDJJR
         dqLcv2JG0Q06Y3d9+xqe/f68oVtZBuIljqB67fDmb51vbUU2blJAbUzMOHfawL3hqLm9
         r9l8Kc9mtVAfc8uczLc9mQD+1XlKxMwYrH9PJJCFVkwTROID7PTRimfjQtayXWxF2+3X
         LsDg==
X-Forwarded-Encrypted: i=1; AJvYcCW9wyId9Qr1wajsFm+1J/PFskyjMCeB4tk5f2H00eF8WTniSGh6ngAxOC+ogu1M0q2cepZayKOsf8mLeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkc/rlYs38UKNCE58FwNFSSVE/xdT0KOuvmE+5B1ezhmzdwNE
	l+11l9TGmVAEnpdnR4oQBCrLf/+YN2mp+vYi0ei4lNo3Rzapzy886Ij3BZLvK8IYxmIbSP6fSNK
	xH9HNXPbMWnJT3ZpL+IplaCK/ffRFK5HNhiWHUE9ufQ==
X-Gm-Gg: ASbGnctZXgxiVpsJ1D4kSja2XjhAzfozmC722BPCf94cjxbvYi2geBFmXgqrITmL8b2
	mIR4KiSD6Es5J4nCzd+XE0ntPD8o5GPiJrFpAGTUwu84ClMTEN0RbYNvJ7wr5obinS0csCwZ1lo
	JtwP5+qy5gv2hb7WyGpJj7FJwbeueKnLrUJKon0RxbXqR+hrYCccWraBxS9SRuRXR5zKU1czs+a
	AJP/k05DzGGiHAlttY=
X-Google-Smtp-Source: AGHT+IGDEYgOKM3gJ8Zzlityz/syLNE9FRvDAqAmupyu9aSeveyvR7FHQhtEilEP6qYlMPKL0ImuzwqqE0dGUhFDiNI=
X-Received: by 2002:a05:690c:3706:b0:722:7d35:e0c2 with SMTP id
 00721157ae682-730626d2dd2mr106799857b3.2.1757933429679; Mon, 15 Sep 2025
 03:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-3-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-3-507ba4c4b98e@jannau.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Sep 2025 12:49:53 +0200
X-Gm-Features: Ac12FXxZCAZGblY8VwFHa1GJ1rGV08p3Fv5KI-OAzvQkX2G4ZDMKiAukPP3wanY
Message-ID: <CAPDyKFr9dAvP7U3dZ_LFw8YxcvJ6n95OKKLYpntUarqdfUqjWQ@mail.gmail.com>
Subject: Re: [PATCH 03/37] pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
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
	Marc Zyngier <maz@kernel.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Aug 2025 at 16:01, Janne Grunau <j@jannau.net> wrote:
>
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pmgr-pwrstate" anymore [1]. Use
> "apple,t8103-pmgr-pwrstate" as base compatible as it is the SoC the
> driver and bindings were written for.
>
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/apple/pmgr-pwrstate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/apple/pmgr-pwrstate.c b/drivers/pmdomain/apple/pmgr-pwrstate.c
> index 9467235110f4654e00ab96c25e160e125ef0f3e5..82c33cf727a825d2536644d2fe09c0282acd1ef8 100644
> --- a/drivers/pmdomain/apple/pmgr-pwrstate.c
> +++ b/drivers/pmdomain/apple/pmgr-pwrstate.c
> @@ -306,6 +306,7 @@ static int apple_pmgr_ps_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id apple_pmgr_ps_of_match[] = {
> +       { .compatible = "apple,t8103-pmgr-pwrstate" },
>         { .compatible = "apple,pmgr-pwrstate" },
>         {}
>  };
>
> --
> 2.51.0
>
