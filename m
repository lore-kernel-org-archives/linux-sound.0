Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE5359A7B
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907811; cv=none; b=S4ZeqiozVqUUWXuOShyc85CysSryczfCfSdrysZtav3JQzcNaZfFfrIiKA6ujhoXCjVTEpsVb04Bn3+icRODN/FsYIph8oqzHGzEjyBZZ8r2YGkms0VE4UtLeui05mVpuqslv8n9WdFFBjBIFsmDHusurHzYu6xHbqvm+BNaHOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907811; c=relaxed/simple;
	bh=IW52sWUaqMFEY6BbWKKClK/wbgEBkQeALR5hdqMA95U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtdsanf3T4mX6AtLKPlWIhD6SCtfzkwHsUjr/EzfoAxmofHDiz+shRPMbtaWae5DiQu7keMGmmszYuHjQvymWORh/eIwwPylgzOlsocribcZtTEjc35Y8zLlchvljXsuCmDzW7D36SLdlC7tEbmqcdSmpoBl9HkQP4Ml9pv1k1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MLKtE0J4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MLKtE0J4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1721727f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907808; x=1776512608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zdkb0CAXfpSevM/ivqXKAKRICDyAzezyAIbw20Wd9A=;
        b=MLKtE0J4OBmPZxXaz9RiZvRq2+nnNzXMbYGy2n/ectLDEhjHo+XxPM0s0XkB3bgoxl
         i7N5QlSfHqxhen27HErppclZvCimwOzUem7Y2LcVjnq/185sRvBR/vaeucKJmz6bI/pI
         IlFb/uBzOJQkaeR0MUy7rHiJoKYOjqtQOl4e/RmbL5sIFRIBpnY5R5hZeVp/Rc75TdE+
         HbXItGGWO72c+P5Tc8RnXaJUb+6uaZhQntmBBlXhTjw9+ya+r76Tr6PbpDRq7YBWLgE9
         T5uXW66wI9fKsMgiWfXtFf+AwhZlTMEfZD+gRfOzl/4CuM7Q/MhrpbYdmjzaqV269onT
         BVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907808; x=1776512608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zdkb0CAXfpSevM/ivqXKAKRICDyAzezyAIbw20Wd9A=;
        b=GGezoHBK4ymuoPR43pvNcTeDrjnalpByPBc6Wb2KDLHgmR8goK+c0E1gY1Zcy8fuIT
         nthwB+Oh25axzSnKe6MvOqpwCQgK2C49YU+HInH9GPC9GHb+NNb63mj3BUQ6rZC9xqQT
         7kRuSVroHcJxNRKz5Hy0OizHDU6wncTM1zyTTlBs+hQ+v2Cuhdrn9HW3+bTmPPgI4xJn
         7ZLM65U+goz5+wCflU+tr06N0lNAb+32ZGE9QXDp67PfkFQ/F5ysv8OAEhjsC0t2hKEt
         n6RQPXropsd1neIa/1zGck5BMKWUTLMAlDXj1v511cy5xkpPLACQyjsnWZVvIXSfwNM2
         DONw==
X-Forwarded-Encrypted: i=1; AJvYcCVzKmd9+XR/YYOmEpPeFT2T4vGjl1DYi9MR/rJYoHz4dcIpAkw25HqUeInexNFQABOFS4L91E3WEDGxnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzSU13sp+WN5p+YF88tYkuJ/aT3HfAXQOMZp0zqU7PFyBj8z2
	6g0thI/i/OO+iTrHHsaAtM7hoseHvanrnhfUB923KkBxVMQvQSuCE4zFihtvGXeeZXI=
X-Gm-Gg: AeBDiesLuofmmR+T0AHgMw61/fqxi1it2EO0NgGySVSmZf2TfUtVBng3blxyIdWMc8B
	sUsI16ZGSMZ+dGwrMo9uvWP4LVGeGKuE6sP42rQiCFmUjRfhZgI5rpdkYxWLwgK/8YJIFp9xzJ/
	YPpHbx5eTEjO5rRTQGuT/d/TjvebuVgF5ybOUYHqV+ib8lHFPrmbdJEpJ+DPKjdnhWQtTHG1iGS
	mJGpUqbVfWsliH7jRayGL4yfp/scEPzaEiDVw1kGetjhSthsKetyquxJQsQNotlFyMLPbU+TbxE
	W083CHS20OaXe6iIjr1UgcsG4IW4xYR6eokvtUNplweLPFphx+HBN6/+2zzHyaSxZbqF/Q0nmtB
	Ql3Z4TjCtaOTEuDC+WSN3v+KzT76uNh7RC206sy5mC/P/fRwQnEKpsoWOxqq2+7qPjD5V/h7JZ+
	66qFyF+wp2+c7BjBkc96RVIUfqFe7IFVhvp0xgBy4/SMoBF1OxOEri
X-Received: by 2002:a05:6000:2304:b0:43d:1c3b:2dae with SMTP id ffacd0b85a97d-43d64255160mr9442521f8f.9.1775907808486;
        Sat, 11 Apr 2026 04:43:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:27 -0700 (PDT)
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
Subject: [PATCH v4 12/17] dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN
Date: Sat, 11 Apr 2026 14:42:58 +0300
Message-ID: <20260411114303.2814115-13-claudiu.beznea.uj@bp.renesas.com>
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

The CHCTRL_SETEN bit is explicitly set in rz_dmac_enable_hw(). Updating
struct rz_dmac_chan::chctrl with this bit in
rz_dmac_prepare_desc_for_memcpy() and rz_dmac_prepare_descs_for_slave_sg()
is unnecessary in the current code base. Moreover, it conflicts with the
configuration sequence that will be used for cyclic DMA channels during
suspend to RAM. Cyclic DMA support will be introduced in subsequent
commits.

This is a preparatory commit for cyclic DMA suspend to RAM support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- set channel->chctrl = 0 in rz_dmac_prepare_descs_for_slave_sg()

Changes in v3:
- none

Changes in v2:
- fixed typos in patch title and patch description

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index d009b7607d44..958ee45abc70 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -377,7 +377,7 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
 	rz_dmac_set_dma_req_no(dmac, channel->index, dmac->info->default_dma_req_no);
 
 	channel->chcfg = chcfg;
-	channel->chctrl = CHCTRL_STG | CHCTRL_SETEN;
+	channel->chctrl = CHCTRL_STG;
 }
 
 static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
@@ -428,7 +428,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
 
 	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
 
-	channel->chctrl = CHCTRL_SETEN;
+	channel->chctrl = 0;
 }
 
 static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)
-- 
2.43.0

