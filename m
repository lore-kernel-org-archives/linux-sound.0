Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D653B8934
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568957; cv=none; b=NhPZnBoOsbDqUBZaeGPY53S/ilsgJj7a1tca3OkVyTeaomsThrWgApzoN2dTK5EaszxXkbCHoG1yCLLR2pKz2PZEBHypAQHmLqYnLqex/zAb4biOJVIFsJaPbGC2OFrGNMCFXDoKI9H+6uTVPa4wnmdPGDDgv7DkmhVE9JaXu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568957; c=relaxed/simple;
	bh=q6oRXOaJk8L7LPyGO0Tyfzj+SUjE/1LBugvyTQiyfxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEFXcJPEe+f63Mma2vTt2RpRl8cI00bVghLwc5swGLcGm3g4Mt6KPZifX0N6or5bMDpHzA2LbttaOlZhyRUBx/qxngdE3Z8HBtEr8+mM9Cz2jsATmsa75YhZZ+1PYPUd+GslVmyCVnKnylfGyAzNULjFJpjsBFP/h5D1NhkiWw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iTSeG/8J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iTSeG/8J"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso21715285e9.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568945; x=1776173745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrYQrHbvnZn1N2MhGkB4fAR6VCs+0IvT3ATvQcESfxg=;
        b=iTSeG/8Ju+t5Hyb2A/nc0BgLmUYgBlwmZtRUgietPfS6e4fTgpKy1Jpo0lmGqAWv3y
         2DzcQEI63P0wZw59H8iskJ0WZXw+yWvTNjK6SB4Mo3ydyH0mdnWy9Yyt9v5azHjK1P2w
         CX45fLd0N8vmbza3zkGR32FP42Maro5l9ApK8cJuF0M0GcpggRwB+ikYc1vBM0w6AdBM
         B1gPcYnxBv+4tLoCCzBqh0Yv7rDvoZ+rdoAe6LRYvNqUjOfOIeRAeicBmST/OR221x5j
         7iXL8lloZzQ6/4nL3PGfnsyPv+jrr+qq+uBwOikVBvOe/p+OZYw9yNC/AIHArXnNv1vz
         3xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568945; x=1776173745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GrYQrHbvnZn1N2MhGkB4fAR6VCs+0IvT3ATvQcESfxg=;
        b=N+p5NxzdH+IkT4ciwPNzcDynJ4ohxtPjtiDmA5sax3fdkT3t/E5bzBg77fk6BzypAY
         kkUqXQaxcvTBebqnjVq4KrpoLXWU9SqXoR7Ssk5/GFCx9Aaot3cNCcRnl3IVcaOTIiso
         ez9a0fXlAdchsyMmIU7/KomSTOtsJ5GWdx5jm5oHxuGC7DqdKSdPbkl8wFcFzU6i0SfW
         Y1yBNkXlA21FgAWYuLLdCfH7A2rmSOWdj3Pmy/wa7leGoP2vY/X0A+UlqQPGB/l6oc8d
         E3lH8iaZfnpw5pELQu6K56u0o6ctmTH14MP2RIc8NmXSgVlcludiTNyMYmgdOG4uSC8N
         TYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoL+5bRjc5oaA6VGuQA2Lf+3XyRZ0airhw63M7/vgE7zSD+Jrk4esBLQfOqizNaTA5nn7pjKYq+UCuEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1w2FyetffolabrY9FPwKo3mwwTFoTlILXdX8GivenBKpF+ia1
	4mtE0+LVkYznclWw/NXBEFuGofFxx/kzU+hAj6cS9GP3TzFidEVroUhwV0K9JVZ6M/k=
X-Gm-Gg: AeBDieuJIY1AYX2dl/430pQrIQXAMhjfp/VpAdCDX0/s46/qKurV7849o0k7+poe5Re
	SvP9TltKrF7DHGPJh6lf1RRRebM04KRH1GHYD1MA9M8WqvifsmRikqy1Zxxwnr1Gn5LPnZKULSV
	Ogc3kZsBKbVbjFDUzS7A0LSsZ/0r5b59zrdS46i8YvomSwfXBPqq0jX2dFruKoudBwJVUt5UTis
	ExGhidRguZovYBtB8pW39IdQt6VQA8PRjefepTZMigVfEUw3+4bMFFdBuBtA3YlkoepoAtkxQHr
	ML1GABkz/5Eq6HB73xaoiZyRlq7ZgCLr27RtxVKo5qbfvE6Edt4tVzKXSlEZePMoR4BMFExmaJE
	Fth113F6ProgSPdymQ1TYpUn9npeKsXjqvxLDxrawdWSfJvqH5kSa/m8mTkUrcievncQEMJaaKl
	0rL2NDi0WgCQB556tHGruNtWaX/FPnNrDlpIL13N0DaZzObMnWERNX
X-Received: by 2002:a05:600c:6098:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-4889fb73b1amr209462685e9.28.1775568945398;
        Tue, 07 Apr 2026 06:35:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:44 -0700 (PDT)
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
Subject: [PATCH v3 10/15] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Tue,  7 Apr 2026 16:35:02 +0300
Message-ID: <20260407133507.887404-11-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- none

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index bacde5e28616..8fbccabc94e4 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -377,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -427,8 +427,6 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	channel->lmdesc.tail = lmdesc;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
-
-	channel->chctrl = CHCTRL_SETEN;
 }
 
 static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0

