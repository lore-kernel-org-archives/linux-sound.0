Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443903BADB7
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568945; cv=none; b=BwWHgJEc5Sf83LhTb4hNB2nU3RwuwJO5SXRtSb06otpFekz4UJgTcp2a6dIXKZl7/ENNcFMxhVCXMRRZQqcsTNQ2zxyR4dOZ6tN+huEIZb2mD3NZ9K72dFy9XQVssS+MtjbmXDokM/jWVEde4FhkHQ3u/9yYIHArhdDqD4UYpPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568945; c=relaxed/simple;
	bh=sc5J0ko6+f5qMruxGnuhxh+K+pC7up54mVtxLBKGuPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnbRIfJypfkjrBL1iSKVJkGHAuNWiqkvzHByDpqLH8UZjRrItPDDsrB0YcDLOQxeU15thxzWIcMj7PDpoxFapAhHAUvVHxtJpzSEN0L3+y1eBd4VP1DV1+FUQy7l+TxNtZ7S8hrEP6lxRBGS+g11CsFheH4SFfYRrkichviTIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U1KKZCpE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U1KKZCpE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso32118345e9.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568939; x=1776173739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKSqR4T8tyfmhs9vyicABDHYtpzKYEAr1dHgduim9us=;
        b=U1KKZCpEFV6hig6YAhBAVymQNch3kbBz1itv8VBJv7rCiruZsoJB1ByggNQ6l4aYSN
         lt837E1FW2vaSQB5nliYBlI9/vloGzR47reJirNc1ngvCalGucPBx43d2EJUGF7SPsv7
         qKTLkcBTx2pfKW8WR0QBgfmYzw6hHamVpFdMztgF8EZbe8pki9uHl3DKhHXwOF536kl+
         0+WrcJSxuUqN6YbYF2JRMmTv6fGu9A1x4pPzGtve3fvUHPJhWRwwDKaGpQ6IM7JHxWN4
         hoTk35G5wCH4xds11GL904CVrnduVVP4hj3uQLQlKVDLoI9dMizpv0WFgYt4sXsxn/j2
         NMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568939; x=1776173739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKSqR4T8tyfmhs9vyicABDHYtpzKYEAr1dHgduim9us=;
        b=JSNceqOCYASAxWaaBCP54M6AGkqxGyzgV//CbOuCymOhHlnF+0eCR8COtzxq+cSW2X
         14uapQKsLK1YThgUXxNdDpnJJQV5upATo/rj174hKbrgSZz4evdkA5SSK2kBcgcznC2j
         QQzHUCOqPYSPLEGtFR4iRxPZ7f5hUJnaA0tTm5EAYXc/2jj1MTkr9oLBmAt33gvJ0kJN
         y82E8HPYeQWJrtIibPOafu9OEdgS1fv4UmwfwbRd48EfSe+/odTURUuJJdh3hzz2KvkL
         rkEftCclCtntYaY3RkNWrpKi/3GaOylzBVXnlSZ3kImh+3BwoCaCSM+cMpyAhfZ0FBjo
         67dw==
X-Forwarded-Encrypted: i=1; AJvYcCWIs0NcNu7vP6lqhddhk88FL++rzkndpsU16Yv/VuRshvpWYuesp6qaF9qAny3m9apCy3wH//ADAJa1wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzExIDXeRm0SblIqJBO0Bb2M9h0DInSFIvDcY/48OlqT376Uxd9
	0R9sZNbH1D55AACny8E26adAZOf6BIErKBV+sdX/WM/DH7HHOGvITSZIaPQZyskMKE0=
X-Gm-Gg: AeBDiesrX69yO68dAxLDPeqgaK1oSvWSGnXIQnh7p3OZ/mKPfsDC6L36prVpQrVAu9I
	ut7aW8+H/DZfSAMA/RwHZGLY4BfUwqPDpObxUJ/1MqW6dZGGkyHiKUfb9uwWn4tH9xDCa2k/XYv
	OFg8/4NRMEmvSHv1980Fx960MWgk2RQoYf2k/B0Y8ryVgcha2Ydd/igu0p9GD+vBgrZtksTay/0
	Hn2ijOkqbyeoYsmYGKZ/IfYENL2DPIQyx1odDvsQH2niBmzXKGkFoaDw4yLO7eom4z+ZtQ32AKv
	bs7ScJw2pLCc6YEMzYpughd/Iz+H+MzZqjXWG4cRL2vkXNtz8VgOKtadv5QV5dC8zWMsh0HJOh1
	HKRl34+eRifr1TNlxsjGZkBESnG6BTFrJreoi2GinaBH47HfO9q5q22DxqxhoBVr8g5JQGmIVI/
	nAwIh7BHsTEQPcME0iq8p7WEgFOPNfPGTjEEKGJOmtDaViJlTvHNTXRBOOGckSlxE=
X-Received: by 2002:a05:600c:2d07:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488a82fbd2fmr95263155e9.22.1775568939310;
        Tue, 07 Apr 2026 06:35:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:37 -0700 (PDT)
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
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 07/15] dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
Date: Tue,  7 Apr 2026 16:34:59 +0300
Message-ID: <20260407133507.887404-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper to check if the channel is paused. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 083e81c07aff..bfc217e8f873 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -286,6 +286,13 @@ static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *chan)
 	return !!(val & CHSTAT_EN);
 }
 
+static bool rz_dmac_chan_is_paused(struct rz_dmac_chan *chan)
+{
+	u32 val = rz_dmac_ch_readl(chan, CHSTAT, 1);
+
+	return !!(val & CHSTAT_SUS);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -822,12 +829,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 		return status;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		u32 val;
-
 		residue = rz_dmac_chan_get_residue(channel, cookie);
 
-		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-		if (val & CHSTAT_SUS)
+		if (rz_dmac_chan_is_paused(channel))
 			status = DMA_PAUSED;
 	}
 
-- 
2.43.0

