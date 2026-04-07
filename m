Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB343BAD93
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568944; cv=none; b=fy6VsZ3pHglyhHNWBBjTbz0eO36ITt9Rod591kU9zwrR2Hu4Bza6F2rrDiUjXOFL2wSxD+NLRYC8+ZPH4qRpXod0fah6RepxRufabqSnq82rs2tN6foLUHes2mqoC9dXa+BvCgTOX/2E4l8f1aia1BVfRe7pUs7i436UvsJ52HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568944; c=relaxed/simple;
	bh=846/G+q0odb/qHiylGwqi7IWwj+WluQVAmidDATN+IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDwT255XBPf9G3H/Qht7o331V3iHdvqdZUwH4G17p+yWLGKmfen1jtFkMzqWGx/PvDYoPoL6ckDUMzVbqaOYXKFjM2JmMd2c9TwWfG71e2IqB/scL0wMu0Yjm/j7lVIoNYG5ZLgzRIAf8ORurE+BrMFxIVbxIZl5oODTuv64cbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KTGwgILD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KTGwgILD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso21713525e9.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568937; x=1776173737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvTNlf06Jd01xZueOACSzZsQnBl2OBrbZ+zRfuhxAX0=;
        b=KTGwgILDEsFR4Qy01Kxs67nY8O6bkQ2jt5y0r9/YJ/AVZWXA9+wNi1L5BPXeulFNxg
         qmyrnsn2lZCgmOT5Ro/RrrtkAB230kiTMrXVFi44ZvC00TM2xX0jms37xol/KzJbNiaJ
         Sn0kDq5AP1DPs/8KF4+9TqqLrRJU7b1EEEwyj+nhbsUSxoN4Za2bEOfcKDsDNsKnb+E7
         bB6GdUluY09OuMnG9g4w4xt3GFmmmKJ2X4/Sr5LaPu0tT8FzDNBMMT+4ReAIs7ZQlM5x
         gjRg5Zfxc4CflvdCoMn9JutoAaj34gNpinpzTTWsPxWxbg8UECh/jv81NtI+finlm4rh
         K5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568937; x=1776173737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvTNlf06Jd01xZueOACSzZsQnBl2OBrbZ+zRfuhxAX0=;
        b=X9fIVpWXgADQ0EaUftIrBX5aCpnkWTI8j9WzTOuptMJoSxpTpM9tR+r/rHDBVZdOVk
         lhKCR02ED1TWeiQquOE3Fj+z8iCMZXSA5T7Ss76vcU2DigPgu7xNlwp8EqymsyYsjGur
         ZVdNt/7kokIek3jkWAygJDS1p/rSmKPq6qEDFFnQdO/NUncxEK0gh7AuaBTKiEe53hm5
         3aiyZ0W8NhUowi0fmTgC3Hr7s3jJ1uLn4GYV4ms90SO2Yn60LOU/yuWHIdAnAYZ/SfhK
         F4RAEWGkQ1v2A+VH7HHxuYkzWhHC+zQVzPQGAyLIwF+Qz3cIVxImA0SKngtD0YwffDIS
         fHVA==
X-Forwarded-Encrypted: i=1; AJvYcCW6U31B39/9iJWF5x5lxG0bNZIOILmxnodzlHN5vjMDDswuEjFNHc6TEcknuJJZ8iY6otfRQ6BemLAZcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyICwmDDx0WOAK/yxDfKfRhk7p25VyX0DgYErMYietvcDGx3ktI
	wDjL4r887UQV/al1bZsz+E3zzvHYul39pjMzJYt8OBLGia739FvNvb5sS0owqnicwgA=
X-Gm-Gg: AeBDievWyq/7VauMjN6vNeS6LfZOjhQXlZ4vRw020WWf0DQgnCq64Kywxkfv4O2M3X+
	UeKSMZktyi6YVmUS2ZisHXNs19nWm7Iqgko99vxZV7DKHTENbqc7zBVFLqf246o7DGRpDJdfPhg
	x/zF/Rr6qX5muQ9CRwZpQISy2ab0Wt3xxjYg0q5yYuoe40ce61GM0QCxIN6Gd5w2K4EdTw+TkyE
	xwgs9BSo0fXj1x+O4IG54nwK0WFLZY3IZwZUJ67k+kxfhhmizDrLi8Wd+2q3iIzrqgvd2C4Elqy
	MpPiV6SwuebfcEQBWTx7ojfyNqLCUgmb1Xt9QLvMt+JhN0Gr7bHQdcwhockvv0ZFKWXoEkEAk5+
	gWZoOavgt+SJ1sa4wLxQA/T3/ZmVx4gtuP2s4aGiIRuXpxCjMcQ5Ord+5hNg/jCiGrd3dnX1V3c
	QF9Jb7JWajMJhnAPkN/g8wrwsT69e1/6lNzHA9RmKGFg1LkFfsrhfT
X-Received: by 2002:a05:600c:638e:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488997b21e9mr238767795e9.18.1775568936903;
        Tue, 07 Apr 2026 06:35:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:35 -0700 (PDT)
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
Subject: [PATCH v3 06/15] dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
Date: Tue,  7 Apr 2026 16:34:58 +0300
Message-ID: <20260407133507.887404-7-claudiu.beznea.uj@bp.renesas.com>
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

Add a helper to check if the channel is enabled. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++++++--

 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index cd639aa9186a..083e81c07aff 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -279,6 +279,13 @@ static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *l
 	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
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

