Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0F34845C
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907799; cv=none; b=LVgiyWwbWRidul7qQAvwaOchv1bYq6a6ADeMyV9QdfkUuNa1NsCM4Lnlo5mpwMEMz0g9Nh4a++iQCjKPEZcCGD3d5SieBK1Qg5wp+RVItwVwRucuHjDbFcB26Cs0iOvpys9XVwQPruoakAsU4fwOa7lckz+YVTQ290DprBmMRHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907799; c=relaxed/simple;
	bh=FswV1zMeTY8mzOC5mjgtkEA10SnivHgCzyn5u3OdJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ye0cNo/gVjLostw6ykxrPS3iBDSmc0KUVQTCeNngrUVUplOk/lLwQObTaM/tbE0NfCsoR78xXDTkZAZCJgX1A2M+7JAmPe8B2pCyohf34rTy1DYUjg1zJN6lrj8RWh98/QRglWoQujPZGssTz5WzvqJF8d69HtayFpRbuU+dQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ld2ZFpE4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ld2ZFpE4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfbd17589so1916473f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907796; x=1776512596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCFzuE61zyUmhYiJf5OgZu1cO7csJ6djKP2u11HWSmA=;
        b=ld2ZFpE4uncheIVERSHKOhXIRdBq4yjwrpLJj2XQt8Ji5hZDw0Zr83nHwaGArpiIfy
         jFy4kRt+36wjatPI4mYL6u0NBWa9vCCw64BI7T3cpZxQp5mWbsB8U4wmdHT1PRgNCEfd
         b3Gg5Wgm0QzBRnoygAQeNJanEuByJO1EyywBC/o0vAuE0MDhGLxYL3KJUp+9TIKCNwcY
         mU0ycjpu9fwBgW2PCV/OhM5bU31usxQ3a1qYiYbnc//wEf3rl1Iz/vMiCqSow/8/D/8E
         9xQ2fWACX4lH59mSB/SjljTOs2/Aw5olXhbAkr7sz0U9kFF8kgtTwaqA9F4ippFfukcW
         cJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907796; x=1776512596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCFzuE61zyUmhYiJf5OgZu1cO7csJ6djKP2u11HWSmA=;
        b=AaVwlBYy+LQbQoFSNroPV9+ZW5tSYgs8wNChowF2QTrnbzVlGamSSTCPIC1N1R4D+Q
         LRJypPWQUpdr0BWvPmdXKLMbEvMNw0URlJMuhlsmTNDFiQCNGM5epAxrrWoQmVoIHbUI
         zVoO92kZvVgc1i2q4AbMM3bSu4KeYxtkRCiB+d9/BhvCI8TKexbBhmWzKf4m6ER+2JGr
         ZhvTO5EAIOUhKNA33DyouqaUqqxYexanv61sD9gJdIOx/CpHBqM/xsPPBdrX7XK6wDzz
         2Qf0/Hb5kHreq83hxDxxnWP/iXFygZinTcNs6x9Xvxlj8wJr/EV1is0yoNj8e5EKl6Hs
         SHEA==
X-Forwarded-Encrypted: i=1; AJvYcCUnuSCA3XmNtxZrhGcqidE1YCAbJF9Pnoq5E84cNH9jWuxYqYNZOk9ICXc1/mLnxdhAF3hNH7t63QC7mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLIdPMF3mkP2tu4wt0izJqS7HtPI+FeU+fKYq3CWIX6ACXx7L4
	ZL8ab9uR4v2JmWVwWQpyIwq7KQRQi9HLR8E1kSowt55j2Smlt8xGjiYR/59FWMFWS7U=
X-Gm-Gg: AeBDieuHHIUtM+Pln/AsTMrt8ngeFE8QK+GFLIhmZ1KQJ5cak5WZ3Ylvtz08GEJ2Q4m
	Z3YHqMvnGpe+63aiUV/GIbOEpyueCL4L9GOWkPHA6S7teC7WGelgMcIqc+k7i39vt7LfYJGRLyi
	Fd1aZg8FB3A7fETbmrgU4u+uqBmEtaEDCNONWYTPZ7W58gUGpuvpk7TzXks7wR5QN0wbAhntKwN
	961/pe/JFyFGls3UkEByKAM5dy48QZeDVLubPDXUN+ujINvjCRzVJuMFry3SRUhB22L4VeWUytB
	i0DjE0JQdZX9cKBn+q9oivoOHXfbS+T4RSvP2fqYhkGZxa4U6zg6rrehTQXxqypyr6+5vSUpm5t
	xdEBMmmC1GuunlhXPCADBzM0W+l3LXVaIuotOyi1/HOkFqoenh6n1mjHOBBFFtUjljxNOpq03oE
	KWTL4gYLM05FpnyTkFQOdindT2QEQAqsAOLhX5HFrc0ixwL/zGuZYQ
X-Received: by 2002:a05:6000:26c4:b0:439:ac6b:dd38 with SMTP id ffacd0b85a97d-43d642ab99bmr9178051f8f.31.1775907796358;
        Sat, 11 Apr 2026 04:43:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:15 -0700 (PDT)
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
Subject: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the channel on error
Date: Sat, 11 Apr 2026 14:42:51 +0300
Message-ID: <20260411114303.2814115-6-claudiu.beznea.uj@bp.renesas.com>
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

Disabling the channel on error is pointless, as if other transfers are
queued, the IRQ thread will be woken up and will execute them anyway by
calling rz_dmac_xfer_desc().

rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets
CHCTRL.SWRST, which clears CHSTAT.DER and CHSTAT.END anyway.

Skip disabling the DMA channel and just log the error instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 40ddf534c094..943c005f52bd 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -871,10 +871,6 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 	if (chstat & CHSTAT_ER) {
 		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
 			channel->index, chstat);
-
-		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_disable_hw(channel);
-		return;
 	}
 
 	/*
-- 
2.43.0

