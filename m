Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC2413D8F
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405270; cv=none; b=fUGYKriItcRDLeG3WlS5Gc0lMfbkv3JTYl90W0RrL0C/qFi3+iyjDzz1ONIaL3jIz6JbyCQTff3ZrHzrMgPdsJzIRt1XtxF4Twv9rdBuLWRG9hcTkTAA7oL1G0e7MRK2W7ydLhJzcKLLyamxuCjS3ngOZpKVix22gqlePVz8efA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405270; c=relaxed/simple;
	bh=CjWy+VFJ/mSVpZJS1K2hYuVdGmocTdARaAeyKji3DeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm531aza55IQFxaoVBtdyxm1LjhNdFT7iP8xgL4E7+LSDPU3/B4yLrUHiiVAP1j6H15VGVCjAAa+e5BdADrDU/Y80rOOMFEdGdA3vVrDPHZIwerPG4hHhdhJ5NztI5Mkq0Kxs/nwFBvPqnfgrQgv08UU09SLXrMuXuXUYgR99aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxqs726Y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxqs726Y"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so22262825ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405268; x=1786010068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3VNpp8ClPo6AnXMJ0J/Ta7/7bcyxXekXb7MDChT7CY=;
        b=Rxqs726Yojpj1qyGM21q9p7MR7i9TlXu8orJfyCM3bBw20hoLHCGImEsBeUy9EfCgk
         WcVJZRUsKG4828iOdlrbtPLYTYlGHt9PQSZbxcrGTrbcZGRJGa0whJmuX92H1FRkBDaw
         4ZNt4ReQ3dQymwMIacUKZHuBajp2euQIMccHHG/KW8rK57SHE2WUbaWsjlmjAVMM5ZPU
         aGxN37va9hdk2WuQNZ3/tB7d+YHbFi3NM4JaDnzY0nLDganWlcg5D2weQz2WFHLZDmZN
         MC1Yd2DzN0lfEOwmXCkSPSUJpeV4b+hlcbFL/bgamzS3xMuDCcbto2FPrMQNLbl8z0vg
         Yv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405268; x=1786010068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3VNpp8ClPo6AnXMJ0J/Ta7/7bcyxXekXb7MDChT7CY=;
        b=PMMovQO7y2eo8QS++eby67/YCXFO7yGWK4el1WlZ4NV/CjAbvP7dsWojhiEggrqvL6
         pQOaxOzIWUF1/2Lfhh8zguFTBytEfhBra67iD6U9Nr7i177Qp7i+B2cPtWydLCrLk4fZ
         2D5xLJYdtcE2uh+YzdvCQWcOvwXLR1kn/9RBrwK92c7nvW+5I3eRFVZ4FPIdXxNBa30Q
         N4ZD3Os3C+sloGqRQaqqhaUVe1932cXViLrhKKgzFo3zs+UZq97x2e/y9hAYmMDArY5R
         NMwlwaeGwCYBZAgwIyNtGMi0MaTOLSjK8Q3IiOgteMy6MeQUpLMs/34vXuW9BXWGl1jy
         bvGQ==
X-Gm-Message-State: AOJu0Yzrj6eR21JZcMsn8Mx9irrhYRsbjMXQ00wmIxji8xTMUsS6vYsZ
	N1cUZNA9JwhkAKVOYwg2NIgoPaSnN5wHP7JNW1c8hwf/qxVeUBgHxEQSptBRIw==
X-Gm-Gg: AR+sD11YVMDObudddnEmXbfdfoELf+3PnbqmbwfmFpJG0EORspO0PjPd4BumIRb3VAp
	7oQ3ZgS51VeWnX+MskfDnEpEYKAunZ0+3HmryAXo0ex30m8lpYFCR59rken297XqKDee1KGRim/
	7Ukr5UL3DFaMRrW6rZ0tZzJWNCK6WVG6FXnN/nNP5K2TuB9rhRWa0FAG/HGl2B8lUJS8EYqltvJ
	/iOBW74pMNBZ8t15omTtw2DWpArWmPeQeeBA2WhcdBNVcNci060x+zFRc+xFJD6INXafKOaM7Ph
	43bZbDhzzpvLS7kJf1OORFahc4FHXYBc5C3ibymajAvBnoAhMVmr3eEZvsBcXqxpZgLTJRJZv/E
	PB7qtwo3Kea5Nlz97UpyLBsgfDMnoUhGtyrPqSzOpYT9DRBu5CvMOfpTzmGHz/zVv4O58xpQz3g
	ZGLODZW/qewNiS151Tw+/3TtL9wRh2B6DzJX/EA1iluGnnmkBDFWvsZSmbiUEjGS31ZZAWZHiaH
	1cNy68G9bZ/0QQ1Tjl5s6S6hC1uMbOPet60tz+xgclZV7cvTBHmiBtqldZJtufo9/biTiJbDa2C
	t7srSv+GFcF4Re4=
X-Received: by 2002:a17:903:3d0d:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2d035d1a63cmr18235805ad.28.1785405268135;
        Thu, 30 Jul 2026 02:54:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm23982345ad.72.2026.07.30.02.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Tim Bird <tim.bird@sony.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: spear: spdif_in: Drop redundant error messages
Date: Thu, 30 Jul 2026 16:54:04 +0700
Message-ID: <20260730095407.33894-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730095407.33894-1-phucduc.bui@gmail.com>
References: <20260730095407.33894-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spear/spdif_in.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index b31b120a85de..bbe016ed030e 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -218,10 +218,8 @@ static int spdif_in_probe(struct platform_device *pdev)
 
 	host->io_base = io_base;
 	host->irq = platform_get_irq(pdev, 0);
-	if (host->irq < 0) {
-		dev_warn(&pdev->dev, "failed to get IRQ: %d\n", host->irq);
+	if (host->irq < 0)
 		return host->irq;
-	}
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))
@@ -243,10 +241,8 @@ static int spdif_in_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, host->irq, spdif_in_irq, 0,
 			"spdif-in", host);
-	if (ret) {
-		dev_warn(&pdev->dev, "request_irq failed\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &spdif_in_component,
 					      &spdif_in_dai, 1);
-- 
2.43.0

