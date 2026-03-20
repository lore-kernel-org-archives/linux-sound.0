Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF803AB27A
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006139; cv=none; b=UYCMpx4MoPSrio/MIdqG2OQ6yAPopqI7876H0TPYJkXUUL7S/CNBqhvkypIIynFbOBbTm1oUwp3OabXrV9YO/w3+x6yADVmMrEkQ9hurScoh69bWAbZDmzRnFqSQrzX4EO6nbUNz6aKiHR5XuDrDmD8E+fVTMc+sX2BqO9eaMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006139; c=relaxed/simple;
	bh=ZIU6VE1rdd8h/W/u6JZmxearSKQT4cdulYKTOXV8vf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckiTRNtwpyu00F2rIVaz+LcW5SrweyPhp/EqOrJKSjzgE1w1HJzyOu9aOsgqqYph/heh3Ek/RDqCe3tx7RFs5DvXHwBFWwVyyp8Nw9FtmBvBkqqjCYOHj06ehknv/zy8Jx7iiSzOUVFUDb5Gz44iK6ZAQCCvwkcWss783DG23n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ln7tn2Vd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ln7tn2Vd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so4883575e9.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006135; x=1774610935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxH8LfUYZeKM7Jz/vL5iiWORgbu1oqnI0wnugAc7pg8=;
        b=Ln7tn2Vd/xaWBuZvnC1Dv00t40u9P+GmGV07DSu+KOAtQlDjpa1fxTTlSEDSxazW3b
         vjkF6WyY+IGyWf+7ug36rmplxFq8Wd+rPBqLeP0kgs7pN3oyXI37s7yt2sbm7sRyyWLA
         QsTeWrzSrnT91cx5GABhVPQZFvkrjH+ghaplkdz6kr6nc49XRZ3bYuKztfQDx1YhooO/
         GHvbtGZe1tsDKo1FpIaWrG3qEkkBSoLV2TiLQ0XDu4Rr0QTctrt1zYdZoPVdmvT+mAh8
         4x4n0h4b/Ia8Coy9yI+rtElrALojjs93n8eXkT+TC0WDVielVaNSaV9teeGieeN1dETK
         rDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006135; x=1774610935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxH8LfUYZeKM7Jz/vL5iiWORgbu1oqnI0wnugAc7pg8=;
        b=anU2J7aNHw86rmwOgZtER7HKQg15vt09LtEPoYVYYtktDYiv/W4Jpgad3IFcum0pVr
         /89ZGdt9MfaCpg/64xNbFLOJ4ZU5/XnLWC+a8ThtDSxRNElAilpEuuJrQwQ6m2qRxpDs
         oLeHwK3MsJSPgV7lFvpITwe/uhxFaR1f9IbBi9MIobLYhTBjqdUYPr38b+Xkqs8ihXeh
         FSfp4ODNA1NNlbF0AIAFCtXWh5tNWx9Xrtmcshkac3rJ1LkeT+3cldOjjD1ANUjNdRqv
         Sxf475iyfyw4ltEj+KQkqlYAWkXR7ep1VY9vCoe559TvYdfplMTey1Gf8nAH3B4sjjrU
         1qOA==
X-Forwarded-Encrypted: i=1; AJvYcCUU0XfkKpHRKBxaIMLRLfRyYenGfvPkQAv4RUG/UfDfRcPrtVWJ5hPQ4CHvKSCxdHUbq+z/i6bwu5HAYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/Fe4EmgiVJPl79nzb4SKwx8rNm7bnyb6mb81zOXI5sDkTj/4
	tK63jP7adNCk4rWD764w1DlK6jJb/1Q3IpA3wieoa6hxy/qZu55iT6wNZDmtDIMJNBA=
X-Gm-Gg: ATEYQzwgq4rdD4gUGujSCXpCcNDR2ynBhqF34PoF5TD4gxSrEPjdX2q86AIaLI0B80r
	XE+IxuD2aIlcjqbkjT8EG1QYY+Vy6H71Ip4DadsrhvwZGuN+IC8o+acKqOK5kSFAFQjTSwMr0LB
	vtrEG5Sme7GT41Rvp99sVNkZGssYhENLH5OVDwIs2jtd8Yop0Mr65Y8LerWExkj2pyxOUnoC7Sc
	gkoCjyqHRX/yqQJG2aW9Mc7X3d0VxvMy3aqjjrbrsAp9a4c5vPYLP2DJNYdRdGC7SWQst/tpKYa
	obzzQJ2cYl7zJs2j8+l7onZXnB7crylarzcXNxEGnMGtxJw2pg2jBp7y6+H5XEVqnWQw6lFMWg3
	dlSTRyE4Yd1QWhtJzRarMc/79fHDxE0BWpBUnbr0cEKWEXzyU7ofCXP0utbav/4JCSuO3twMwPH
	lnkapCiy2bpp6TcZYyUyfX+iWKAN1K+C7bP8UNdqJfq2I7rdbJuUXvNKLnQaMdeb8=
X-Received: by 2002:a05:600c:1e09:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-486fedfb677mr41638975e9.11.1774006134684;
        Fri, 20 Mar 2026 04:28:54 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:54 -0700 (PDT)
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
Subject: [PATCH v2 7/7] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Fri, 20 Mar 2026 13:28:38 +0200
Message-ID: <20260320112838.2200198-8-claudiu.beznea.uj@bp.renesas.com>
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

On an RZ/G2L-based system, it has been observed that when the DMA channels
for all enabled IPs are active (TX and RX for one serial IP, TX and RX for
one audio IP, and TX and RX for one SPI IP), shortly after all of them are
started, the system can become irrecoverably blocked. In one debug session
the system did not block, and the DMA HW registers were inspected. It was
found that the DER (Descriptor Error) bit in the CHSTAT register for one of
the SPI DMA channels was set.

According to the RZ/G2L HW Manual, Rev. 1.30, chapter 14.4.7 Channel
Status Register n/nS (CHSTAT_n/nS), description of the DER bit, the DER
bit is set when the LV (Link Valid) value loaded with a descriptor in link
mode is 0. This means that the DMA engine has loaded an invalid
descriptor (as defined in Table 14.14, Header Area, of the same manual).

The same chapter states that when a descriptor error occurs, the transfer
is stopped, but no DMA error interrupt is generated.

Set the LE bit on the last descriptor of a transfer. This informs the DMA
engine that this is the final descriptor for the transfer.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 6f83ccdf94c6..95a89c9d2925 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -206,6 +206,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -376,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	lmdesc->chcfg = chcfg;
 	lmdesc->chitvl = 0;
 	lmdesc->chext = 0;
-	lmdesc->header = HEADER_LV;
+	lmdesc->header = HEADER_LV | HEADER_LE;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
@@ -418,7 +419,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 		lmdesc->chext = 0;
 		if (i == (sg_len - 1)) {
 			lmdesc->chcfg = (channel->chcfg & ~CHCFG_DEM);
-			lmdesc->header = HEADER_LV;
+			lmdesc->header = HEADER_LV | HEADER_LE;
 		} else {
 			lmdesc->chcfg = channel->chcfg;
 			lmdesc->header = HEADER_LV;
-- 
2.43.0

