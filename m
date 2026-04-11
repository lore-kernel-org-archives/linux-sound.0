Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C56435F176
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907822; cv=none; b=sI9n2pmbJizB+P4UTIU/874oOotiKH62iU29I/ByosO5YeT2FSp4NQOpqGQ2FiJh0uRFklGZYUavJrMoEF1bCQxoQ9RTVb7i/Oxmymqc/0DVVje+ER5zBUOzfwPWJxXzdlorT5mCKiTLpqJI0JNMvpQ2X+ZBcS7UyoRoeQIpuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907822; c=relaxed/simple;
	bh=00agU9G8WCwFdL8wNmeE5/RI+LQevLHKH0zoSbPnvhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MftBpO+kOIQdw3wV0pxiCbjAbQ5ZQ3y1viIHLTNCPyusWoVSr5TPpNAYZcyQhr5Oj+q74AB12c+J/YjNMAIyrkbCfRXbheCxIUSuE35I1U1MoSA6kF6x3D1EI3ox8xoRMKMohTTYf7HMjCBcjF5gTJs1Z49FN6y4ESkHeQcR+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aR2uSJiy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aR2uSJiy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so1965309f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907820; x=1776512620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woi0lrK3i2kpcKywf5o3X0tfp9llXfvPOtNyhrNBRjY=;
        b=aR2uSJiyLT6jmwBC3UH6WcfEo4IK6ecwdENClhaWAE8OcMX2Qiug9EqrsvgpYVJGVc
         zjdpK19ssdSr/KKwrSrTYiHPIBJzL59S1aNHGw5vS1XlY1y0PD2c0BdBkXpS/gC/8PLM
         XfRB6JC6lK3hlu5S+72CT6foKn880JNNQXQ6lqjIhzMvpnavRgiyqup/ZZURyM8P5xOz
         DuWEU0irOKUhCuNd+lneHGGGICr8iqau0A73S9s2/bKwTJvTMbjKMk7U9UK9gXxFGoPK
         g6fDAvDW7Zz3gCCY9JWgKD7YVr+ADGCwDXFTP4AM2hSR/I9vCv78xsFCZaqbw/Y7csqE
         3C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907820; x=1776512620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woi0lrK3i2kpcKywf5o3X0tfp9llXfvPOtNyhrNBRjY=;
        b=OZcamPOqazVc3zZ1Kl6t8VkG84bJgkuXavYM1q/bz/hqN2kLmVz+vmnFJ9aj+fjLXi
         mBo5kmPprhZcVnEf+0B5ERRbKHEYauVIaqmSaIFeNqCkkqflmXTPSkGCYl67sZ7h18W6
         AN7c/qtqbuQ1eEghUZ6bRoxSijPu6nFoCXKB/3mXQClPhNMd5uAwpsTTjEEjUp0T8PN4
         JbekWe6CuGucEZV/NNAqAKIwC4V2kg6nrkRhXeAERZbHT9Fbo9gf7FjJolUI/QSGvww8
         UuFR4VgHYp7oXbEgPq8sGN3B3pgehYyXfG92bXwFZMX0BivqGoQP2gdGsXSgys5thFAJ
         OhcA==
X-Forwarded-Encrypted: i=1; AJvYcCXmgvrjFKWU5nkfq43xVT/1IhHmyrTyPTs1nhbQ5bufKjV+yhzMMrMQSGlReVGPSNW6XSQEVroZelCvYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBizfRoKPNn8YyQdo5TlruLbkG8QVhoIBHojB9frfk9S4WLWiX
	oR/SWwbZ8Vlbyh6dtllAZ9ZzDNUx023fBslHsqZbU/DGXk9ukqsjNz2px+I71hdMA2M=
X-Gm-Gg: AeBDievo6ULrj1X7+vMBCTvOOwn6jEH3jhUSvhYLM+rBnMoS2FywNMo+S8pyfSHh5gK
	oSKMzA4jmTwMCDNWMSBgYrVI3EbjNUVNEM5c/fjWcqNTRt82RGNRZvFXHacnbJfoStvQhebqo/e
	FgIXAEDeYOYUAqzse1OoGfXlyXmEZl8ggSItrwEc5wuAA14nnXHW6Nup8j5chwyesugBkoy3Qfb
	aYadKBlWwDJAHoS/1xpylY+rUPfsvre880XqXe7uPMRx+TvXgz6dS1k7jBoxrb2diD1JFU9vU3j
	K8Dqow7qztcAE39w5IXRgU1AOZ9/++omL6eEMvl1g2CvOUvz9qhPD4XzFxj9ngjDXKSWLBRRzRP
	WwUcLOZXJ5NyXSWSfih5POrDGTNmxQySJJGA6WZlvLbU9/rZi35cFtHrniUzQF2kXDtRqOl2zKe
	QYLcATwzPfVa2fCZN7ZhsHdtZhSvbOeRn5R3ZpcgauZvYKY4QlJyzDuP2MYxHPfY8=
X-Received: by 2002:a05:6000:420b:b0:43c:ff3f:c635 with SMTP id ffacd0b85a97d-43d642b188amr9465975f8f.34.1775907819734;
        Sat, 11 Apr 2026 04:43:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:38 -0700 (PDT)
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
Subject: [PATCH v4 17/17] dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last descriptor
Date: Sat, 11 Apr 2026 14:43:03 +0300
Message-ID: <20260411114303.2814115-18-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/dma/sh/rz-dmac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 00e18d8213ca..f5d2e206f4bb 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -200,6 +200,7 @@ struct rz_dmac {
 
 /* LINK MODE DESCRIPTOR */
 #define HEADER_LV			BIT(0)
+#define HEADER_LE			BIT(1)
 #define HEADER_WBD			BIT(2)
 
 #define RZ_DMAC_MAX_CHAN_DESCRIPTORS	16
@@ -382,7 +383,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
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

