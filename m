Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623C3451B2
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907795; cv=none; b=Z4HvfdQ3+Yv8W0rWQ6JOpkeLSQ5jeGx3qMzgmJwEHNKCPTtKDGMEuB6mBoWdSQhdaw7nqfWVhTPd6SebCbkTYJ7J9UX1ppl9RuRUX2x8xdmolb0isS5ufTlYhkhV4YD+seo8sG0KJGQpTyxJgKr28FBh7H7wLD7p1Cq9TY4qTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907795; c=relaxed/simple;
	bh=ZB6OzeV1iuOY4cphwcy1NTv7nOJuOcS76pQLBa2mvQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMVX2DMwafepHAJq5YVnuP16ioa8HLng1czIrPykDPNfLv8+rwGEM3qjAQRep96bvRcPyWvfmtpfn8FopAXxI5Wk95ulHI92l5SLSv0uk+83ZYOmV2qiKPMqvw0f1GQ9OQlnw6NwsDs7rr7qq7EVD4AhNebscXJhoqSFiTxr1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UaQ8JVKm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UaQ8JVKm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so2818919f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907793; x=1776512593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j+XdlT3aD7tJGwl9xLTbJEKXv1OztcK3gKQoyq2CgQ=;
        b=UaQ8JVKmly6Bd6KpAeT0HIxw89p8cBqDvUR3YQYkHE/dboPgPUIt5zz/3sQ9WRaykp
         WjWbWfeL4ZrflH41LxHJTDeWLNW9qevlHTs32AF5taRIYUe6gRsBhKuhWvFEL6mm29Zd
         IgkuzXYeNtW6KE8Zcfsh44WGDVqoTaudNdQGB5CxAXlOuj2Au7k918yjvU2FivDomPS+
         IXP5rcA6ADrXnJrGE9C5324eOo+B1XnRaUiiwU2n3ZgNSfdN0f9wEmA7ObbC+UelynZF
         BbOmyfEcjSgMWf3WfAs6+T53SvB2A/TmPFdILdbUwdNoIrnifDlezgzkVBUk1TZDbycQ
         fa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907793; x=1776512593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7j+XdlT3aD7tJGwl9xLTbJEKXv1OztcK3gKQoyq2CgQ=;
        b=PRHZOHqzvr42hgQmTECAtBDDXzzLCPjyfawNt+tq1NcibM+nxhVyGKLB7oB77ERCam
         cgoo5tnuzCpQlR1DErxeumVLD0fLamxL+h1xS4PpXaJ83IFYAPvYB02viz7I5G+D4kYt
         +aFEhtEj7KnrWD/v7dq3utkic71JsrgoFKWg2yfDWeFnCQN4qGa0xxK30LYXKk7seWPq
         cnlUxhKrPWY6k0svO9Ac6a1rE5lnxGylg0j4wEHYN0DxDYgvMGBv4noYL0k2/BXsJmJK
         3SXD4GOjYvbvf4zXMMMGveS9B83TJN5POgkSEJA1RJ5Q09rlM6XHtmjp+7gpdCdw3672
         9ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbrvGcMnMWf9QNcjFlUghD2d/V2e5vQecJa5F3d3AyHwMIh24AkCWbshMF38z1PYRYGw/umFNrxsX1JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMnXZ8di6h76biq1liQQRFGZUek/sV9Swy5ETFwx64aKGX2jh
	l2TwtU6LJEagOgSrAuiD2Gmq0ZVEX3cBI3mOjZX1fZ+eEOvT9/2jvdizDmVAriY9Wqo=
X-Gm-Gg: AeBDietMfXrqC+rkNJR727bQQjEfgYORchPXo58SFIeUDdAbZVj0MIpy4/ClXcB60Wq
	/XKHipzmgs2j+5SZRxPyI4EiZw+pdsl76nY1oywkU+8Jf4GOKdGijHa8siIkVQxsxr4K0AZCRpm
	wo2th2JMtagp8LM+xQz7HFLWiB07AgBHXPXICEJSOznTqz2fUqtOOuQTcUe92QM1aIaGN7YlQPv
	ZTCNUTPQnZc94gZRAkXe2hplqPFAsaCDbb+f8AHZOQuHe+gBY5E2RqmFWM1kEiJt2VIJZYQ/iGe
	5rgmZunI4UJENkD5c8wk5vaBCSi+MGc1FnPUfUTx9e4SBnS8nSwaL8Wl2f2kZ24kcJFueq8SUDQ
	4XwQAwWGWVqghkhCuDA7Zl7RcD4OV6p037zplKx+Xb3fjAA2c2trAKLO4GB14Sf2+MBeOrC2VO+
	Xxfemj00jrE5hsbM00UMuXatjXHuOJAXfPWt3mdFHR4Ga4JGFxLxmf
X-Received: by 2002:adf:e80d:0:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-43d69ff69c4mr3162191f8f.9.1775907792998;
        Sat, 11 Apr 2026 04:43:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:12 -0700 (PDT)
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
Subject: [PATCH v4 03/17] dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
Date: Sat, 11 Apr 2026 14:42:49 +0300
Message-ID: <20260411114303.2814115-4-claudiu.beznea.uj@bp.renesas.com>
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

Use list_first_entry_or_null() instead of open-coding it with a
list_empty() check and list_first_entry(). This simplifies the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 6d80cb668957..1717b407ab9e 100644
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

