Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B843B391E45
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568931; cv=none; b=lK/NOLXQLlhCEI8e4n/cBjNQFTS28OziWsbPFrbMNKzZVZ/LPI2geowJ/tdrfhcsNoRcSf8E9XSmiY2350FOReZlyzuf0yNd0N4MQbVjwUjyuY9hM4WATI9V4m6J3uhb9u35cp21kIFBAyD/jzjGhoNtBAwHphCOzBeHBe0kLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568931; c=relaxed/simple;
	bh=LcM1SQxlU2zEePNOi96MarO1mcGQ7md8H0StgtARPbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAEpW044Flw4tVQH04iNPwmtFlmg1gE8oa1wfTGFP4/hz8iDVSgcCCzYpGI0rZGLyR7hp1egsVvIhtWAN7lTPdjZgTU5zaU7o0y/4F7swJRXlVS54olDKqcLTSS/Uk7nd57Q8P72GoW6P76PXAbuAl2Q30kNhReYEmkNrzcIZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WQviGMsc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WQviGMsc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso5317280f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568928; x=1776173728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCNFfp+Y9opqUXxX/kFeUJeNq0Sa3NxuCau415grZd0=;
        b=WQviGMsc+PBHWW6R4QWTxwm67V2khKr+ngGMwqh1WOalxQ1dhASp08TdsHXSl4zQm2
         tRn6A/WsnuiRzPAWktaDBfmiqccyd0PBJJbKvaIJMxGTThBMxwrmmBu7vqxvNg5Zo0Q2
         7Ys21l40Gv+fSmVHC1g0Tp2TVa2+NQxj7zN/4qJqtzDkeRds20XQRJMy7oUBh73s6BI2
         +iEeX/TsjaNvFnF9aNNlHULzvyYGfmUb1GdIAeXHzN9V9C4WyqLmorM+ajeUM7DR+iIg
         zr3NGWmqjXMoqMzNEyGRa8hq5Ax312SIv4on2s7DPza4MG7S1/x6tj4OrEvq5nYfRMrt
         +YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568928; x=1776173728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCNFfp+Y9opqUXxX/kFeUJeNq0Sa3NxuCau415grZd0=;
        b=bSavor1/EnggEh8NvfLgJQOZGDjC2Qrt5OdiO7gcK3FWNZmAnsDGPdzy1WOm/Y8pjE
         xewZs9RNchkzmz44VHJ/7X+N6zyGUBINJDfspn5YcuvZd2IYnyOk64pvBp+pdXme2ILh
         vq4XcR29B0sTjBfzBs2/26zQeTxwviDZMy5FcGOpOoTBl3xc/aLr9jSyT5JhLF4bQYub
         WQnQV0pZpxgsyenOxncQ9BHf+1hPLWh+2ZG4hpgpSFFYtZP0Q58lVLITFNhZv2vaW1Zb
         4m21St814NjA+M/2PE050pmQliunAc2cOaxtsOYP2LlXjSYU8aODF+8Q2oFJ+wmDQpjo
         9CzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ESz6D2O9tOo3BfLdUBO7zsO+EYUHTuswJP8vX7Rw05Qz9aGTErb1ol41TYnht9Z2dCnAAzq8A+Vl5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+YKjeRqHL8PTTBYLWccJq5CfQ/utdDbBcU6wJ6hdzv3jcAMW
	mtD80+u7+EptC4hJbcUdvLaeKxvk1GMo45m6J3BSFW4oas2d466yuWVSCSROQzRVSM8=
X-Gm-Gg: AeBDietBy4HCv49CSQP9SjbP25M2rIeWyPC/8jgiGA3QVGJFYrxKQ1KYFo8rGqsnt9i
	d7uvLc/t2x9ExVQywodm7NlCSksGjDKixMIUdRtgxh+g+G6xGQ+fV+NJW7rA+0T7cuf9GoxtrC+
	E3lwPJWJ54iCtLJGJOYdj1GIh5R0RXqr5bsnp6cIDnYJLWOFnRIw2txtWyClen9CWCHod0OpUDV
	xWxje+012Q9KZJ1MGHwAykpQkgkRoRoZuy5N2ZAC7RyrEm35usFarJGnw8tRznxf/gmY/a/+LhM
	Gwbacvp7vVYokFWTJehvfjIPVy0hD/SDVPVkY/O7y2NR6VPuOezOOVwQLd1By/VmiJlJffMycvj
	WNeyQT/46i3PltxSHJhHdgGI1oei78/48+HAGgGb7GMIM2j1phD6ybjZLS2URz1PJNbvDFTjeFr
	Lm3MF6ZCPFArkPMKfdTMBYLVhn9JehUATUsfJqStowuhmtXnlzb0x9
X-Received: by 2002:a05:600c:8b34:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488997d530fmr246087405e9.22.1775568928120;
        Tue, 07 Apr 2026 06:35:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:27 -0700 (PDT)
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
Subject: [PATCH v3 01/15] dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
Date: Tue,  7 Apr 2026 16:34:53 +0300
Message-ID: <20260407133507.887404-2-claudiu.beznea.uj@bp.renesas.com>
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

Use list_first_entry_or_null() instead of open-coding it with a
list_empty() check and list_first_entry(). This simplifies the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..3d383afebecd 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -503,11 +503,10 @@ rz_dmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		__func__, channel->index, &src, &dest, len);
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		if (list_empty(&channel->ld_free))
+		desc = list_first_entry_or_null(&channel->ld_free, struct rz_dmac_desc, node);
+		if (!desc)
 			return NULL;
 
-		desc = list_first_entry(&channel->ld_free, struct rz_dmac_desc, node);
-
 		desc->type = RZ_DMAC_DESC_MEMCPY;
 		desc->src = src;
 		desc->dest = dest;
@@ -533,11 +532,10 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	int i = 0;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		if (list_empty(&channel->ld_free))
+		desc = list_first_entry_or_null(&channel->ld_free, struct rz_dmac_desc, node);
+		if (!desc)
 			return NULL;
 
-		desc = list_first_entry(&channel->ld_free, struct rz_dmac_desc, node);
-
 		for_each_sg(sgl, sg, sg_len, i)
 			dma_length += sg_dma_len(sg);
 
-- 
2.43.0

