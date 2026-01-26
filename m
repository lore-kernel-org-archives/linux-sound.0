Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5D331A79
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423537; cv=none; b=Uh+fHUgUSJ9mU+00Zkhi/RgOg7Skfd9WDZjDTEPyT5JKd67UUYUO43IW5zR0hERk+6UE2W0bSDZXlPy/r0rhb5X+GmHidkV7OrKKnA7/M/IfiPeJs5lOsMdDBfAM212/LeCGQxdz+A0Jxc1VHj0/GTL/VypCw7qNuLxdsHQpp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423537; c=relaxed/simple;
	bh=rLi08UdXsCL3zvjViBaowms6zxtQNJXRNf02+HbElyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pePjL8eTqjoqPbUYZVdzcE+oGFyShasmATuyg+CeJkS8Ame8cLRr1l5etVje0JXnHN6NIZBZvAhUbMuFWxs6FNkSH5uPGTIn92xxf+J2MbjQ9GuFGA1MBeKd2mXMaPDv1pvFVYmQXYDiu7pBgkkGSX5OdsF1LJzCXisMQBNawDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kPQjfLTV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kPQjfLTV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4358fb60802so2493182f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 02:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423534; x=1770028334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVTiMUECZKumoxUGmttzNBifGHS5PA4+h4GwvqluTUU=;
        b=kPQjfLTVMBWsaLlE8cWmxYXSBVeil1Z7g5Uco6hreXEpt8zOO1NH+trhVC2EPxwToT
         VxRjk+OymT9ZQ7Qg/JpxwGpTLoX8BO6fS3/JODGcmWD04ZZYS7E/jevsAQFVu0zo7s6Q
         cv9ylzUahw85/bLx/+6VuMjTqqUO0QROVkouPhRNBW9jlxiEeZQVPOYcaWIk17rY+ySP
         aX8lmdeUuwmq1/0ouwJ+42YacK0qLs+R3V4KP4IiOrIx2W7BzEMeJh5lrV5hIbYPcAgT
         bI3CNsGBkyn7NuA+kTkqOWRbUZ1CbHtrXQT1CuCYNmI+yUzPjpcUVevDpTEAH0Oa7c3l
         9UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423534; x=1770028334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVTiMUECZKumoxUGmttzNBifGHS5PA4+h4GwvqluTUU=;
        b=wZCp6iF2KfxpARc0O1l4QxrbRL6FDBCDOZKWX0L3hbNzP6E48ZW40vVYVO54Hvffbo
         UAxQW1ntFpl9OW3r9pUaG9i+0yo8Hfe2XBbe5RVn5f6uut9f/uuniZ74Q9zMv3j9zkzd
         tYo+RWXr2Y0KhE5jdFwi/7GWSTE18d/24cQn/L/V/S3XNsQKCpfa47/RGMAciNyNYofE
         QYcuIEdC/8USh3sqA3xGDdnoHWeI0TwCtkR5n51ef3hi1iv2XGYrn96h5PAe3NK4dOP5
         sqgJ/jXpM36P5VxbhjxzjEfW3QkTtkko1Rf2/4M25FJYqQiPM/Yy6wO803cX/d3RioCK
         /WKg==
X-Forwarded-Encrypted: i=1; AJvYcCUC8hQxJMgZXGQiTsHXCbmc+lh9lqCpELpysyQ6jgCzIetk1KYxDkTHEGurIqV3d65H2qw4SMFrBhvWSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/XapLECirJROVmeSr+tdFpXO3LxsRCM3Ti5ANvHSuDJYGZ8y
	uDsJ8+aWtXrLXqLsr8fDakM4JaQoDCz/HPYWEQvyywzTVfLrxc3RAP1NTVZ3NU9HH/I=
X-Gm-Gg: AZuq6aIm+UZ40PWCMOGyBFw8AKIFYj5xb/Fn1qFG/KV4DTXSwI63C9/hBSiBpFWepSO
	fydolDxaecuUh56/Zrn/xtgBV+K3Q6xpOz+F66lY79ONszDYIFqFeV1gEobDtCgVjYZ1FHtnHLN
	rrfj2Oc5dQYbhZXIVuB57r3CqGtoui0hLgZ0BC75VzpDUskttxl8TyI9r7BS/htOt9VekZchdxs
	3gbfw4AUX0UhiH7w15IWy2yqSS0qHqfO9mpywsPh9euSW33PpIIPtUyq26fNOTrmn/fCq1nl+9S
	kvpyxNEQ9mC09B2LgpliIyD6ETqUkJ/1P51MEMjYdHWD4N34aTkDEKEjcX6NYwBenKWmMIdsG81
	fFLcFhu7lE1e2BZyLbiLvTfxxOOIgfgB5W3Jp5HmRdJjSi+3bmHZ8Td3dhUUE798+jDmYIId5AT
	kyaR376VDlTVw9l8irqRJsPKTkCjfqUTJ9D1PB3v2HhW1s/sQmLw==
X-Received: by 2002:a05:6000:2210:b0:435:bdc2:461 with SMTP id ffacd0b85a97d-435c9d18f01mr7343320f8f.21.1769423533834;
        Mon, 26 Jan 2026 02:32:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/7] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Mon, 26 Jan 2026 12:31:55 +0200
Message-ID: <20260126103155.2644586-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 8f3e2719e639..3a77a560fcd5 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -206,6 +206,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -383,7 +384,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	lmdesc->chcfg = chcfg;
 	lmdesc->chitvl = 0;
 	lmdesc->chext = 0;
-	lmdesc->header = HEADER_LV;
+	lmdesc->header = HEADER_LV | HEADER_LE;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
@@ -425,7 +426,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
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

