Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF47287256
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982666; cv=none; b=k0Ma7p0Uz9sbJt9jH3G6tF3nX5FiUAMbJIHj7NAvDIZGZcVB5hvUF/oV7rTw6xI9x9ZOFJFG7oRAtOzRPFCsKZWeb+fTu2EoT3nCZLQzJHlSmy/NgD3QU1nbYVUNSQgNVIXXMsvBaxjv69VrxjcD5Qv5feuBErh0FBwIf+OPLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982666; c=relaxed/simple;
	bh=KnROEUass2/iW7GccrgtsymOuPjezhPd1bODirEEn90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FqjlVpiy3GUNfK3zH8/s4bT3n07XmvVDQNnIAD0l/06JS9J7Fwzmo6qjBAxCKEYH+26qge0E5ZlxxunXRwxgQKhgPrR1AsVoy1S887rQA8NiMzcqoPY8StvA1KOLZkV80NKP0pEKBBR2MRy7E6szD3UB2VZx2AnrROl1knfaibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHnKcaCj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHnKcaCj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711b95226dso34001785e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982663; x=1761587463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=QHnKcaCjU0WebKUcgcp4j7RfJC5Q2hKxoZT175iVG+DfcNz/54MEdToww4BnqFEl7Y
         yO4CNntkhsesJavFFqv88klF/b/CkJwiyP0Niw9w9SrcLkE2P3EknphU0e8+0kNsxeHS
         EtP7XsqGmbh5yxNqo9ZPIbvyATw03pwhp1WIP1Yxf/xVAk1cI3uL7D9XVF6mTM4CvPgZ
         DXLQyzjwanDG3XpxfavNK921mxAFIwSCNavEa/tBv/uMSSTtcSEyuoDga+SzluC5GAXo
         YMpHVxPvZ8daki6wx/F6Ll39sJFR+HApA0NLGMQOW/swdTCaZaldiYDse5P+5YPbrqfE
         Refw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982663; x=1761587463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=kH6kGhhivw+jVV/f0VWLCHVDB58gVp6NxU6917UOcX/s5B7YdAjTSQB8V/evKUlkyS
         +nYJ+QYvL0UzuXcFFSDYvgLLpq9sEcSjTiczsilYGY1tdu2oMmurcEnUo+fr56X4lfnT
         Mt6ODQGd9Q21N8km32cPfCGy7v3LkJ/u4FM4lJz249gh1WT7dL9/hx6Q8OfAJsPwPBu+
         a3bWarTagfE2iDYziiQXP9/rUwcVhKXdOsjO4KKW1++H++52l1ARj4KnTVXyMIExrkaq
         +P0KT0auqLeaJw15G32vFJ1573RJ8MF6vnuzGNhEIBQh0PiXSuPTQTry7gJmi+pNMdEA
         Jo8g==
X-Forwarded-Encrypted: i=1; AJvYcCWhbv95Po7YjMN/Tm2ZYrIgiSwXA6Y45c95RjGYuc+dnl21zmlLkOJOJ+UQKyDnGRcXjTcbjmd2KYKiIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyYYGkkIikb5+SgihTjLLputrdkybkORA7DHHsZpZuf5KEw6l
	cMgBLdB68aaXTixby2FLDVvmUst/44D2sHwEU/8BqsfTvBAAjMSmB8I9
X-Gm-Gg: ASbGnctIGWhbxJAJdLXuj5YlVS3Ngay+sYmXcx9OzMyapg3HDudHUMpthUQi947Ar78
	JpvLgDcdLjk59O4yC1fJANOUhuBcmJ1oldoAb8XqxCFRlwOJoT/qJeX1IDI9tfHBvQTVRBkyxR3
	TYLKCUWUVwmesF0qUOfOM1i2O1JDHumrT5VFk6Q3mX7ldpyd+HhK9ykysJ4Ys/LepvTRhX092hx
	G0NuFi44kGKrObB5Yzn5OA1StxoPxdK2IWO45RqbrYuLBvJctKs+Rou9ilZj3xlzr7Mu6PSz4UA
	dSG28HwomZI4mWaB/jGaLI7l73pt2G8zB94pZDmvmegb7GcXgtqUysO3qaWg7PtLuytiiwMb1lx
	Hcixrl9GtCWBE38tHqxaPALhO/5hGRZnMoUXaET4uqXI/fV8N4CMofCKbvE8xhPmNRcLAX/fUef
	LPZoSx/CclxkOyweUxqZBmCTq9/9HnXDGfCttkisQCOnHUviLP1O1Nab1o7VpUonOl6NJGnmLns
	gfpaW4=
X-Google-Smtp-Source: AGHT+IEf+pLydZZJlPsNS9klI6Ppz7HfqYBrVGwlK2LGcq8ett6vc+FT1k0DRHTRyZXn1XwlZQ3W5w==
X-Received: by 2002:a05:600c:444d:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-471178b124amr91678925e9.18.1760982662640;
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm187794005e9.3.2025.10.20.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as
 critical
Date: Mon, 20 Oct 2025 19:51:00 +0200
Message-ID: <3374980.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251020171059.2786070-6-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:51 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The "bus-r-dma" clock in the A523's PRCM clock controller is also
> referred to as "DMA_CLKEN_SW" or "DMA ADB400 gating". It is unclear how
> this ties into the DMA controller MBUS clock gate; however if the clock
> is not enabled, the DMA controller in the MCU block will fail to access
> DRAM, even failing to retrieve the DMA descriptors.
>=20
> Mark this clock as critical. This sort of mirrors what is done for the
> main DMA controller's MBUS clock, which has a separate toggle that is
> currently left out of the main clock controller driver.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.c
> index 70ce0ca0cb7d..fdcdcccd0939 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -121,7 +121,7 @@ static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-r=
x",
>  			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
> =20
>  static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
> -			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
> +			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
>  			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
>=20




