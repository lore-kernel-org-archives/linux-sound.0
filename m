Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551563BE16E
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568958; cv=none; b=L+vaSeGkaTTTUgdV0gYsw2145eKgxDvBNm3xWOxjxdP0KYmfkFTYUoQmLT6EmaPotAcczdPfHXFHbPj6wMYHxRf2zxdtpr6I50zcg8WixmwGeuBosq7pYcWqu41UWhwunzDhULK056W+UmMfWr6/PcRp16GnRTnJTxiPQvUknko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568958; c=relaxed/simple;
	bh=qj2erbi8E1PHLHMBePLWqnr6WpeMTkKkmKKSAlTnqiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+FDrpaxkJSJ2IOU2TVr+FwU060zzxBgNRpUzl2LbrTNSRomwRbUbCDl/dMnBeBPANuqq1HEbIDVeR791QwTjqGosJMngv4/LrdIYfCkQqvbD9BICZKaAdQw8vX1pPbDWFUj5S0m3p5znMJQTtE1DTLyy3KSvNQFQ3Kk24AagxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Nai77aew; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Nai77aew"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso21717075e9.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568953; x=1776173753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQUgXvLWYybp144uyKlEx9/0iJj8Kfku3jsi1mOzCQA=;
        b=Nai77aew6DrKho186rrpgwSBX1nT6l5LAiqCPZLoJE/1j8eVlYfuPHS2BEF4EMxI02
         LlIFiNFCFOldNbFwuH+hJUhU9GtZNK6bsm5kXXNjTfylpqDnn2mTPtXUYA4Fegl9RzVE
         wGRp9a4UvLp1kfFvV3+zYztj6aI7bcXZGpKWibI5zISiHDnk53vl+8YOwEyEwyIrgOns
         JX+mt4T85OulqeptHdzq0mJJiKtF5LMSDrfcZ2Ak3yZgiWgEmM5CEWv/kqR1XEscyh/w
         +XmdyrkCyp62RjKMhDmLHGjhYq4fEjuiZAMPkRgJfBp8WlkfIlvyOZpdPfsfcxQEwHAH
         5DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568953; x=1776173753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQUgXvLWYybp144uyKlEx9/0iJj8Kfku3jsi1mOzCQA=;
        b=oVRmhihcpGJUFq1mREfZXOjZTc7RE2b7yhfgUl4qYzHbU3gbwgnIGWI6rh5QJKRVap
         +c2fI2Uy/7jtg1ORtwIKDYp5h/Ka4dZj8IST+bowJkywynS6OqMslpu/5RFpIvHt2Evx
         hqN4Uy97x41jHPPVTQTDfJEt2TYEES46mpSPP+1ozSR+WneDL8ERm7FoBZb9wFgZFhIG
         0FrdvTbWPLtmgewMwSxJ0u8dXCw5JRbnwKb5Roz/KDiU2HiUoehC/MRPfNnQybhx/eJL
         ZuQB45BQOnCSdlB1VZOAyfh5FiT4E7cdUNX1Jz9+o9vyIb0GP5zi/R+e2w/jdLhZdrL6
         1hyA==
X-Forwarded-Encrypted: i=1; AJvYcCV0lYqwYvchq/hZxoTd+7Q4A4W3ptLrJgkUm8CL1nPsG8nTvmpS9OVZFZseyDRbXIGkmnMQ50Kuh4wnmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfTAfY8GhZD4W60pK2rbsyJgL4KH11KZZobaJfVH+ER9NbKBf
	HFO7gWlJE76oZiWTNER1qGiwXMvSkIvQNhJ88HW/5tvoBlkDNf6znclwhO0GaztBM+Y=
X-Gm-Gg: AeBDievG6maOWS718L0nTn5X+CF88DTZCGZ+2jR34AVbPioUCdIkr7H3YH2ieLj87zx
	fRu0e39B1LTzDO2co2S+H+utWTDrDPO/VG9AdQEhsVj/GjM0wLEDvJEwuC0nkBrfSbnubYfe4iG
	D8DR2lItboURVuXBlA2ILcsCetXyqdJqv+A1WbJlU0+zkvpntEfhMGY1k6enwYmq8q4DdTMlbEv
	8Gb7VcHR9r7My13jthVrMLliaUoxD5je+7Tv28dJIsBshh1P4oSUwGQHBKnTeVjoUdTfXYbwKeS
	SPcrjEjjyUnDQb9QLTO6d2h1opGje/k2tCLAQYs7qhBWK8Ikg2FOIIzjeo5FuFOJDQCBrT65q4T
	uwft/kmWcj6I3fuLPKBpJQFfx4T9jOJI/PfSQ2sMpPkLhq5QBnjfe6qWd/rpJRXCp9WiB8sTnLX
	mYQH2fxB6tLGldoqH3G6upZ3ldKQXAsYMwqhYGhTmWu19ENYMOWcXV
X-Received: by 2002:a05:600c:638e:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488997b21e9mr238787175e9.18.1775568953327;
        Tue, 07 Apr 2026 06:35:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:52 -0700 (PDT)
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
Subject: [PATCH v3 15/15] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Tue,  7 Apr 2026 16:35:07 +0300
Message-ID: <20260407133507.887404-16-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- none

Changes in v2:
- none

 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 3265c7b3ab83..ac388e7607df 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -200,6 +200,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -385,7 +386,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	lmdesc->chcfg = chcfg;
 	lmdesc->chitvl = 0;
 	lmdesc->chext = 0;
-	lmdesc->header = HEADER_LV;
+	lmdesc->header = HEADER_LV | HEADER_LE;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
@@ -428,7 +429,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
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

