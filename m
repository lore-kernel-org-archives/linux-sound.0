Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD73BB9F0
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568950; cv=none; b=MvncKuzBXnAblYcHScYjbShzg7awoLur//qDhOf0rDhY9vAY8+FgJHJSpA67U1pChRcV0fPPQtywA6rh4Bwm46+R3PcDbNIM6QoYtCSVR5mG9sEYZalGmtTa4StwSDwrNFh8SKJCifjE95XLklvwQlqoAcomH5iTfN5yxYXWug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568950; c=relaxed/simple;
	bh=OGJy16GF9/KuOlAbPYY8Arool4o4HNHbnVB+AWCFgco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtxU3les2G7ASvpjBJW+g4cLWU6hxOeLFFz4Rfv7I4WTizMnl2LO67te0D24Ek0ZV3L9rD/8lpvYp6Gso7jgepqQUkKPR+EG51CX8ORxx+VZk1BUq4VSlSsziO7KNcyIoc+uXzafWsSBpEnuKKxCHZIOgLBgmkO9qa1hcd1Oiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LZyB3MU3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LZyB3MU3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so35058835e9.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568943; x=1776173743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfbZ4006aH4p+LsSEhfwyxhxCu3KeHA6cjylUZwq+3Q=;
        b=LZyB3MU3pC4OXVXzjPLhXW47vYRjeqGKG/CnbOB09MRF3Pv3MxMQle8VRDUnT/Snh3
         KJEgne75u3Bv09pPLS0KFnotv7BpXoXUuOSGbulESZXCsUjaJn9i5/vCJDG/ps92GcPS
         l4BOJhc87AIaoPqPIf6GOOnt2p5qHrgu2MsCJaJuXMDHOPU22tHgjrTphsgeKc8qM+12
         K1AW/hhlgwid3d7w9f/SA15WlEW+LONvfrhuoZfjBeYZPdldEdsJiUkn6scfVx3T/jBs
         tcTXpQiIigg9//DJJ4NHPJ12WK8bWZWtjo7Ola1RLtKh8icFXAUmn/lAcrNgkjWLnfc4
         OJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568943; x=1776173743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfbZ4006aH4p+LsSEhfwyxhxCu3KeHA6cjylUZwq+3Q=;
        b=NVj/is1O7gJeicPhfmkBZjsGkinedsFRJD0K3CA/6zImOdFusuT7LsLK+YsMe+sGwv
         PeHWQlE0PJtIwruZYgvKiHY0Puzi++AHdpMwCTklUGvq8uTVNMTGs+ja4BHmUiCA1OjH
         jaB2+jW05wGbv9cGrvRiQ0/XhkSUG3sl2uQOGcfvquVBHQjPhIIugz8CXm+1R+umlvVz
         d4hqZMaj83ouoDjPaDfSD6hMT9cFYPiSu2QGxoG92MEjKCV5L+LmYXtSH9jxPqnsZMXh
         fEZF/0LdjaJNLYsWsEYFGK0mQ2FRp7VecqZChXD+G5AOdb9x5ElEiMn/kvAcgN4hMYEN
         vPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzK3l0h8n+rlYv7NWyzWp9QnT0Ny5ofDH6VtH21xFZW/2O3WAn7sjyM3O+iZO97Oo+sHw/fjA1pSEj1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0T/KcIwY/tgjIGeWkNzcsi98Zwxt4CW7aL8K8aLN4E5UQT6s
	DbNAm8FK7OKaIwVGUSeuxzA+R4kdExngkKCKB/InlRQu/chMGX5NiNQvmGQyf7ckRS4=
X-Gm-Gg: AeBDies3Jn5Qh/JF7dnjePyN5QtsXsHgtz0uQcRYYhiK5MZrRKG1NJTLn41wPFRahfp
	6YfBu711vWio5j1IGfN4Sssj2MhA41ZU5Nw3Wqcnb/4pwwomcdgd25Y4TAgwzGgLSFS/ArkqeaJ
	AiY8TTDyH8eZkMRFWX1jKXUGx1UnwYLG45z/D1glyDQKipRIsi255jqNpPs3U6yPfhp0sUIvRIj
	5erqtt9nR/UGwsJvmCvpFn4afjfCiFD0bIe/Od/EM+hAGTehNI6ZXEiZt/Jampn51q+NNjHmsgW
	9Cox+s86ZDfj28EtDXbsY018fErQaTmoZex+GSeWTGrMMwlrdWHeprMfatwP1dNx3THWRQEP/xy
	zuzXeeELaeB7EFWNsnndKmdPSoWsqGFI80GHeljmZFSSdY01pXVXLctLT0Apl0UwOkjUCOT0uHi
	14a8GWS7YEk/cF9TyE4b9c4g1/ImAvkCUTtI/JGXpbssVTQXKhj4v5
X-Received: by 2002:a05:600c:5251:b0:488:c257:a73b with SMTP id 5b1f17b1804b1-488c257a952mr14542955e9.9.1775568942953;
        Tue, 07 Apr 2026 06:35:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:42 -0700 (PDT)
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
Subject: [PATCH v3 09/15] dmaengine: sh: rz-dmac: Refactor pause/resume code
Date: Tue,  7 Apr 2026 16:35:01 +0300
Message-ID: <20260407133507.887404-10-claudiu.beznea.uj@bp.renesas.com>
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

Subsequent patches will add suspend/resume and cyclic DMA support to the
rz-dmac driver. This support needs to work on SoCs where power to most
components (including DMA) is turned off during system suspend. For this,
some channels (for example cyclic ones) may need to be paused and resumed
manually by the DMA driver during system suspend/resume.

Refactor the pause/resume support so the same code can be reused in the
system suspend/resume path.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch new new

 drivers/dma/sh/rz-dmac.c | 68 +++++++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index d47c7601907f..bacde5e28616 100644
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
@@ -63,6 +64,14 @@ struct rz_dmac_desc {
 
 #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
 
+/**
+ * enum rz_dmac_chan_status: RZ DMAC channel status
+ * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
+ */
+enum rz_dmac_chan_status {
+	RZ_DMAC_CHAN_STATUS_PAUSED,
+};
+
 struct rz_dmac_chan {
 	struct virt_dma_chan vc;
 	void __iomem *ch_base;
@@ -74,6 +83,8 @@ struct rz_dmac_chan {
 	dma_addr_t src_per_address;
 	dma_addr_t dst_per_address;
 
+	unsigned long status;
+
 	u32 chcfg;
 	u32 chctrl;
 	int mid_rid;
@@ -792,35 +803,70 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 	return status;
 }
 
-static int rz_dmac_device_pause(struct dma_chan *chan)
+static int rz_dmac_device_pause_set(struct rz_dmac_chan *channel,
+				    unsigned long set_bitmask)
 {
-	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	int ret = 0;
 	u32 val;
 
-	guard(spinlock_irqsave)(&channel->vc.lock);
+	lockdep_assert_held(&channel->vc.lock);
 
 	if (!rz_dmac_chan_is_enabled(channel))
 		return 0;
 
+	if (rz_dmac_chan_is_paused(channel))
+		goto set_bit;
+
 	rz_dmac_ch_writel(channel, CHCTRL_SETSUS, CHCTRL, 1);
-	return read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-					(val & CHSTAT_SUS), 1, 1024,
-					false, channel, CHSTAT, 1);
+	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+				       (val & CHSTAT_SUS), 1, 1024, false,
+				       channel, CHSTAT, 1);
+
+set_bit:
+	channel->status |= set_bitmask;
+
+	return ret;
 }
 
-static int rz_dmac_device_resume(struct dma_chan *chan)
+static int rz_dmac_device_pause(struct dma_chan *chan)
 {
 	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
-	u32 val;
 
 	guard(spinlock_irqsave)(&channel->vc.lock);
 
+	return rz_dmac_device_pause_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED));
+}
+
+static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
+				     unsigned long clear_bitmask)
+{
+	int ret = 0;
+	u32 val;
+
+	lockdep_assert_held(&channel->vc.lock);
+
 	/* Do not check CHSTAT_SUS but rely on HW capabilities. */
 
 	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
-	return read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-					!(val & CHSTAT_SUS), 1, 1024,
-					false, channel, CHSTAT, 1);
+	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+				       !(val & CHSTAT_SUS), 1, 1024, false,
+				       channel, CHSTAT, 1);
+
+	channel->status &= ~clear_bitmask;
+
+	return ret;
+}
+
+static int rz_dmac_device_resume(struct dma_chan *chan)
+{
+	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+
+	guard(spinlock_irqsave)(&channel->vc.lock);
+
+	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED)))
+		return 0;
+
+	return rz_dmac_device_resume_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED));
 }
 
 /*
-- 
2.43.0

