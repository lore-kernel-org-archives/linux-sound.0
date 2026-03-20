Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA773A75B5
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006129; cv=none; b=tfrNSllHbESCEbRz3DzwjXDxT18j0Z5ED74f12gziKCNYj9zuzUunJdQ9qmPxY3BXMUTZUN4ig4LVQx/aBQ74rnN4kl473Rs5X6/MAwKDmH9jpFYn/W8sd4nG5T7baAV0guXflVYw4Hqf3FttTGUM3ufPSMno0zXMypElSOosKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006129; c=relaxed/simple;
	bh=JdUzXmpCIZw4oaJUcFexv5JNulg2ymIkM6cKTdwhWCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZe0Qe/omWZ7Iyk6goxYEuqRnD5mp4lh87sJ6EGNWJCT4qqDBfFuf0jeoI8Ul9dhOvq8vd0DJ2LYQ2EfFZOonIHL5s9OIkfhFb1Z1KiNCmri681cCPz3TIbvF4lVwAcVvweKqtqG/1VM1L0udnSec9qqtX4cjVlQGFG0g0igfQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qb9z1Mz7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qb9z1Mz7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so9447695e9.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006126; x=1774610926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFFm2+JqQAqu98CO2w98M9b7NER9zgq+RoPb1v33LV4=;
        b=Qb9z1Mz7Z1UTkOTrQoYqmRU4HAAQI6cBP1ssJiFfjp0RS0WdSqpsUf48GDvNVvx6Dj
         uC8gXe2yTaMnkgDzWcTnrrJAjcm52pYjdYdMsRZ9ybO/VIqFlKvP+8zjKSrXjR4XLhW+
         rc9pHA+snxrDYeR7xicOZtq9zkA9vXPEdo9dUQFjEyHpGmf3DZZFUGwP04bKxkk+PR+A
         WiblYFDC6RSfQrV+96NtQCszoOw5qZaDU7wT65kE1xvqZ2+3tmrGvr2pKrEPNIP/Dm2k
         09A2oYHPFvfZeFTjWpskiklRJshBZORmGkCLv/h4PxBnusx2PM/Q2WJ9gLhU602MTQb1
         gIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006126; x=1774610926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFFm2+JqQAqu98CO2w98M9b7NER9zgq+RoPb1v33LV4=;
        b=nFrbgEBitnl6R0EhYJg6cseBhMYcc2pMdSGD1kOZwHjVUz1nz+BZqVtqWGQCg3/YZl
         3n3bg8jFVnUF+x3LEPuWFyLUjkHcr91X2d/NOAMGLJHmckj/alPKnHO+16qdDbANuI9T
         vBCxKoy5CVB+7P3HnuLY0O0t72kPEBX3neSEkzj+n0hmDjK+xm4vyKX1rF6IWWy5eDU/
         SLcP0CxDZI1MFyFNJnW7c8MM76UoMOAcWJZWY4t61vN+FIG7DwS8r07OblVZR0V2Q6w6
         +6ccXNL9QJwu8AJehIv8U6wOJAiid1RMV1endH2/VvStnpJnDvmRk1Uad10c37I0ZRaa
         R57Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQGBP0/Ay3hJboVdd5aInc8I2lbjXj/T9GNL6aeahSC7Sp374zJb0Dyv0HoCev1rS/w4QxhxQOKZD9Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCzxEY8e2s0vWxSsYfVpii8LCe/EFrRPyXvlWJCuQhJAgcFlJ
	F/HRV1kY37Mn+VEfskSFPGLRbeJPkYBPXfTrEBrH1/I1p/mL6tad1UBzKac8a21f+tI=
X-Gm-Gg: ATEYQzxLlZLhxRHDFBfvAbJhtfypgyKW1xIK2xQzdGFVUFqSiV1nDNln167+6JzfeHt
	JMvGaRMxeCQxKp18rl5xsB0+TXjDZiA7Y5XZMcs6Q9ZYVm/swV3Besf48QhsQ6zxewX9ee8lbAb
	dTtd2r7bcwoMT4BaowgGdBJTjZ7WX7/AAh8TKQuv2vLRi5Y/lO2BAUt1GRds3HZEjO4XYwC7R7Z
	T9ipniI8tHgFjgNVUP2pvk10THONDDgCYdSPWphwX3faE8KOkTu8TmfQh6/Z3a1UUMKCoWUfR4L
	40ntuJbgRC/8mty5S7lMSN3/N4cQaR6DCCaHFXm7FC6iIUTrVRAhnBB2bukSS+fvO1acB6urPeb
	GiwK47i6WoAnJQ2G2RIb78h21/VGXx9AzWcQ0SOUjH2n6yIVz941mFDsISD2ZziTUccDsvneAbH
	So/R5NjJRgXYNwJmyCoj2OpqrKlO4jPBTSC5tVePWp1h49AccQx+kF
X-Received: by 2002:a05:600c:530f:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-486febb455dmr42143615e9.4.1774006125654;
        Fri, 20 Mar 2026 04:28:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:44 -0700 (PDT)
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
Subject: [PATCH v2 2/7] dmaengine: sh: rz-dmac: Add pause status bit
Date: Fri, 20 Mar 2026 13:28:33 +0200
Message-ID: <20260320112838.2200198-3-claudiu.beznea.uj@bp.renesas.com>
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

Add the RZ_DMAC_CHAN_STATUS_PAUSED status bit index. This is needed to
implement suspend to RAM support for cyclic DMA channels, which will be
added in subsequent commits.

The pause and resume implementations are updated to be reused by the code
that will be added for suspend to RAM handling. Since the pause state is
now stored in a per-channel software cache, there is no longer a need to
interrogate the hardware registers in the pause path. Using the software
status cache simplifies the implementation. The resume code was updated to
use the software status cache as well.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in patch description

 drivers/dma/sh/rz-dmac.c | 68 ++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 8148a1c78e12..32349d214f68 100644
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
@@ -825,12 +828,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
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
 
@@ -843,35 +843,71 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
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

