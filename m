Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386A344057
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907794; cv=none; b=LvOzq6429ssL5vnFLICeEGor1xx2kCn3lEJ+jUTemYxKRrioqn2JJHLjFwp8uopofA8U9FpBnDSME60tqqaknEIBFmbYo+4lxLMNy/PW5KAz4uUpUMm+PJHuOSIITxsPz6mQHtEZSAm0ff9IdASngRJ/WgSUQdEk/LRhR3LJcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907794; c=relaxed/simple;
	bh=QGre1JnMJ7EtNooAlP++jw+4gePWfV/O1V/jrTmI22o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td0Y+zobn+ZYFcVFPkytnY6mGKyYqK3zKyko+bybTA8oAYeo76Cv/pEjfa2roWcxvUJZUySOkB4L8QW8nFwRvtQ8SoCCPQIqcPC9DwCEwhR8Ql9hoJytPdQ6S3MCilkLgEx2GZkKKgArDpI4ay96rgCfMsKVHb9ep21jLjtclcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j7fp2xD1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j7fp2xD1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfb723793so1966217f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907791; x=1776512591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7WML25G5xFq4y3e3IxD4yNlbeDhj8/OemWvzra0+LM=;
        b=j7fp2xD1T53W9ogUMGE9CsyEh2Wvxa5BEDuORsSFSZdijZ4g9e3Y6tM9UpNwqdRhXc
         wb8pUBCjZ+W1hRnsc5iPYBifIdr4uQd5oI5e2qsE48QDHcbBF9ppmv9P77RBPogGpCtC
         ePqFmRpxHR1Om+dU0XS90aBGf0MU17PQ4V1FuGoNtYud1FiVDaPt2A368+OnEvkILUe6
         WhTQrRV5zSNNq6N0QWIe3ulOttp3miqRRsSodLqvQn2O5Wbzt0qPJDq55Qf2bnOZhz1E
         D/kaeS4bcssqYB/l1lpJFlhY+iI3+ca+EPPfY2XLgukpciKYKTmHfigIZXSRFu6qBY/9
         7FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907791; x=1776512591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7WML25G5xFq4y3e3IxD4yNlbeDhj8/OemWvzra0+LM=;
        b=GmFXiz+Dxd4EIMNqFcJl7UEUrkKF1WnekWVBsLIgRtRMRJtYyYhSK/lVxhTGn7UXFa
         lDhivhXc2yptAAIdJgb4qIkn4IYDhmGn8/xqZgJ4IWD2dqd+EdPF8M33aLnXF55vSpYr
         SaTEonKmA0ygbY9wn0MFpnGJUC5RYmVxN/pvhEfSzCllDQsWnezC9YR6KDurzvo3nI2h
         /ix3+dAjx4/xgfa2mxWzgu2AnsUrlEwpfq6QEoFK2i9QgAI9LnsoiH4r/n6NV1s9blMr
         Ben4sW6HJOFy0rUGvrHkOamo6AI6EBj6qzzg0dMe3l9HLh2YkQyhQvQEoXO8OiqUCgfI
         syRg==
X-Forwarded-Encrypted: i=1; AJvYcCXgTHWeGbgu6s+ZYaXHEnh6Prqu66LpckMnwAi3p4G3AK7W3Srn+/ZuhgsbMX129llX+iDQu3zFgRwCOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZx6/C6nKU8WeVKOciQhOQMBFALbEF10hOXdbI3ydk9mnGPqN
	1F/2FNJzQwAFuiI/p2R9Ygm1ukNJyOVFL2ntdGkbIVmxEq/dn50B9Bjp6xCxv6cGTb8=
X-Gm-Gg: AeBDiestiGz93+fe+rnTWMUxEt3Gu/IFF1hBneavjGH8jKLV9OWnk4D2Jv/iidGhY0Q
	pRke+j1FmnK9VCoSe57+Y7en+TH5xaiEaB1k7Tt+EEZ0/skOEF8ipzbLa6C3dZXRlz/y66+IeR+
	jG/nNnloc21OMa0lyp0HuTgaXnRK2o/ebxSt5f58RfsvR5bfPHYDIN3c0JzdAvtyEpas2aR6Ue3
	Z/bu2bFXeu5UtD55ZUyu7bG22TJauwoYxAGJAUJuJsuneIn4nZU7PPcUa9erL3FVDi7pkSBcVZA
	CdXhx1pJ2BEe/TyEkQmDCfpx6iXzDs17ybWLyktPvFOsH9IcAs1eypGRUT3ElXOpRyU/WigkCQf
	r/FP0MKUD/LoKgI9qOx0z8//h/8iuFolGEgiWw7Zx/HGr5Ivqo5w95MHyO7FC7ydsLK6bFy5C3Z
	tcF6J/eN/UNhhvT8d/lBcLLVTI+vDu6GcmEg2jOC5L8vBytfp1rSSA
X-Received: by 2002:a05:6000:2886:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-43d642c77cemr9629206f8f.25.1775907791508;
        Sat, 11 Apr 2026 04:43:11 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:11 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 02/17] dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()
Date: Sat, 11 Apr 2026 14:42:48 +0300
Message-ID: <20260411114303.2814115-3-claudiu.beznea.uj@bp.renesas.com>
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

The list passed as argument to list_first_entry() is expected to be not
empty. Use list_first_entry_or_null() to avoid dereferencing invalid
memory.

Fixes: 21323b118c16 ("dmaengine: sh: rz-dmac: Add device_tx_status() callback")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 9f206a33dcc6..6d80cb668957 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -723,8 +723,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	u32 crla, crtb, i;
 
 	/* Get current processing virtual descriptor */
-	current_desc = list_first_entry(&channel->ld_active,
-					struct rz_dmac_desc, node);
+	current_desc = list_first_entry_or_null(&channel->ld_active,
+						struct rz_dmac_desc, node);
 	if (!current_desc)
 		return 0;
 
-- 
2.43.0

