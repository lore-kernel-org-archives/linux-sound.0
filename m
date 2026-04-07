Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030243B8939
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568934; cv=none; b=p7PpEK93wA/maY0sQoSmQIu9aGfVYDT6bBEMc/Vkqj/EFzl5ZZfhtZPPuW/osV9mKtUDybV27i6gAvEg/Jw0p4D9dKFmT9FN9OuYlY3pXu54S5dRtGHH+zKE7nvDFSjYZviyS4134Co8ToAUVEHielW3boRY4G3YUluaK2y1Y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568934; c=relaxed/simple;
	bh=GsHrr3v1WQnQ5DxgbOvb6THwJZZ0B3v3vS+57NzKOOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvC5jw7o+9kWmLLGH9pSslNdw5y03oMpnsTDhlcSUUfgZPafc+cENpanjN8KRs02ZB57j8vQmvL/tXeprOc2sZqbt9DM7Z/icZiqayg3blcEE+H6smSlPmmRYqvvaVENPi63zfR3GlrrUA0hkbpDUvsoSuqPPpNBpkHypxrBZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jMnAS88q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jMnAS88q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso46250065e9.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568931; x=1776173731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzHnoo+7b5dFLN3aUDtXl6ixzTaf+bVpk2UW7fOlKww=;
        b=jMnAS88qmSq6/7+QpGlw2HPv4jD56tR+xneJ9mT8ZdiSyx9K5/kSHt5BJ4FGeg1IYV
         R49RkdgYTSmPLVD6ROllor8Eqd5FCyrwqMZaYpmKKdrY0aCmj9AqsKh0LwL8GF3OHBR4
         7Ko1BS4Ggh2CPrAYTCspJco08PtJHkwdK/YwTyd9XgQHc88Cg7W6LLP7/kAR6Y6qJDuT
         Z5P30t+QnzrB19tysTMbZrMYnujMBNytWwg6jG+lhtAVp9eUMQ25bzaSD9TRba7DGrFv
         I+3cRZXl6C0XJJs7jTATpmWAeoIUqhD6M7w2Nhc0MhaicaMVZOTDYr9ZqxHr0L8I8TxL
         vNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568931; x=1776173731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzHnoo+7b5dFLN3aUDtXl6ixzTaf+bVpk2UW7fOlKww=;
        b=HkcxTD5EH7HlEU77Z7mFLP1y2jMFd1sWckCMFVN+aFPLUS31K49QLnFw1LOJVyGqHE
         3zjFFfoZ95QiFERpQLc49fUmaHW+3YVirKifgcpTpoZsf3GCFzwgTbLuoXvCqGVRALzq
         cK5CkrKO5w7qXBYAwO7uiSUhcxi+2tGep8F2M3McroSbUPJdCSq5xxS0UIhBTWW7Trt6
         UWmbnt+6ez7BPQW5iamKW4qLgX6qoTdpHQj5XsO0xIiNWF3i94GXBV9GcW3DK679fj5O
         4HNGvbNHHJSzb1fyKGoy8SCVj+4c/aDfO7rKvQdLxI8M34SEKvNjwlrMkjyRP7YfbUdW
         SP4g==
X-Forwarded-Encrypted: i=1; AJvYcCX2WfibqxhSLdD+Xf/n216pFryszpSCeSElnbvqjola6yc84ga77Qz9AZNATXKtyJ+IbUPVDBdOKMQsiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bDn1oar3d/q90/l5HV8+UUp4WOnWaEa2Sru81X1hSnOCJp5v
	WQp727KqNWfqV0MwhZjik9r10UbS1BPQYN/+A1H/Ak9AYrvsbOgsw/R8hYxUameaxlE=
X-Gm-Gg: AeBDieurLnJqmpHl21qfjhOOwJiiiquR0LS11XIcJc+mGHzu5yTihT+OfKpMIQRxyox
	0nGipOqyA+NEVWqlA1NOWYCLndfJfaiFhngOhLtlekkFnJ1c0jYQg1Zx4QoXZi3OGh6dASWUjIJ
	pc5zokh1GW9C1sb4MZ/MVoLHdGvlx1U5tLk2CjZ2EsI1zkSieuat5JMoagILvw97VMtQfrbAK4m
	7Of5zHqGEa2i+JW/HIrPzPqXpQjswTpajuERHUc42JbVq8yygnhI/zlNLCeuBiQFOXQWlrfnJEx
	idADdlZqWTW+RdX8sro+c3d/g372j++XmiJ44GDJPtUxKwbHVjjiBauOvSnyYIvrBkRhAcM/0N2
	k1cxEAR488Yn6UnaHYNSft+p+VhDyNcQWAahmSpIcJ2QkYhcZH88Zy4s8DVeYBhfROkqFMR6zke
	ND6U3UGS2c43wirxbE9/PV0sQx9cikI5DcuibRMEP8QWDNUdpuvmp6
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488996f08f5mr261826025e9.9.1775568931434;
        Tue, 07 Apr 2026 06:35:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:30 -0700 (PDT)
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
Subject: [PATCH v3 03/15] dmaengine: sh: rz-dmac: Do not disable the channel on error
Date: Tue,  7 Apr 2026 16:34:55 +0300
Message-ID: <20260407133507.887404-4-claudiu.beznea.uj@bp.renesas.com>
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

Disabling the channel on error is pointless, as if other transfers are
queued, the IRQ thread will be woken up and will execute them anyway by
calling rz_dmac_xfer_desc().

rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets
CHCTRL.SWRST, which clears CHSTAT.DER and CHSTAT.END anyway.

Skip disabling the DMA channel and just log the error instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 12c1163cb6ef..34c00f3ffd4c 100644
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

