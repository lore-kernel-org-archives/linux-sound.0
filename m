Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD001C69D
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080625; cv=none; b=ENNOMP5ESi3j8pB+L882IwA9COLlxwWZPGPYmoGQUiFyHaZyq7Wa9LdTdEE8PAqcv6xVv10rEN7HcbZm82+uveQCmy2yf0Z7oLMNuh4YtpjpqLEe3yCbC8YN0+DaAmuketGHFiIo/+E/ZKN5aL5U7FOJVWVW6yPX8V9apFTGArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080625; c=relaxed/simple;
	bh=4Zfd7f0oSTyDjhyyLNFCOi5jeoQIXrDItP4SyLWb99s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0n1jMv9xqy6Jkvc50HObAw9Aj0ZKnHd05a2OFIg6OP/1hS/0K+5/LJZCDkiRty4x81l3CTUJhR+Ev8i2yZ0f7Qp3vUcc58NPMHyh8rs8vCS7Yd4FY6rDt9qOB7k54u08V2PnKb7VCXhybJVlGh2Xshc4JA1k8sS2boknSUaRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VOZXM28g; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOZXM28g"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e81ec95d944so4710793276.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080621; x=1750685421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8dIM4ggq6nkqhLbVMKcT1ezBsK840f8IM9RKNGuYHjk=;
        b=VOZXM28gJWu1vtHOVXPd4JllO/Nz4hljwAtGy/NTTFqx4sFZAoktaklYs3/0AO1zwr
         s8Bs8c4S8RQAf/S6s8xkvhKLKBXz2LH7lOa9UCKs92RogaANj4nhH8yucEzHKhHccwlT
         E6OhXRIhlrtu5aoUYs0XPZVqMddfNmbbuzj/54GmWWHAwTawvRgmOlrZL5bkAguDTt+g
         48inRBhIuUixx887ZOITRZJfQJEBvQkauQXFmsmV1GCzMFYDb6owUm1GXTXkvoADFM3a
         KKmEA4XPHzI0qDYfHSC4JNfjQEbQQb2EphKSOIq7QhZRGcveAh7/eCjJB+Dyw6bfOkp6
         dc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080621; x=1750685421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dIM4ggq6nkqhLbVMKcT1ezBsK840f8IM9RKNGuYHjk=;
        b=XGj5jjeamHQmXxwvXJ/62jbpeT84lsipwy6iq2KhVFngKV/ibsxFD/BtHdy7/+n9am
         8mQDSHy0NP9+Bq96gS2o3YEY49Ei2JWmjC+mRlSs00Gw3/x7lOs+qjpdPkB0n3LdfOZZ
         Zbmq5clFHLd9sivYofzqQjlKpoBXc1ZSiswEUd3oOdh5THwZksMUfCKjnRwt5CjU8UzN
         zawGZvc3vZebOV2ncxscjXbTUKlQ4EjwOrRFsMJLI5QNn7kAkMqvCjfqM5lBhxRlYy5T
         jI9eUkJDP4kPEnk3HQwVeY4oLB6TCDlkcZEYzt63d8qdx57ls/lT5FdmEQWM57YS04vs
         A0tg==
X-Forwarded-Encrypted: i=1; AJvYcCUPe4fJuOLtFZVOBO1jKyrwqYC9hmBtoYnUgk6E40xzIKNmUbcNytqOIForyixMdbJAdk/BBNC8oDGIlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkbbMBJCWS91HXKI58n3EySk7Fc3EU7DZq3ne9KFYjAZI/pA5g
	jDacS+R/la6bGaXsMX2v4YnIHKzmjbk/UTS40lmgACsCo7DeSqIStJuiZw6dGtuP9bGKbngUoYT
	joe/WWyqQqONGbuw49hLpwBH5ADww8kfsqto8pUyt1A==
X-Gm-Gg: ASbGnctk9PeSDBIqlppbKnCoiZwhKqjNenH9usO66uPu0/hPv7R93i1UAbC89DwgNIK
	vXypaLKlsna8TbH3/XGsxhVWGfnY4YX+uKX9UnZrTE5hY45HZuBc3VZgEvHe22E6vt9xutmNUYl
	DUjjrYwl0HPWuF4iQOnwM+3R6XrIjssAeQ/8K2zMxkVej6
X-Google-Smtp-Source: AGHT+IHvwFdTtrctzoiWIaPE71W/8FTAI+xhZY2HkhDJbIaDsGip4BNw9qrbXT3Tk9Kd8tGyhyS35T/gDOg+zFs+nYI=
X-Received: by 2002:a05:6902:703:b0:e81:566c:3085 with SMTP id
 3f1490d57ef6-e8227f0e61bmr12875927276.1.1750080620760; Mon, 16 Jun 2025
 06:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com> <20250612-byeword-update-v1-2-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-2-f4afb8f6313f@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:29:44 +0200
X-Gm-Features: AX0GCFucmmVjhuxKNu1-kopwQ1Ifcn7b36ykDZEf_SV72XMHIWGaSa8Aqxa6A60
Message-ID: <CAPDyKFr_-aQ+YoRqYVUFhRR=94NWOredaSYQsVb-xvot83HJ3w@mail.gmail.com>
Subject: Re: [PATCH 02/20] mmc: dw_mmc-rockchip: switch to HWORD_UPDATE macro
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Shreeya Patel <shreeya.patel@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 20:57, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
>
> Switch to the new HWORD_UPDATE macro in bitfield.h, which has error
> checking. Instead of redefining the driver's HIWORD_UPDATE macro in this
> case, replace the two only instances of it with the new macro, as I
> could test that they result in an equivalent value.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/dw_mmc-rockchip.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
> index baa23b51773127b4137f472581259b61649273a5..9e3d17becf65ffb60fe3d32d2cdec341fbd30b1e 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/mmc/host.h>
>  #include <linux/of_address.h>
> @@ -24,8 +25,6 @@
>  #define ROCKCHIP_MMC_DELAYNUM_OFFSET   2
>  #define ROCKCHIP_MMC_DELAYNUM_MASK     (0xff << ROCKCHIP_MMC_DELAYNUM_OFFSET)
>  #define ROCKCHIP_MMC_DELAY_ELEMENT_PSEC        60
> -#define HIWORD_UPDATE(val, mask, shift) \
> -               ((val) << (shift) | (mask) << ((shift) + 16))
>
>  static const unsigned int freqs[] = { 100000, 200000, 300000, 400000 };
>
> @@ -148,9 +147,9 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
>         raw_value |= nineties;
>
>         if (sample)
> -               mci_writel(host, TIMING_CON1, HIWORD_UPDATE(raw_value, 0x07ff, 1));
> +               mci_writel(host, TIMING_CON1, HWORD_UPDATE(GENMASK(11, 1), raw_value));
>         else
> -               mci_writel(host, TIMING_CON0, HIWORD_UPDATE(raw_value, 0x07ff, 1));
> +               mci_writel(host, TIMING_CON0, HWORD_UPDATE(GENMASK(11, 1), raw_value));
>
>         dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
>                 sample ? "sample" : "drv", degrees, delay_num,
>
> --
> 2.49.0
>
