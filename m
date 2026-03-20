Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CFC3A9605
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006130; cv=none; b=A0y6Epd53QbB//0ZM4iREjfhiq6JkJv6nvkUFcm34Lue9XMkaq3vwQN87fjka4kQb8hmVK1CL+GXzYW94qbYkHkhWm2iX9bf2qYFTI6YFL09pmB6TqJa7TYw4wbhqYWXvEnxLIOqVlfMjkZCxgq8jyFfk26bi74pTakqPGroBIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006130; c=relaxed/simple;
	bh=GD9E2/SQwtIIE1eJkpGHpxa3R5g8LJo5xRqW215y1pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTWNMqvEMGTtmKq6sdLb5eePQGB77gjoshA7+mLQYesvCEa5Ggq7kfpOH+C94OUDIxG2nrM3gobQPUEGqHKo3nLPncPGoixBj8pHBLSnrEL4HSyGsCGqVZt1PC/QORhOXe1crGrNT/0+Tb7yAP2gcq6d+KoU0RYGVyJGOlVLxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SkFXGbql; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SkFXGbql"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so14565105e9.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006128; x=1774610928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZSF6Phsi5Ep6XqjzxpapK7aNLJkF/Hb03hbbBTs8F4=;
        b=SkFXGbql1tHWC0FQoTE5nLfAzdcerDWpmihpAW3yl3f7vb5v8AD+AYjbyCK6p6pVHE
         FYyHiRPruswVsJ8bcnWKIQ6bPoEi1qeSytHvw+6+pxIVEXR3Lr04b5xm0W1Sc6sAxxJ7
         ZjVk7bRRVmQfuSEnUca1dsFdNfCO1Fx5prX9mo+Wdo/fFiNkqomspFPB9ajZvoqGHGEq
         GUQSk6BCI7HEPbG0bnpwlzvEYugZJu0rXkGJWO+7Fcl3sxnlzLboOdFsq+e6oNXEhtU/
         Lg3CLnWrCGwlqyBXm2BrOYoI+fcfKpOYw98AwJFb3MYlvBgQVcjYM796xiFdd41ibMTX
         BcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006128; x=1774610928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZSF6Phsi5Ep6XqjzxpapK7aNLJkF/Hb03hbbBTs8F4=;
        b=PW0PaV7Q5QUoXHKs0Y2QgwaJKWgWnOxzOI61R2/rbMPNQXK9xMuqVhsopnmGmMr/Hw
         pyrCe0gp50xwNX30TPNdXlEgBpGuZh+4Dl0IxZ21KfK70Z1NFkVbr+5Xc+SOig3HUEEZ
         okyt1yGz1wiz/h/CHYasNzIp2CkT4ag3FzD+QgPn0H2V9Js74R8zqAWsZSGSQTGI8LME
         6Sug0N54SDlPFSd7dpcHDjP7xTzEkyMayqM7R7bkasOC9WQ/jtAFnV2G0iTaCn/WnqyD
         8ujX91TqfCptmfUNeur2c+HROLiPlUuIYsiiUqB10AEHjnEHY8DSpcbvttAD5ZZRWCLS
         Rytg==
X-Forwarded-Encrypted: i=1; AJvYcCVoh05OphzQAXXHJlOhTY/oPk/Tej+NAqd5LawgsOXEB3CNzInrc3XSzJtQ6PBlm80GWpo+7KxCv83fdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxulxqOe8YN47/A244tngDY1qKme31am+b1eMcaBnC/FYsCQpSR
	XLGyDwbW7xMuR5ryj1niCLvcErxouHTkBcsd28/jSouQNM1hwBH3NCJJ73lEZ3IqHQI=
X-Gm-Gg: ATEYQzy7j3OPoOQcqeWeBaCWMoIPYAbnagXHqpK4bYKo4uX3Tvr17kax2ZlkiXGG1ek
	NPQgVVEPAiHrJTHAPZmMgUThcXzFdIamQYj2wrmykH/gE6NwBcMsw1oKBlYWmyKkP5A9TkY5vHi
	sp0t57IUggZ6O6JARCa+EY9MYFQhSRRy9x+HDVXGgjWDiuSosWG0uoYSeKC8P6cc0JMMGoUl5rm
	aHSrRN2n3fXsNrMAwkFX5y1WOoqizlXpXgMAkFQ2HY0JCkLeR2cHGVezpRthoI+h4Kcub52izJT
	PuSpfPUW5YVzcboYlam77yKmG5YUWsrwcJHgGp80AL/b+E6n68pf+RCOk5MQVcydvN/X4111yDI
	aFf1Op2eM3RyVeTijHByOsaph9gQD9O9Z/jpUADForfrIqFMKoRZst1RK0Sofiumdqcgstx6MMA
	+VNzZQVfRsk76i4i4hw3nPg7R2GWsIiGv2Q+qtBwjcOtytVveNSgGv
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr40251935e9.11.1774006127646;
        Fri, 20 Mar 2026 04:28:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:46 -0700 (PDT)
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
Subject: [PATCH v2 3/7] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Fri, 20 Mar 2026 13:28:34 +0200
Message-ID: <20260320112838.2200198-4-claudiu.beznea.uj@bp.renesas.com>
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

The CHCTRL_SETEN bit is explicitly set in rz_dmac_enable_hw(). Updating
struct rz_dmac_chan::chctrl with this bit in
rz_dmac_prepare_desc_for_memcpy() and rz_dmac_prepare_descs_for_slave_sg()
is unnecessary in the current code base. Moreover, it conflicts with the
configuration sequence that will be used for cyclic DMA channels during
suspend to RAM. Cyclic DMA support will be introduced in subsequent
commits.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 32349d214f68..58446726afb5 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -368,7 +368,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -417,8 +417,6 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	channel->lmdesc.tail = lmdesc;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
-
-	channel->chctrl = CHCTRL_SETEN;
 }
 
 static int rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0

