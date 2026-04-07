Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8343B8BC5
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568936; cv=none; b=ERx70cHjN/nIhUzre7a03zAHGpr5EOyGp0429LL8WP9svQwkL3qirAAROk0DdnerNr4KZNyYGQtyshzYCWWfWk0aNvIlGIorjWFq23FnFi2XFqcs/WCecnxwje0WAVuRy2EuFpE0C3CHIkrqeJ9b9klqE5z881fQdnsdMljqGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568936; c=relaxed/simple;
	bh=oXhP19nSq9V9gIPK7p49JTqQS9Nh248cIFDTun6vI78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuvNI7AzG4+PX0/ldf0u729a2fMJzxwfxvTTwmuBQblpgu2F3o7e6FgL0b1JeaZcmBVzPpyXLCCy0jnHCp/UQmF9BC4B0+BgYBmyzF3CX036Jo8lMutUodZwd+d/HUS2k0H9KEtNuK2NN8cmAdf/9ysq4cGahTTax5SC7lu+v6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gcNCLCsv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gcNCLCsv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso68698645e9.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568933; x=1776173733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPqjlgjOWitVthnX/i/FGgn586vKfxcqfC7axGBVgqQ=;
        b=gcNCLCsvstMJhU7Yd6LjAalshRtcbicMDcUMv5j7b9rMrtwjR/zwOWq81lYMq/EoNt
         07wsyRSRbnFH7e7cFi5GvpWG7/QVbzmdG+UQUFx8vwrnquuc5UZW28InAE7ZMJjeYiXW
         OdfICJj17gCNg9MZHJZhKc54KFUlr6G1yoQv8C+fppA3mpjTKeOaHYziluwfScCZnsAN
         zL3E0IJLjyHy1/dnzO+P3Ega8vOOug5Sd2ABqm1vi8Hyt+eGXU9ch3KgGXhpG2TUmV8T
         kVw5vGRC+yLmsK0PBquGlE2X3wF+aEZnfp4eagHig9NgUZQklgdifxYdMFCGJSIoHe43
         tH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568933; x=1776173733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPqjlgjOWitVthnX/i/FGgn586vKfxcqfC7axGBVgqQ=;
        b=UlN407Och5tnTTU3URtj47Lz1FWt5BfsJiJaSqKg9Uvf3XUIvpaM05VUAPcOSNNBM2
         ptKN9eEN98HsmGlWaQzBlLlGpeFAwT1cw3YaSI6xOpPI0sf5b39Q9Zkxrk8pPTNDG5Li
         eCpeWL+kJdIdxhbJdglDimU5PXOW1NtMAKRlq24j8TVoVYHzU9wsyTrmgbF2+qTkacFN
         a148XNLOsNCnurICs/C1WGxHSBIbMVpPbFJkqCQDEebwxoNTyKFIBTXZHXNEFmxcDQ11
         MJuzbXpRO8zOzq10iNlxNS8iMXWXgRbFaB0FVHp8kDWwdf1hMGbgi0NKkCsqIBegsmzu
         x3jw==
X-Forwarded-Encrypted: i=1; AJvYcCU3uthdYkhCvhZANzIo8LEZ5M2NhB/5KQtQZlBvKYLuKNOTiOab/W4ZMhgxV48dc/ioanuYXeiFfMY6xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5LrM6PmDhCCjHZFLsYmF9Ekb0cK2VpLwHgjy1kmt9PpOH4GB
	72Pziz4385PFv2nIKTrsARX9F1Vb0u8qBGH42sa035Luan/miOMrM/bR+0hD/xlxOnA=
X-Gm-Gg: AeBDiesX9wn0E+rs3MIlQQlfVkMbFQ+Mo71IIOA0twdZjbWtqXRUpta9rBV8Giwj8Hi
	QFX6pSx2Lg3hlkj5ew9yRbEVxlZKmmmnTcVYe9FdhdZLiMUYpBxRL5YRsxpecIj7we0Ar01KOCc
	zUn1nuBLnhKQRYhO82EgdrbfyywaX0e6fX0bX5F5Sz+mMHAIvR6z4KhDPTrLTPHLyerKgEeLkuM
	IIdU27+sXdvJImECAX8YLBG++/RplwA9UgywBYh99oLxLG442XN20HhAXnOo0NsqQ/El+H++Xdh
	p5mVL0YJyFpvPrq0C8hjrlg5O22p3lKAU0AROrBsp48tslk1er7Ef8D+EWG3qZlZiSfWS1Zg6qH
	fKYCfLr3M0qIjK3cbPEVdTi8q03jF01M9CADm3ickf/5jlEzBEX9CbJ3AuBARTAV8igW8Fd9mhA
	/k5eNp/0JFyTHtByHkaJWRN2gBaZ3gwGilcJx+HttsS9o+L7BpPWaD
X-Received: by 2002:a05:600c:a306:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488c01436b4mr22396015e9.26.1775568933020;
        Tue, 07 Apr 2026 06:35:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:32 -0700 (PDT)
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
Subject: [PATCH v3 04/15] dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
Date: Tue,  7 Apr 2026 16:34:56 +0300
Message-ID: <20260407133507.887404-5-claudiu.beznea.uj@bp.renesas.com>
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

Add a helper function to compute the lmdesc address. This makes the
code easier to understand, and the helper will be used in subsequent
patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 34c00f3ffd4c..ef775ffa1099 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -272,6 +272,12 @@ static void rz_dmac_lmdesc_recycle(struct rz_dmac_chan *channel)
 	channel->lmdesc.head = lmdesc;
 }
 
+static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *lmdesc)
+{
+	return channel->lmdesc.base_dma +
+	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -284,9 +290,7 @@ static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 
 	rz_dmac_lmdesc_recycle(channel);
 
-	nxla = channel->lmdesc.base_dma +
-		(sizeof(struct rz_lmdesc) * (channel->lmdesc.head -
-					     channel->lmdesc.base));
+	nxla = rz_dmac_lmdesc_addr(channel, channel->lmdesc.head);
 
 	chstat = rz_dmac_ch_readl(channel, CHSTAT, 1);
 	if (!(chstat & CHSTAT_EN)) {
-- 
2.43.0

