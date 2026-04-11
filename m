Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34711345724
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907797; cv=none; b=CPK8WOYk5GPGiTRFv4Po5v51fiq/nefZuLkop1ZLBQQHPuv3L+V0i3UDcy90TWm98pMUCnWgGTR8OwYxEnEEalblCPQPMJMmGVBUWjiOP7a5bgdwntJRdgqBpsPEThHRoiBN5duyu/UuLSEvp8Pi6xWfpcYs0pNcYXCRqOhOPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907797; c=relaxed/simple;
	bh=gmR2MVgWRVwxG2GLS1GQZ1Ib/I0giv+IntwWqRZ8pCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXpf8z9YIDoBf1faF/OFHz/E3Vw2Tx9HPkr/M5A2oFe3pyBtxyBEvpaWS2v1KHCLeecpyXnWd2r7vEsY3iucZyNQ9KE+Q6WtcVS0c5AqzcdSpqa4i5k9KTMksI8GHWRV/gXrZRljo21WYnSSBHfAuVgDoye0tAh7MrEB/9C6UZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LWK5zAMA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LWK5zAMA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so1906424f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907795; x=1776512595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEklTJzShDhVfSMVqbktdCdKI5vT2XbfZJslRpJnIVQ=;
        b=LWK5zAMAs5Qrl1Q/JOXtiW2AyxCvqFKJHYeCsBZ2SPR/cN2cMKxQ80H+jKARE6Cx3F
         Ni8HLEOvVriHKK7lCRP7CXIEFtHD17VPnuQvGYajQOtRgtwVDtU6m4af8ffmRt8EyjRk
         FMFYNFNM3WYUAm7fFe4rEJQS/P9s7KAI4bjfzxXriAhK5EZhtUvzwXY5rZFUzfo3MQkG
         7255XWamcLGLD/ykQFcaQ5dS29M2cnkhFpRjjedzK7l0Y6LElbZDFDt762qZrVLf54oL
         R4GTYMKVsH7W6qtxwx8OlxjzjVD7umaqLRgRICDgNqGIg/VGdTUDb9YEsEyZdwpAnSM+
         RbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907795; x=1776512595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEklTJzShDhVfSMVqbktdCdKI5vT2XbfZJslRpJnIVQ=;
        b=in4J+NPh7oJzQRJmDiciBNgdoLnvsgiV2naazF4KWA4MSRA7o4YVbf/nm32GCIxpTj
         VcSDxwxAdUGDw1f30jaGQJYCrScuQkdhpOYW1P/5dVFr6eDq5M82ccHaJaLGHECePlbe
         XYDCSV8VllmspWIzDqLpLeQuU7OMO8fE1gQcqj9eNegWzENkbuEWegXfuacYapfa8jaC
         yfpDW/JLtC6b6TeMzy8HWF5xg6iIF/uLb78Bq2aKDdBY1wLuYYzo/6vQZg+rBZ1UKRDm
         9Ld0lVZJSv4MViEbYlg2JNNEF5RWpiVQJHmwXUEMIiFjQeozbGJtbG6ae1wD1Vbl2YAd
         FufA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ENqg0sZh1XiwNb8Zp8NeixOMA7O4/SN85eK4kI+nHTU67Ufctmuq//h83gBnoRoCj4RHt1Of9VO7/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmMs/O0BWP6wdFvEM954jtZMwFQSGf9+1i7wpDbsmll/CcSdI
	6dImuXgXi5ynSSUNcIo4ycDha7O1jyoK5fXSxyFOf2dxfHjTORDNKtMiw5JKAnOYcc0=
X-Gm-Gg: AeBDietfJ/KZuXrpitqzSWxVkRo1wYj5E9sdxSiH/C1jZeiXuVrYGQ7r5xfzm9eLXMT
	fIQ9EcQf2cB//sMIvspY4OqGPPkcOfruZDhkupA4FRvJUVKrExzczTwMpNrQz53kN06hLhK7YX4
	lZ1DaZlvUuM7iDStpWjfT0jdjq7LkEJQ4aq4mo2TICtLzMfyhkZXFBVrNQWE8g2bnpDo17SMOip
	OSX6NbXTc8stiVVMlfKRu0x5C2/kqTP3qOg+sAc4esKHrHNT5BQ8KQDkbTcSz0mgoakfvsRcAA6
	CWGX6VM4OCNS4tPUbCL3i2yJD5KnorkYtCeC3uTo+8mkz1vEVAywlOfp9wvBQ+j3S/p3wxEXU8c
	lj0sbjRG/euaBJqa2xFYO31s+KutbOk+1GXDeAHhRRlsLgI1aJKauDW2PEt97JaWda3CXEe7SBF
	SThikdsbksC0gYmRLzLGN8pPcGT/X01vcwTy/0hbFROE8VC63enO7o
X-Received: by 2002:a05:6000:208a:b0:43d:1df6:ea9 with SMTP id ffacd0b85a97d-43d642c0938mr8925884f8f.40.1775907794662;
        Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
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
Subject: [PATCH v4 04/17] dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
Date: Sat, 11 Apr 2026 14:42:50 +0300
Message-ID: <20260411114303.2814115-5-claudiu.beznea.uj@bp.renesas.com>
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

Use rz_dmac_disable_hw() instead of open codding it. This unifies the
code and prepares it for the addition of suspend to RAM and cyclic DMA.

The rz_dmac_disable_hw() from rz_dmac_chan_probe() was moved after
vchan_init() as it initializes the channel->vc.chan.device used in
rz_dmac_disable_hw().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- in rz_dmac_chan_probe(): moved rz_dmac_disable_hw() after the
  vchan_init(&channel->vc, &dmac->engine) call as this is the one which
  initializes data structures used by the debug code from
  rz_dmac_disable_hw(); updated the patch description to reflect this
 
Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1717b407ab9e..40ddf534c094 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -873,7 +873,7 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 			channel->index, chstat);
 
 		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			rz_dmac_disable_hw(channel);
 		return;
 	}
 
@@ -1000,15 +1000,15 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	}
 	rz_lmdesc_setup(channel, lmdesc);
 
-	/* Initialize register for each channel */
-	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
-
 	channel->vc.desc_free = rz_dmac_virt_desc_free;
 	vchan_init(&channel->vc, &dmac->engine);
 	INIT_LIST_HEAD(&channel->ld_queue);
 	INIT_LIST_HEAD(&channel->ld_free);
 	INIT_LIST_HEAD(&channel->ld_active);
 
+	/* Initialize register for each channel */
+	rz_dmac_disable_hw(channel);
+
 	/* Request the channel interrupt. */
 	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
 	irq = platform_get_irq_byname(pdev, pdev_irqname);
-- 
2.43.0

