Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6C34F48D
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907806; cv=none; b=dwRXKANm3fGPCXxzVY/DQFixnoXkCMylM+7sq3Rk4F8bs3z/IlfzdYwzKTHA+ea9queYKqfGNlg/uzeXkOU0P3utIXSDrVKGWcpWdbB8PpbzQ5b7Lr2H0+wv+wARzZNAWY5IfC1t7EnUkhFh3kLNZUlSoDRmd5DZTP0UZh/cHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907806; c=relaxed/simple;
	bh=kYxxf7UrOo/ylG412SxsscyOsq5s+9b6o32cDo3KE50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5Pghitvkd//anKeV/SwnhRmt9ErslLa8Vd/QEfYm/NAC/V/J4r8eFEJ7OPGH4b5RdauP7hQOavvI2+TO2tbFBfFA5aECLAFtUFbiZZUo2l+Sp1qGlg/uWDuUV0UOc4i9OfLJ094ppQfI1zzWXwm0KrPsNyxf+d/blzq/3TK0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d3kytsCz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d3kytsCz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso1851807f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907803; x=1776512603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6HUr1gtJuXFA7idjOAe9L67Llkodm8s1OURzQhPdNQ=;
        b=d3kytsCzByQoV1C+S3h7V6B7XxGwePoepa3dKpEVrSoRCA3vWhJ1IcCcWaVBOP1gcL
         jlD0Oe9LoaCBkBx+HOuFGmRNq1aRs7hJSE3cfYH5do0R7xXpqpbf2zzquHkT3ruFJFMn
         onxfw0WXIMrmyXgVTK93gmKAUlUC+JUzjNIEa3Mkfkt+I1brd+adcSD1UHaBaH7rCChi
         toseYi5Vvex7AcqtXCGXEr/a/UbFf1gTytobSXHOFkb1GDs9jRI/UsfnPB1YSt5zE7Eq
         92sdt9OCcgmqovZXfFTFZ7+heN6CbS7HAS59vKtnHeCgQfwoqCY7JrudVUSyH8tDQuLx
         Q/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907803; x=1776512603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6HUr1gtJuXFA7idjOAe9L67Llkodm8s1OURzQhPdNQ=;
        b=h5cAyLlmfcrucxzL+drdFy0hRsEy//DThgglQc7mfrvpvmwnSNzqkMz4FQ99NXMLVH
         rInu2OxebbmdFzzdNC4EVmgs6TpBSn1ZazK2WGZGVgRAwaB2XNk50MBqZ/xVeLcH8coU
         teNAe1Oo30CdUIpufgfmAyF3DdgYo0GBxhqPzycY3py+AqDLbywY5IBrH3bDLrAuOp7/
         D9DW0VY/5Pgf6wZ8Q+Y2nsyotuBhfZD3kj0lnojvAywyXl9UcmoFvz1X+Nt1SLz7PnJe
         iB1x/nMkTRv9ZU13PVMoWQfz33AlJSVbkMffTCc0Wb0hMeOe4VTRqTdjZi3S2ITFrIta
         fWTg==
X-Forwarded-Encrypted: i=1; AJvYcCXlUL8IsC2XakG3Lj5t+ibcBXwWbwuP+KGBZ7t0HNgnrRP4FR4gZwcB52UygbX4rLvlAu/YXPiwwOH1IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3kz/jBTDhqsaFyuF2ba5+nPMcUnjiE78oRm98c1dJDXJvwCWW
	2wjl/F3l1mVt/cCilrXhJr74BpZfpnnqvvq782boWScp1FWCaj1wl6ODNwYQp7u9ABU=
X-Gm-Gg: AeBDievDCs5rK6mBqzGHeMc+LO7V8Y6P6QDwR15k/BcDSAO1zaV3A+e5esV6h7affpk
	I1kUu/9LOAFvFjNET9g6k87q4wtkBsKzDLgL3LUVgNP1niONSHIcfqO5IDUI0tnTkv8fE2SLsR2
	V60x2x03LiZvNrnXp5GuMVwoFYd1QZCz3NgsxIHqBpewPc0oAA5/KwQMMbwxaWbwPNhbFReV+d0
	FB7bbZ38Hb+lPXCkk1W+LsshzowO2KXw68sNx2psdviAanXv483DfawrYFSDlRtEXE2EbXM68xB
	/imB8eqMIhHIvmWfer5hyyxNA1UCQbF9d79TjYZ4OVWQPIBhgNabse07guJGG5DhJ+6C+//7amZ
	yo6WAu13+ajWd+To//38YaAn1EE8vKij3ocDG9GhGJ+/sbldZ3UhwIyZpG1fFAdx8ZQruuuzrsJ
	dqICKr+xgfhimro08EszlsToK6iOfOuvYsJWyIRJyxJmNxFpylXPtz
X-Received: by 2002:a05:6000:3108:b0:43d:1c7a:8b5e with SMTP id ffacd0b85a97d-43d642c13e0mr9680005f8f.35.1775907803295;
        Sat, 11 Apr 2026 04:43:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:22 -0700 (PDT)
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
Subject: [PATCH v4 09/17] dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
Date: Sat, 11 Apr 2026 14:42:55 +0300
Message-ID: <20260411114303.2814115-10-claudiu.beznea.uj@bp.renesas.com>
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

Add a helper to check if the channel is paused. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1a3c33d28c6c..f35ff5739718 100644
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

