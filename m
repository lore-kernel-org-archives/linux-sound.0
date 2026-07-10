Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161F407CDE
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678931; cv=none; b=LYD/9D1A7ygbxYeZA8H2IiZlgjVDH+O20JaLNje47/uaMPi+0cIyJ1qX5SCLz9e+lGMzvzzro8HbhwR86M2Bg0lDMUf02uX2eKVX7tuWX4EyxzbYkryXqbUrACK08Y4eqsgnJJY7MTUmzctVgREDkyk0vHwCo4eJmesenm5V6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678931; c=relaxed/simple;
	bh=0A+xKWEJw2IA5pPYAvSYhbSRxxQoM65GpKdqqKapL+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuOQm1uAooLX30GNrb63rRcX1m7TD5TJVa8wfho5gWRtDyk/wz12FpC76DLW6eed7+IBaOyR1E/rp8UmxjI6QnCBy9X3StG0CQSZGZWZ6176eslF7/8cYU3dckc2CY9bbc+MUtiar6iutT6U1olbCvzjACxwQgQ3NXWWjqns8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFXifyhN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFXifyhN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso790151a91.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678930; x=1784283730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh5hIJ+7O2JY7qrrtymOMkiruUIettb3qb3leyRUg7M=;
        b=SFXifyhNokJMKjkBNTnr0phEIpAVhD8blKsSrDwhwbmhi5c7aNwBMcmz6nZVJTw0qo
         tZI+v4Wimmd9EYVeN3/o+1/QJ7ZxO5m8w/hVSOidIpUz3SXfhbJQv955A2o8wzpvM006
         XnFtW1ubkq6In3cas4f5pamVTqSkdXY0nNfzK6aluLJzB36wqmrKOkHVHCQsBGjGVW1J
         U/9+Untnzpkuhf0u6VFWc2/Z69HSNg9zvJLGge0fe2SIJ5+X8pdhcfJ2th2cbQm63BV2
         sQH8RSlwfHOv8ms1QnfVJ9lEJOMzxJLDBcD/RyIFDTPWoGqNDrkcETOBJPmokslxIqgp
         H2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678930; x=1784283730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oh5hIJ+7O2JY7qrrtymOMkiruUIettb3qb3leyRUg7M=;
        b=U6CbhZtdrKgNDB1+gM7BlFW6AGulxBPc9sixDUhbz1uCxR09ZgKPZ+R/yT5OtyGzE2
         z2pb40MQhL+lS+YSnLweW2EmLUCWJNPHRsHyY1zXXp8gQT6pPgDOx/bIyv9hOumONM7A
         T1pbPQPxsdibugGeqkXLRaKWs4zXCCvPw6VAHG+eYG+C6L7LPp6g/xJUhIrP8FFKBIjQ
         nxu9Um0jx0EIpibL0mrK+ojf3wC15cS2toCQeoHF5EaGz7aQ3z0QfO/Kr23XYIB//2sw
         Oh53npBhSK21pAwLqSr7ZXtyif1rn7ZouRXo5Frnvl/CZ+2vxwKd2xlIrHqarNSM7q5d
         q0eA==
X-Gm-Message-State: AOJu0YxhyRbEOxlMUJmOATTogJRL6euQM+99BA0JcSuE19ThI9haHiFX
	0nCDm8f2ZnKjIxzz4DAmrzI/W0qBah5QkbY1yYx3wVUQ5+UFB0IyzJiu
X-Gm-Gg: AfdE7cm5XPSXar6MnTGkcliD64NOynfQHx8+4rBZYnIWCw6nvsYz+MTVczZJzJlZwfa
	4eUUn+DXw0e1NkS2NaijLXbhY54R7shEOe92HSDrUyFC7KuXuPcURQj3TnwOFUI/xbuhiD/nsWq
	teQyoOcp9Pl5yvPam54rsrylaOKVlDoK86BfblqStuUyoZUC9yhyQWKe3QDw3tInXtCBiR91gLQ
	uaKHh2ZQN3nvU2YK1WHfv9Cq4bFvo+1vXT4QCX2wyloTgnokjzKSjxgmDcw2Zo6dTRv3KM5BTVB
	aGS0rJZZJtdOW5xXvb1XEzM1sZEYVID0SarwLYRhRwojTaHHACBq+KR1dynULQIUFS/6UyGBzGw
	Kbk5I9EZVNSm2eKFpJsiJ/Zc9W4h2M+WRluWLW8NCK89Fz0pnAsfZERm066m6ASvoDCWa5zxqjn
	GWho4JRu3DRwV8RFpinppJUuTym2VNFjpnZvgQWtUWMF/dwFU=
X-Received: by 2002:a17:90b:3b45:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38940731d1bmr11115641a91.15.1783678929613;
        Fri, 10 Jul 2026 03:22:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:38 +0700
Message-ID: <20260710102138.29347-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling where appropriate to
simplify the code and properly handle deferred probe.
Also remove redundant error messages when the called helper already
reports failures, returning the error directly to avoid duplicate
logging.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Adjust line wrapping.


 sound/soc/xilinx/xlnx_spdif.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index deb7225c1b4b..ae05818ba064 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -249,21 +249,18 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
-	if (IS_ERR(ctx->axi_clk)) {
-		ret = PTR_ERR(ctx->axi_clk);
-		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->axi_clk),
+				     "failed to get s_axi_aclk\n");
 
 	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
 	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
-	if (ret < 0) {
-		dev_err(dev, "cannot get SPDIF mode\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
+
 	if (ctx->mode) {
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
@@ -282,19 +279,15 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	}
 
 	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
-	if (ret < 0) {
-		dev_err(dev, "cannot get aud_clk_i value\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
 
 	dev_set_drvdata(dev, ctx);
 
 	ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
 					      dai_drv, 1);
-	if (ret) {
-		dev_err(dev, "SPDIF component registration failed\n");
+	if (ret)
 		return ret;
-	}
 
 	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
 	dev_info(dev, "%s DAI registered\n", dai_drv->name);
-- 
2.43.0

