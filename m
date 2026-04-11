Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33A3563F6
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907811; cv=none; b=Y6eG7KoqHfLJhtxxhfybDkNacq01pMPS2Od1NqjOmB+z06EtMHREBJS8ITmWWa8Vgx5sADGDOqSXa/wmANxmv92wHrSEn+iLOnygsBRxJV5vnVXMW5zGntkyRWHbkjD942GNVPTWdnhd93ZWDFsfGCI63TZxeRJ9yVsJaIUyCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907811; c=relaxed/simple;
	bh=iQawvjhzIGXmzEbrFF8bHIYm/8QPf/NESexbbH0n3Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muzW/5f5Usv2Vlbj968cNBzZ5Is90fsncAjaZAFXgbxm3LpFpvECDIU5DnJdqxlLNfuILY5IlwXVbrDrHo88ri5hhBdlD+4+zAB6fz/uGE9ErIgdJIkx60wUJZeXuvn90ZpolWCLn2cPp/h84cZl5M+lw/OC4fCvsjp48MHnNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LRqrgw8o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LRqrgw8o"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso34873065e9.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907807; x=1776512607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUGFjnyw33YmgBsDPw6KMQ7GHcl3buE/kN68Vb3dY6k=;
        b=LRqrgw8ouf09WxyIcw8weWyhkZ2lqt34blgmZmyUXukcWMGTcn8tgwcIYiZUkia1q4
         NFrKy6IhbTY1m17AykVE2+1edcVdU+JOCwi9mO3u4o8mAIN5f8UZ/Dp2bx+ZsNOA1eYu
         36pApcDvNhRn0ekxQzGNvxZEwmhFnXkjQCPGsXdQ1NLsrNbikjoCOtUSTQ2bD1UJ/G4P
         /1bcrHU1IhCQb2n2OCauhbQxN5MVS9Qe8kJPXaSw7mAIkvdONtExMw+o3q/ug87nMN55
         tW6xJCSTwlTIwsvqiZdPIpmIRT969ApU96Ti7dyz10NlTspqsbFU/ijeFKRelyDAXQwS
         /Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907807; x=1776512607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUGFjnyw33YmgBsDPw6KMQ7GHcl3buE/kN68Vb3dY6k=;
        b=eym6W11BjI0YRp9YKF88AyR4viLBCLZ8pKxtD6soPHJcYPgISt4b4esc6BPwquOE8l
         4Li6IQ6/lWWdLelZKFrqY8q7t9vhjq3Nlo5sDEdsheO3ZfdrdKvgkSTcW+KasDD3/ipL
         E5L8Ku63UWirPzH0c1o+UEbjQdTRE2LBgH7bhCPcG9UD97RYmMZ57OW51gSAUHcThubB
         cFm/SjLukrepIYMyNpo0h0eVm++kvthIdROnopgKZFMBV2f3pT2OAwDoQAHSKvCHpaeS
         3O/cIHlq3Orwc5gAsjT/O4j/OG4M2OmBerjtjrr7qZkRjxfvDsOQxWPodk3tBzREUUIw
         FIzg==
X-Forwarded-Encrypted: i=1; AJvYcCXeE0UvncyJNC3frAmnVpcqDtPpJe7rvqGDU6gTgajYqKYB8oPLR/w1vDR8AngjshUziHN8nlVS9BAcBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTLxTz9jPUJR+ltz4I1hVJYHQjAFDwbxVpIM2aYgsMEVWEWi7H
	9XhNrCMtM7lHRR+CFBgBl/GrkK3zLS/ifuxqH54NatGSjuLuW6du7I5CJ9OVTl4TSgk=
X-Gm-Gg: AeBDietwgCbSbq5BtW/Jwm6DQ/IBs3xka5QDbj+EHF46YtYeep0HOC8dA37J4v/TMQw
	D2gk4MRn2eHCcDqEQ3VfQsnbzcIuuMNUq0+ITCAqLCroIAkUDJY/nHaGBVZibaDizyQvYopaBJx
	09sTh8cxZ4/e/cQsJe97NR7ZV2WathnW5XdY2mlSCxor3HVd66SSqKEu3ByUpdidY/etuRIyH/C
	PO/Y3oznYMFMKMJgwOLiIeJucSt+ZhfFk3skNdSKe+xbzPp0hTZHMF4dLCjHnCzUvUL8qk6HEfY
	zcKWKP9chut5UT7FwFw2ubkw5scXmXcntCahSZuPLWhmedHDtXWk9Otc6wpRUhFWJ1lmVX8xge2
	Deam0fAD81TxwsKcqQWoh42L7KLECvMNbCy0FhN3qgEpualMr3bIqmwSJIbbBhxBBBMU/mjhnRW
	aUNp+RHEVY7mh3DeQ3V2JbAoNmJH8cqZaiPZgE/5MpVRvvL8mJTWT9
X-Received: by 2002:a05:6000:24c2:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-43d642a7a6dmr9677284f8f.23.1775907806737;
        Sat, 11 Apr 2026 04:43:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:26 -0700 (PDT)
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
Subject: [PATCH v4 11/17] dmaengine: sh: rz-dmac: Refactor pause/resume code
Date: Sat, 11 Apr 2026 14:42:57 +0300
Message-ID: <20260411114303.2814115-12-claudiu.beznea.uj@bp.renesas.com>
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

Subsequent patches will add suspend/resume and cyclic DMA support to the
rz-dmac driver. This support needs to work on SoCs where power to most
components (including DMA) is turned off during system suspend. For this,
some channels (for example cyclic ones) may need to be paused and resumed
manually by the DMA driver during system suspend/resume.

Refactor the pause/resume support so the same code can be reused in the
system suspend/resume path.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- reset channel->status in rz_dmac_free_chan_resources() and
  rz_dmac_terminate_all()

Changes in v3:
- none, this patch new new

 drivers/dma/sh/rz-dmac.c | 73 ++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 04eb1a7f1e62..d009b7607d44 100644
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
@@ -491,6 +502,8 @@ static void rz_dmac_free_chan_resources(struct dma_chan *chan)
 		channel->mid_rid = -EINVAL;
 	}
 
+	channel->status = 0;
+
 	spin_unlock_irqrestore(&channel->vc.lock, flags);
 
 	vchan_free_chan_resources(&channel->vc);
@@ -589,6 +602,9 @@ static int rz_dmac_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan_get_all_descriptors(&channel->vc, &head);
+
+	channel->status = 0;
+
 	spin_unlock_irqrestore(&channel->vc.lock, flags);
 	vchan_dma_desc_free_list(&channel->vc, &head);
 
@@ -795,35 +811,70 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
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

