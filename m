Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7977439B49F
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006126; cv=none; b=u/BEA0ElXrhIwP0x+O2fIPUS3EaWh4qzbwL2hwQsVCMeu7wqvRAdnOun0cdbEAWVriYL4YYDcY0Aa6/ApN9qXdfSowsDnoUtiVq/0kJAwVAtEUPmKy1EDexUGO38hjfYjo1fDsdttgW4BEj2ku3Hk0i/ItlDa72wXN5uWohMlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006126; c=relaxed/simple;
	bh=wmr9euWcjMPiYL6aerS6JNLwSHajZ0RgtQYB1/Fq66c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zgc0oaHtypb1kxhKsGRZcv7mtzRgXNAMXddBQeXRPZ6MDMFwaRZr1+6qDs2wmMbP408cZbt8kPlGOuJCJ0StNaF4HqNQoe//DzeFLJV9f7eFBacYEbax94yj5putszQBHH5dFkPbYrVgiuCImTc64UumesyaeewIr9v5O7rOPLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SNRAD1nE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SNRAD1nE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so4642305e9.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006124; x=1774610924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veJgc6lsn6LoKy5z2ASTYaikRHENJLTUNe/jR8sCCz4=;
        b=SNRAD1nESNOnFbZTYx1zxjVbP6a4GEnhqWuftV77S/AIccGF1vGf/8g1b/LOQlhEqX
         lUuMU3+OMOWhhCVhMVtC/gC/0aKkg+5VHaQdQDRVYuiVNWi9MFlGHPvYyGVjZ5CpvIMC
         pdmDsEVzEXM8wXkbHe3XcoIfNPdDns0xBIG27NqEVKjdGP+wV1KM5oAr1yWGdHRKkO0h
         hKZQxGXb/TgWXBhnYTL66ZElWYoc6n0vkDXHRRDGo/WfHTtZ0x9S1pH6Kw7PY/yKE+Hc
         48NT8AKc50A86MpV0at0CN5q5ojZa4FnjeEEjd8gENPFFTyAWVhM/avrx7EOOvAT52UU
         au/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006124; x=1774610924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veJgc6lsn6LoKy5z2ASTYaikRHENJLTUNe/jR8sCCz4=;
        b=J/4krGD4ipxCFNM+oo/nHC/Zmtv9b17+Ow0WiL4gr0ZTzfWOeXUE+z3r51bGnqIwEZ
         txXlODwzWFxKC61qjRTk3cKn7vvbKy5h40m5RGKOiANmgMbjJnR2sfKm1RO8gF42lUq/
         guG5i0QSxDGvjUPpLsVKSIUKq9EMuBXVWWemXKqoN1/8CtUIKwVG8jQ2x6XPB0/Yy6u/
         93+sPt/8CwU/UgMDZNk2GiNvlPLu/qznMNB41d8nKRRkRcE++VyLF9XOvFi5Wmz2DzIh
         xxpurEcs+qIfKvWyP6UAGIS5ctRFyW7+wbFJ5MdzunBG225YwxfommPc0cyDTL0W4i1M
         GCMw==
X-Forwarded-Encrypted: i=1; AJvYcCWFNdlNfFVkmw0c6aQUlx4qjnR1EBXWplpHOdqx/IF8r8bN6M79bqWeTbWdBG2QW6hdhAomczo3UDzVKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf2/h7M0ViPmcNbsetMKiAMEwMlJTrGL4j7idc1xPCkej7pPfs
	/qQ1O0Vv7UkbygaWk4sr59/Fnddz7TEVlRjpHFlKVw2sIsqsMCYm1pXzBqOtAJ5vyBU=
X-Gm-Gg: ATEYQzxcTTnGjhsacVqUoxMzHhk9UJ283wVk2I3SoVch7evaRKq6Q1SkqREsLuiJQEF
	eIHBVxHgIgVjJBfxwwb/TAnERYc9LGHcv812wOFNAx+W4e7EQO2EuWbiGSEA4cEgkaf60FhS/Qd
	j0kCG1id8nDgetDxAiTTo6GwfKXQwYG4C8/DbcnXt6JFLFsLYnZrFRI3a0JQHhxSJ4e6Q2SD1+L
	uwySKWhB/Rszn9XgWAYHCXmelQ8k5JRIg2nxkIEx0q/l2/RNfafOFybBWurk+tUZyTFzLemofry
	bH/tkrLsak3iF4FnDvaN+Dq1zl2UFKXsMn/ABgC4gaZ11D3CAL8nH6yIuhq0gBywE0cuN6u6r2J
	cBH13KlN8DjscWV9crel3uwGTL1MzsrXSE3xO6skmXQHusDPEeawYRmdaep6QTaLR4if7Eo1bjg
	XZ9eEF4n638FpPhXw2oTBNWEiDtoLRwYBbpf/31aps7riJZPeEUEO0q9JX9X2HZwQ=
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr40608545e9.9.1774006123656;
        Fri, 20 Mar 2026 04:28:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:43 -0700 (PDT)
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
	john.madieu.xa@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	tommaso.merciai.xr@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/7] dmaengine: sh: rz-dmac: Add enable status bit
Date: Fri, 20 Mar 2026 13:28:32 +0200
Message-ID: <20260320112838.2200198-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a status bitmask to struct rz_dmac_chan. This currently stores only
the enable status of the DMA channel and it is a preparatory commit for
adding cyclic DMA support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typo in patch description

 drivers/dma/sh/rz-dmac.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..8148a1c78e12 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -62,6 +62,14 @@ struct rz_dmac_desc {
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
 
+/**
+ * enum rz_dmac_chan_status: RZ DMAC channel status
+ * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
+ */
+enum rz_dmac_chan_status {
+	RZ_DMAC_CHAN_STATUS_ENABLED,
+};
+
 struct rz_dmac_chan {
 	struct virt_dma_chan vc;
 	void __iomem *ch_base;
@@ -73,6 +81,8 @@ struct rz_dmac_chan {
 	dma_addr_t src_per_address;
 	dma_addr_t dst_per_address;
 
+	unsigned long status;
+
 	u32 chcfg;
 	u32 chctrl;
 	int mid_rid;
@@ -295,6 +305,8 @@ static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
 		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
 		rz_dmac_ch_writel(channel, chctrl, CHCTRL, 1);
+
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 	}
 }
 
@@ -306,6 +318,8 @@ static void rz_dmac_disable_hw(struct rz_dmac_chan *channel)
 	dev_dbg(dmac->dev, "%s channel %d\n", __func__, channel->index);
 
 	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+
+	channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
 }
 
 static void rz_dmac_set_dmars_register(struct rz_dmac *dmac, int nr, u32 dmars)
@@ -571,6 +585,9 @@ static int rz_dmac_terminate_all(struct dma_chan *chan)
 	list_splice_tail_init(&channel->ld_active, &channel->ld_free);
 	list_splice_tail_init(&channel->ld_queue, &channel->ld_free);
 	vchan_get_all_descriptors(&channel->vc, &head);
+
+	channel->status = 0;
+
 	spin_unlock_irqrestore(&channel->vc.lock, flags);
 	vchan_dma_desc_free_list(&channel->vc, &head);
 
@@ -833,8 +850,7 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-	if (!(val & CHSTAT_EN))
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED)))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
@@ -874,8 +890,10 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
 
-		scoped_guard(spinlock_irqsave, &channel->vc.lock)
+		scoped_guard(spinlock_irqsave, &channel->vc.lock) {
 			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			channel->status &= ~BIT(RZ_DMAC_CHAN_STATUS_ENABLED);
+		}
 		return;
 	}
 
-- 
2.43.0

