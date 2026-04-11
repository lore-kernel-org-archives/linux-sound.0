Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433A34AAE3
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907800; cv=none; b=tjio1jqPYT8gWJA7Uo5YftJlzmllEVCJ00d/HL/ceEO4zQD5WVsD6L99cZ0av8KXyNs05qczx+Hw25LnWtQjgBOeNmUP2mygsA+wfIiF2uFwMVEaNE8nMvISnSHYHBUeNX0WEh1+HLJDIf/D5YcJ+ayXPT6CF78CHMil/bzkkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907800; c=relaxed/simple;
	bh=hCcTy5ooGYC8iDVpkjkx2X0iImn3Ks2K6Vfc4FCM9QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lo5eVC6Mk/pjOK6bgud+XVMJfiu+QEzCl9sLAvMRqNb1ypfF+1wuLnv2OmTr5vEN3G+WxZpVKRXZWP5WNE4kgLGtIrZHepNv2xpIZXVUJrfqwHOt0Dvd81XvKMjs5WmUhZ4ijibjhlmvdouv3fihjDcFWpk0xUCZQLBktYIFDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a7wzxxxa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a7wzxxxa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b949bf4easo1748806f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907798; x=1776512598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBAh3mtPfHrVsqP6yv8NM6dVTsui6/Je8uMjHCO4v28=;
        b=a7wzxxxaxIsoxYcmbeQZSVnkQjA4ADezdYt53TXIP1lFzE/qzyes2Ta6gq/RoPuEy9
         zu0gJ9NpVekVwKfj5CB6fGCaGrtz+OPFXQ7f6mNqcbxsfZEWx1Z7LQBlfLCHfv77dKxu
         ZwAUhXNsbo70OfLuRbvObfUSyXrS1PqJP30iMDJbiIp8r8PAjmqL84jJSyhkC/8NNOE9
         Wc0s4nl4kjSNaiSwCksWnxa+8pIF0A/i/TUQ/vZEpT5woEL/yErfZryZrMgetW61BjY2
         HNwPtIPN8dgc+bpdXgrE3kMxoCT/roCA0TD8b4oQvED+ZzYUKoK6AdHADiK5Xn9c4nEF
         HP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907798; x=1776512598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBAh3mtPfHrVsqP6yv8NM6dVTsui6/Je8uMjHCO4v28=;
        b=U1/3PbXd21SLxOh2EWfZrCySGVSHwG7qaSLPZEHy6bCar5Ef121fH60jd1MftdL+rO
         L3joYHZ1nrHsABqzHU79PyfaWf0PTfwXRVtkOSsIkJD8n1LrkGQyhUdvvhOrv8yt1sSJ
         3BfXbWzJoQdn4M/DXyyiHNUa57gSjKY8rwE/K2OkkDyFOE2clR6Xaekysxy6fz7ihWlO
         3tkiHEg64lR5SwquAtBVsXihM3FS1UtEMWHvKmT+1v/sNqj3Q0KiKoDqr3REZgWDDFyD
         ILkdzgIYcJ12EPHwacPvApehyt9XbHgYCidwbft6PnXXpmKn6lv6bZrInCV98AeIXq6c
         el1w==
X-Forwarded-Encrypted: i=1; AJvYcCXdWm+NGgTKkZGNKUkOD4H2dy576mhSy0tiQP/JuN2RSDWfCSvUUS9fwQzv2UCgk9Utc3ZlIQLm8Qy74w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu74tO14ScN+srmdvjeQb7O0BZDdVCxWnbCnUXQXMxIwsqC1ct
	pblPbiMr5E4hsZTo8Ql5UibS3rvllm0wbRH0pWgWl8WLZZENZB/KJYhgzHMxASeWGJY=
X-Gm-Gg: AeBDiesU6P6t4zaDCxR5+c8Xf03gWkBCl0d1w+0JSkQhMygE+n4Y74RlekzQ7XAAOVo
	LA8Rn7+rRJq5usz/U12kxWAsCGfYmdl9Cft0WFEaQpA31EejhJ6DBg8YwDWpORwxoDH1X0XNh8E
	3rDi9SVYaeAqXC1Ey8JdkVrNEnZ6b/FETDn0RlRXR71d2OMqDiN2sNGTth2ZcunwEiRlYtKXdCM
	vbmlB8sTgelZSQZEblCec7Gs51ipEtS1B99n0jTAO625sMSvQrYM+vT1iixe+igK/OHLc0BQb1f
	MSPymYUz+mK8E0uF95gZgi6/HDJv5bUvafChuaOrDgs8BzQAIme+wvYptfHgf6DQH2RnlBHrL+S
	WS4/Va7acKjm/1kxfDFuswrLdecw2GjiVeGa96s89H7kRhmX9gGk6/VnBmyBTPjnPyRYTxVtkTq
	SC0KwOT6TAxFK9QD+ILg1dshsIGkA9dAuMKKxUdxs4uoinfymQj0/u
X-Received: by 2002:a05:6000:2804:b0:43b:9d69:43a with SMTP id ffacd0b85a97d-43d5957372dmr10511283f8f.8.1775907797979;
        Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
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
Subject: [PATCH v4 06/17] dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
Date: Sat, 11 Apr 2026 14:42:52 +0300
Message-ID: <20260411114303.2814115-7-claudiu.beznea.uj@bp.renesas.com>
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

Add a helper function to compute the lmdesc address. This makes the
code easier to understand, and the helper will be used in subsequent
patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 943c005f52bd..6bea7c8c7053 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -259,6 +259,12 @@ static void rz_lmdesc_setup(struct rz_dmac_chan *channel,
  * Descriptors preparation
  */
 
+static u32 rz_dmac_lmdesc_addr(struct rz_dmac_chan *channel, struct rz_lmdesc *lmdesc)
+{
+	return channel->lmdesc.base_dma +
+	       (sizeof(struct rz_lmdesc) * (lmdesc - channel->lmdesc.base));
+}
+
 static void rz_dmac_lmdesc_recycle(struct rz_dmac_chan *channel)
 {
 	struct rz_lmdesc *lmdesc = channel->lmdesc.head;
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

