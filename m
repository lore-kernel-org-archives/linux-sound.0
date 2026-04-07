Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A53B775D
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568932; cv=none; b=fF+Mo1ibdWu+kF3pQfJI73mSRl397ckmhV1pZqdl/SfJIr/FEmIS7O0UZ/PfEKcMAmWG63mp1Du/MrbGvYQyEYhpY3El3yFxRRQ1F1QbzMaJ1Z0fGNjZgy6p7Qh4u5gDj1Q3mYVwDbxy5pBE6aDshMeR2nQ6ySojMUMdiu27FmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568932; c=relaxed/simple;
	bh=NqIhL7Kx94ecGHipdoYoYxEN9JWnQ7jKvcbzALuBTk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtmjjV6ITM+Ny2Z8G3nfQtpfuaR5ImCZP/q87EWA/yd3eBS6y3YXTSzMGnezZn/sKSTQXSg1sEDiTxr9xxF+AhcitFNxu1RjHYAx5qbHgHqARgHg5Q1m0j2LA8kGZ5qKR2hpw93ND1/0UZKMPWIXjuaVRmpw+fM/Kza0ygm0vqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fdJxSFr5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fdJxSFr5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8efed61so14020625e9.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568930; x=1776173730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgdgMNUKOKJYt+Gxqf2ssPII5esh2nyuFo140mcmnaw=;
        b=fdJxSFr5H7ExMS7lgqwv7EoHIf/Pj00zEgfWLWbHMNC8tQAkDRhQVDV79L0x4GZWUa
         FZrM8/Te4Lp3lTy4y7mhrvDSoCepv7x/nxI0E/h4iIJUbpJ8V3OiN8pLdgrIFVLd6Dqe
         MsdXVXqmzmGvBVf3LXv1RD93Y3mpzLbHCqv78R0kxtVs/FuN/RC9Np1XhsP1KBxa4Hmi
         o3CWRSZ67rPeabluA9A/Z8Sjm4dBwO+vVXCHs0vicoyWoADFgh8A0HoM2920103k59EC
         NTx9VYy6m2tuWSBOrUx7ryQUJpSZJDZwXel5Hfa//IWzh89bbZvvXIwIJJ1zASHBHjfz
         HU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568930; x=1776173730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgdgMNUKOKJYt+Gxqf2ssPII5esh2nyuFo140mcmnaw=;
        b=SDG8TVz4cHRSz9cO2vk/olaMLTEVwwDr2bV3G82ynEpnXyMlhj5OpAc12F3f1bafEI
         5v5oTdYlIkZHXd0PiVBKYk9D9gFoIkXi49MazANeRt6+mtXYZJYZHY4+wwLCTCBPCZqo
         eto+9rt9J38tI1IjpSkA3ng43IU69UxQ2Bz1/s6jmbNhujth5g8LOA8Qd1Ka4dpkSqql
         eHwbl+MrSq1EQPU2/JovYlYZCxJ92VOpRk8gaJByzNzTTsHi6bKl5WScF1BtCPJdbiQe
         hUv5++T/lHWPQ3ACHSXK1Mza/EwXw1NvyoQ46pTNhlsH5pKigRYReajQ+fz8zziltXu0
         1+sA==
X-Forwarded-Encrypted: i=1; AJvYcCWUe+IQ3z3Su/yJTZUIGKNnDZK/ZFhIQ8OeoC0Zo7xY72f4arf3J/mrnRXUqYChEBKKBm5ULEoK/gk/yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzQvgqDcyvXNx1Pz0c/k14AA//V8kZYHoJTsNSE3TbD9U7HA0
	7hMeODT+hvEhIWSbxCui7wavvrnaTQb+HNCSOTmfzgewOy2nlUlqbgDoQt+d9mJoKUc=
X-Gm-Gg: AeBDiesFZYIQ/wP2sbCTWLQlXszEO4Pud/eAoY5G77k+byGvhR/i089ryW55wodO13D
	iDcDztSfoccKL9oenfivjmZ/XhfoGeebkOT5m3oK/BPmiOTPF640tdEUmx33qfs4qOzBNuvr6wk
	3Lm1HisxWEJpn4x05cOx4dZ9qjcTiyMwGnS6/+cQOM6zVP+9W/0SLlP0+m4eu5mblQCRzXhOxts
	Sz5NCvocJH9FTHfipxcK+SBCnOXD20DTLmA+GwVfbXtU3qWD9YwMft7aACHfOSZ2rnT5yyfRWDN
	GBpxqkeZRgZpHp7BCVUMwRP62HhmWdo6+JQxuxWo0E2UhpfspklRoMweF3JZOw/VmdTzBed3di7
	S2Z+jzM+Dk/NFB3M867b2k/VggnlE2r7pLPvjmUIqswA+GFc+4Chjc66ofKXGuzlZtObTw71ubw
	3FF2Acti0OcNJjr2TQOVcrlyNvQjXZwwyDumFD5/hrYCJixdPBAdRO
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr200858445e9.3.1775568929708;
        Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
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
Subject: [PATCH v3 02/15] dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
Date: Tue,  7 Apr 2026 16:34:54 +0300
Message-ID: <20260407133507.887404-3-claudiu.beznea.uj@bp.renesas.com>
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

Use rz_dmac_disable_hw() instead of open codding it. This unifies the
code and prepares it for the addition of suspend to RAM and cyclic DMA.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 3d383afebecd..12c1163cb6ef 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -873,7 +873,7 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 			channel->index, chstat);
 
 		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			rz_dmac_disable_hw(channel);
 		return;
 	}
 
@@ -1020,7 +1020,7 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	rz_lmdesc_setup(channel, lmdesc);
 
 	/* Initialize register for each channel */
-	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+	rz_dmac_disable_hw(channel);
 
 	channel->vc.desc_free = rz_dmac_virt_desc_free;
 	vchan_init(&channel->vc, &dmac->engine);
-- 
2.43.0

