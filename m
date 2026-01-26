Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D42331221
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423530; cv=none; b=pr+86u79xxhS32gcWGOCyYsUHkpY3MB7BXLLacd0cv5fm0fJ02LjIClkpM0otjYZehSH4jfq5+4maYg0+aPZluyc06BHcorom2uc2EjEB/AfY0ehjiRB6blQQUSWMQL0bSMvvk9SF9kMtdb+8OzmMUQVFOkv6e9W/6jeWNZJTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423530; c=relaxed/simple;
	bh=r/SU5oimCuoe+JcHi0XUqVFDCGGG+2pEiPjSeS+Fvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOzPYXrxo0JwRt6QiVpMuHxvReEsiWJw8jQ7Bulzj0V3m/N/hJkilcXeAYgwfs+/TbbIB7Zyu/WEJQ1gyu6rdkonSs78hGtCshOTSZdE3yLlAUafZSfoa66DWdzhPN5aqLtlFsuE/b5GMKxQVYGl398rOAHSBTFVxxkmnK/KW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HwlYUNH3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HwlYUNH3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3061527f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423527; x=1770028327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWa0aGJtSMtx7LCzliIPZcMgkE6x5phxxbaj/EtOLPo=;
        b=HwlYUNH3Wn+odahPefogz6BXJ3wnDaNVajiYnyDjhjToqMIKq4UMP51TmP05SWISDf
         0dWNHkB1yrQijuTSmDsAWPZOZZb5L7d2AuO6Z95fvVF9b8TBUuO0Uit5S68YNrWroLyD
         iLvqdxs41ehk/os9QuSVIZ1PBPn8DI5PYOJrWc7zG3XBwR+l8g7Awnwi5pRv3sV3hoTb
         8O2TK0XrfFT1TqPR85Z4mEXslHKomILN/B7O0q6DQpfwG52iXJ4HL1xtn5wtbrbMFUo0
         BxwlR0zm3X1YIDJHhBramH49UGC53nKLXsw99J4EH/8EmoLbKvJKrkV9JAG9Q53I+tqj
         DU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423527; x=1770028327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWa0aGJtSMtx7LCzliIPZcMgkE6x5phxxbaj/EtOLPo=;
        b=czxRsOUaSNJ/JwXOBIjhjsQRCqQS5SifqBhLCaaH82n5P6m6NDY29w7kVZWEROUAog
         0lAH8i/qqok/sP93xezXhCcwNyEJCSWffIUSeizNb3xzxEzfXjhVfduVoWJOTMS+SsyA
         8yw9tpoPEHXGY2AdjizFprw3iL52wwQKlqjrZbwq9utYoVlWKxg6Oe0vf7LfUX7nlrIv
         zxQdstWKHezv6M2s42GJI0hWIVpTFCtI6tuoQd525FrAx01HCY+Y4TcmfRgO4bNEuD9c
         IKhMjj6oIgVhCMLjsDr+gTVqcMVZW3PbgjkBuD0cn4BCPcnodFZ+yDiJqBFAy0ycSP/I
         V13w==
X-Forwarded-Encrypted: i=1; AJvYcCW05pctLhVOUQ54N5WwgALmddJU9mf4h3tpluKtJF8+E+2+tiVkbqbBayZPYA2B7QkNydTlSeDyeLYc6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3VCFL0ik0hHuxKsYGgHb8XGxAtyRPKUJA5htJ83jrbujXr/7
	5nVhw1lAPfA/MafJol9lxHedFlMxXntUhUg7z6irOTvcUdJu6bjAHgLp8hIN9FCWPM0=
X-Gm-Gg: AZuq6aLvmB07EKCsjvW9QD+1Dn8rjfM76hG/MtehAErPvZKd3O0uY8UHy6JXsPvK5qb
	mbEva6oKt+UAH6Fys+frqglUgJr9ukdrNv5qTCQxNNenIRks14K2aCofrwjjDZieLVMlibAxgeS
	d+q4Kv5d5UGLNVvuA2VV2KmKAh6XSystNRWddbVGQpZnF9LvMBSDgDxGRz1qLd37peAMvOghU/o
	xqjyrG8zU/GXfzQ/VrW5BC90z1B0EsPG/bmobsc3VfyDCyLlFPHZrRQlmlK/FcsJafYZ1sVuZb4
	qi6yyURn4+84X/60oUosIohDwpkshBPFVXGSFCsY9nMpPCmuQ/+8P9E6YmbA8MRYCf2RoIFhfIt
	N760h68QJpDFWXpTRkpvktlt+MxdI7ZT+F1Pj/FdHUafd/BP1mc+l5p1jLrTH9dkFTZJVxwv59d
	lnRvbXIQbiuoGkv06aptIR3tRasH1CAXSemnpBfk4=
X-Received: by 2002:a05:6000:24c1:b0:433:1d30:44c with SMTP id ffacd0b85a97d-435ca138ae8mr6980335f8f.43.1769423526727;
        Mon, 26 Jan 2026 02:32:06 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:06 -0800 (PST)
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
Subject: [PATCH 3/7] dmaengine: sh: rz-dmac: Drop the update of CHCTRL_SETEN in channel->chctrl APIs
Date: Mon, 26 Jan 2026 12:31:51 +0200
Message-ID: <20260126103155.2644586-4-claudiu.beznea.uj@bp.renesas.com>
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

The CHCTRL_SETEN bit is explicitly set in rz_dmac_enable_hw(). Updating
struct rz_dmac_chan::chctrl with this bit is unnecessary in the current
code base. Moreover, it conflicts with the configuration sequence used for
cyclic DMA channels during suspend to RAM, which will be introduced in
subsequent commits.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 8d8391a5b3a7..4bc7ea9566fd 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -375,7 +375,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -424,8 +424,6 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 	channel->lmdesc.tail = lmdesc;
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
-
-	channel->chctrl = CHCTRL_SETEN;
 }
 
 static int rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0

