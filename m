Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B5344D8D
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907804; cv=none; b=Z8L5Ek3x1j8mcpafD6dJJzbt7oHoDXS6P0DUhyjRZ8fdFJkxJ0vjCejfqFglhHEy1x9eSKea8njzqcank6v3/H4UmLbnzi8SlBfHbL6/z91CRrz4fpTCgb7x7dPXLvLOlEIGWrFMZMSioaVZ1rurrsnY++GRUBiQCenjPqBPMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907804; c=relaxed/simple;
	bh=G3TmLj2FVJVqKtKvmLk2oUEY0r77TRMnpm3HstyV+7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omoKij30Dhzy6HNrRlc/TntgpRl0QIXsnllsEXGzWyfEgiP6j1jxQwJk/06bLlO19sPNYO1RVB1fSxQpSJOSymsPTEWHst6fQsieQ5RIz6KXGJ49PPdtpwafUIdrGo3okD6dt0RbQK2jjJ7hBjZwUAW0ggjn5OgmV28T4t61GxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LhxKW00h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LhxKW00h"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso30679385e9.2
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907801; x=1776512601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ofhw21hwQOsSk68dsZGLNvbmOD1TuowEEUPnaN2gTE=;
        b=LhxKW00hbKBJorlbA10anBSFzNH/waBeFm6dI10TfVYnMW1ccTDc4u3+fayFdCMP7a
         Iw5qHMXP14sSDK9fO3Oc20X9C7TK1MEfaPgscsiZKSeBMYsadvCCS+cFIoCPH78UDED7
         7GWh2EdFACDnJCJnS7RXVkjiXUjP020BziHMr79vr1vK4/b7u8yoaMzui15Wbt1BvLjZ
         3Js5z3b19EhkFZzNaJ5cgzYNywQYyRmPH6Z7Gjxn2z5FUKgJe3JcmkWUFf/YqmU2xhgL
         4fb9wnbOeBDbmbJSupubrqiVqxBWp3ULZ3pIws4gdra6CCBwCWbQU0KJKS1XuLtFO3Ml
         jRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907801; x=1776512601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ofhw21hwQOsSk68dsZGLNvbmOD1TuowEEUPnaN2gTE=;
        b=Hs5kh4X6vDbeHpKShcQJFIsIRH0rP/6JSaHjaSGoYdB/SgawWbDnDJuC1zd0Rdxc19
         Nehc1k4FX4wWQSCXCEoZy8/aPvgLk+d292C3H9ql+ZlRl4+oPc3sSUC44nB14knx5Q1Y
         OZJnZCzcpqOlQ0LNZg2RxlNmBuVxcqXBPW3lXlEQOIrOxvxXF3n47rlbkeuLhNmLQ4+v
         ewz5NKPyHBxMI1hfh+1CKZQI8zyi2hzwVEG/bxzN1X5WKAabHYQTR/SaqvR+BC2DM0hI
         9DYWrOgyWd5I3+OLyj0LpzvbeBHIkQDsQVtkoUWaOrNn/YaTOtEmPPKfGoXDRm1BoRie
         pbdA==
X-Forwarded-Encrypted: i=1; AJvYcCX5R8Y6uqGgUbxxGZNolREUBe3mNTHz24qqwgxZjnMXcBBythHQ1M06aoySI+0CK7SUKpfrvtjd6t6qtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwyqIOe7QEjxiJ0i2UnaVdL74HIWyCd9ZzJlJCvVWWRexo2qNH
	ZoGl+7/L23zEkYwveRkLx+/mx8V5aTIvhQ8G94jnZcgOv+NVqwQi898M9Pl/XVDenhQ=
X-Gm-Gg: AeBDiesCF6PgWkl9rT+JM5/bgXowKtt8dtLxyqcCvKKSx45CGg3fDnWZB9Bi5LnCFpw
	rzqmueSod1xUJx5xAst105HNrgGRVoOJScB51MKTNVihKNORqn7wiUZR1c8WIWEFrAMhHApWGen
	MaBg0kYJB3q8Haz3v+oetUM1ytTNSDvSFwCCUSlqZlQYRtfutgGQRRdsLEf1KHZl3ECXwHTcivo
	Oh2S+/Q7btrwXtE/Uc8LqzI2711vM/jYhJ3ph2DHgs3SdcTAWacA8NqLmdCvZhDnkNsZrkOjUdV
	fSLT/gjB707ygTmreMpwgkJ/SU/hmj4GuGNb5zr3GHCEyYAczZUWFbqQzBeyuaSnR6J+fvFmOzq
	ZtMqMLy/vpuz/gHtSHNc7lRjQY4sY7twevfO45/Uk60WgfC/X2z6c/GG4bEhPR05kH3Ioi1VXcy
	1FEROSXupqI94rjviQZNp5CnqV3OaMguMlXDvYJRgazCUDKS5X8PCH
X-Received: by 2002:a05:600c:c0cc:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488d68af13dmr58285165e9.17.1775907801492;
        Sat, 11 Apr 2026 04:43:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:20 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 08/17] dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
Date: Sat, 11 Apr 2026 14:42:54 +0300
Message-ID: <20260411114303.2814115-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper to check if the channel is enabled. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 0f871c0a28bd..1a3c33d28c6c 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -279,6 +279,13 @@ static void rz_dmac_lmdesc_recycle(struct rz_dmac_chan *channel)
 	channel->lmdesc.head = lmdesc;
 }
 
+static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *chan)
+{
+	u32 val = rz_dmac_ch_readl(chan, CHSTAT, 1);
+
+	return !!(val & CHSTAT_EN);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -840,8 +847,7 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-	if (!(val & CHSTAT_EN))
+	if (!rz_dmac_chan_is_enabled(channel))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
-- 
2.43.0

