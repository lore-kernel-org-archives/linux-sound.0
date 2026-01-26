Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240EC20FAAB
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423528; cv=none; b=iSOXMJ7dDU4sb3LOGcDLLyK6Xe6WbGMCLqVDjCDnoEU1vG2KqwQTPIzv6yfJ/GKncFPa8frmhFwES2dCfjeSuKkVTHJ/ertcCOMZ5LIyOoBnfgt8oztrIdI4cx45MWG7WZIWQVTP0teMZ7WQC3TRERSiE7DxfJmu6kI+NX3pK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423528; c=relaxed/simple;
	bh=wTSw5rrByeywpyx4b28b6t68newYvzHr0oIdTZgnlTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh4cghQNg8Gps8WpTie66g/AvIg1uTdsXKD0xGKWgOfYYyGvkYw4YI/fZsJOS8EW7RCe+fHKJXelv1GOZMhgZd8wxjm9n2rN9iQYqJgCkOgZpoOVY5NSlzYgFJNmcTIIs8m3hdM3AOxGwvixTZG2JDj4XhADfzlfDAv5fVE+cpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CGQQtia/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CGQQtia/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327555464cso2891825f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423524; x=1770028324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28LJKOzZr0ga3QymY5qs2v0wCcRNeHJMj2ha9kW7dhM=;
        b=CGQQtia/yGqo1RzFvOAcEJ0DGUf1TSVm/seO+wYRE1X/fXwDJ1GQZv+B7YkUZeaCtZ
         RyXG1R7457kAFOnZjNti1M9b5ZGCCJ3smcOlNhzpLUuwgcW8fj6yyU8ZipBHXlz+RndZ
         Idx52vFSCVDIsqUxQq4iW9062c7QyZgMl+nIe6EWxP58fnl+syUTB3v9KvK/ic8ZMY57
         Je1P7TfymdMnPTTmpyxHbAfXc7uRjX92zoMFmWeonrlYdLCsyZ6/FxkXAHgLINcGNhAa
         ac0TeTRFfzXVGEm61KFUMRf0q0WLh+RS6cuAp2Jj5hbt7S2jvMoRXCCALuU2Ps2Mm5WO
         J7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423524; x=1770028324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28LJKOzZr0ga3QymY5qs2v0wCcRNeHJMj2ha9kW7dhM=;
        b=MA8lFxhMSS1UOnLt28YYqHzC+XGWrqUmQXkLn4AFk+8Tmx0StOo73ZcDJQaaPbhcJQ
         kgC9YVOe48x+5MT1Ft4Rve4qd0XxCletyXuAuFTibILk3U5rRJN3K9vdEhtfx9xGVme4
         fBnI/mdr6T2JSuktHPJfPFnkseYYjIIGRRZ2IXP1BALeEsLrW58PjiZqwTTITk80uIYx
         D6q1PEAzN1pk4disZFf85OGZLUuWkjH6JP01NDNvUpvK8FgHG9MykSzGwWByPNc9kuky
         o/qp0Es1P6Upf1671yoWz+pum/YFrBBJNgalvAtJ68V15vL9ZVJxZzkUOVI0uZB/lLbh
         W7hA==
X-Forwarded-Encrypted: i=1; AJvYcCWOdMZPfNRC1K1Oq0TiUzdILi5CMUwCMLix1gT+CwWSX1pf243RbUojyzt7ZahYP1TCHLjNhMm0z/h0AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOw0FJOftREJ0fW4HFA9ACIL0KOiukiUMZCeysI7DlZvBJl0CZ
	aaE3GbBWzVesHPR9jFtj5nECGvYnW/bYnnFGpIQFF7Ut9GA6d3Hho/OmY062tn1rDIk=
X-Gm-Gg: AZuq6aJ4AIEyib4BE7QkwcsnmNXwQFgKiD3GpUqsWSscsQQcVg9bp1gapE+ZCP+Kp2T
	YGqGB3hxoAn79P8kd1DT8xsgTnRdd8HUhRmesaABt61X1hrHNNRGeWMH1wZfqkRB5REUyL0CmbE
	u/hb2uogvzle2a1jVHsA4fQmYWnDJQDOPLNjaFn6b7u+gYVK+XXKZL9iyckfiTNtMcwPNsIOoax
	XzpNPCKiqVQU+Q7iY7dSyWbVgF5GCX9b7/W31mk/elN0bVQyEUngiQyPQH6oB/KHv7RFS4Ur2TV
	EGeLpAsu8+x1WUauvelwDuOhafJzCve3OEaeK35i7tSnPgRM7NywCUVfqIffKjXFh0Uh3Oo2q83
	38pI+nTHIC4wYwRveLMKnaT/LuP2RXjsrJ6fkmuvQ5bfaGy0ztRHuEbnFoiPKkx0SM3iI1zN2BM
	6H20lGLQCKlG7+84nl9A8uZa+PLJcgLbJXESXkrms=
X-Received: by 2002:a5d:5850:0:b0:435:a258:76e with SMTP id ffacd0b85a97d-435ca3a93d0mr6619369f8f.60.1769423524419;
        Mon, 26 Jan 2026 02:32:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:04 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/7] dmaengine: sh: rz-dmac: Add pause status bit
Date: Mon, 26 Jan 2026 12:31:50 +0200
Message-ID: <20260126103155.2644586-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the RZ_DMAC_CHAN_STATUS_PAUSED status bit index. This is needed to
implement suspend to RAM support for cyclic DMA channels, which will be
added in subsequent commits.

The pause and resume implementations are updated to reuse the code added
for suspend to RAM handling. Since the pause state is now stored in a
per-channel software cache, there is no longer a need to interrogate the
hardware registers in the pause path. Using the software status cache
simplifies the implementation. The resume code was updated to use the
software status cache as well.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 68 ++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 95ed357f2b74..8d8391a5b3a7 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -18,6 +18,7 @@
 #include <linux/irqchip/irq-renesas-rzv2h.h>
 #include <linux/irqchip/irq-renesas-rzt2h.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -65,9 +66,11 @@ struct rz_dmac_desc {
 /**
  * enum rz_dmac_chan_status: RZ DMAC channel status
  * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
+ * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
  */
 enum rz_dmac_chan_status {
 	RZ_DMAC_CHAN_STATUS_ENABLED,
+	RZ_DMAC_CHAN_STATUS_PAUSED,
 };
 
 struct rz_dmac_chan {
@@ -833,12 +836,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 		return status;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		u32 val;
-
 		residue = rz_dmac_chan_get_residue(channel, cookie);
 
-		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-		if (val & CHSTAT_SUS)
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED))
 			status = DMA_PAUSED;
 	}
 
@@ -851,35 +851,71 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 	return status;
 }
 
-static int rz_dmac_device_pause(struct dma_chan *chan)
+static int rz_dmac_device_pause_set(struct rz_dmac_chan *channel,
+				    enum rz_dmac_chan_status status)
 {
-	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
 	u32 val;
+	int ret;
 
-	guard(spinlock_irqsave)(&channel->vc.lock);
+	lockdep_assert_held(&channel->vc.lock);
 
 	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED)))
 		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
-	return read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-					(val & CHSTAT_SUS), 1, 1024,
-					false, channel, CHSTAT, 1);
+	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+				       (val & CHSTAT_SUS), 1, 1024, false,
+				       channel, CHSTAT, 1);
+	if (ret)
+		return ret;
+
+	channel->status |= BIT(status);
+
+	return 0;
 }
 
-static int rz_dmac_device_resume(struct dma_chan *chan)
+static int rz_dmac_device_pause(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
-	u32 val;
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
-	/* Do not check CHSTAT_SUS but rely on HW capabilities. */
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED))
+		return 0;
+
+	return rz_dmac_device_pause_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
+}
+
+static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
+				     enum rz_dmac_chan_status status)
+{
+	u32 val;
+	int ret;
+
+	lockdep_assert_held(&channel->vc.lock);
+
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED)))
+		return 0;
 
 	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
-	return read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-					!(val & CHSTAT_SUS), 1, 1024,
-					false, channel, CHSTAT, 1);
+	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+				       !(val & CHSTAT_SUS), 1, 1024, false,
+				       channel, CHSTAT, 1);
+	if (ret)
+		return ret;
+
+	channel->status &= ~BIT(status);
+
+	return 0;
+}
+
+static int rz_dmac_device_resume(struct dma_chan *chan)
+{
+	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+
+	guard(spinlock_irqsave)(&channel->vc.lock);
+
+	return rz_dmac_device_resume_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
 }
 
 /*
-- 
2.43.0

