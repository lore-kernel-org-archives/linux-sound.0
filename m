Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8163E8354
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109356; cv=none; b=eSVnbwOTb98vxCnT9YghowXEPUnA3Egei4OUMdd9feo2rmiLWeX7NmWYncZsXQmFpvc9uh7I0A8FaIO8E3ttS9UCrYv7oe7oSPctIPLWiCkh1KT6f2sYd1OZgMxsrq3L+MvlbI4MSglTleT48JA0mnbKJN+aHAR/J08UIqrX4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109356; c=relaxed/simple;
	bh=k83hZbTKuOl//PgUx5fOIdMW+RR7uZ50uJTt+Avj9Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsmV/S6pxLD9gW5cQyev6c0B5e6VGCUQpMV8lBiosEhu2qLAzwff1ktZQB6RD4gCEc5U2hDHWgdz5mA3VHr4PUkwkJ7dVSoAhVFFdrAy2uJprgVA1/IZkceYuf1Y9U5q/reAWjCVTOuYONil8gvST+fM3Bv6D3Kh9X+schSMjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4uJBUmN; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4uJBUmN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca913a601fbso3684641a12.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109355; x=1784714155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BpJzZu2JI6YrdHbblIuBNywzFxSYtVh1mg+KZtTDf0=;
        b=X4uJBUmNMXD3iuHG0quhAYPzFJCDozpxfH+PNt5XCLxgIRAknzY03QX9jV2hBjMr68
         gH7JpdAxU9DqNIgwPQBr3GcTQRPtLkc9gvaudwgwZrurm35vI9dBNW2POKWEY4fRuit7
         mhMSYTJvzYaRwEGCb2gpdfTOGUayZQET42SDUZ8srTo+hp/ExM6aeNHgrxsK2qYykk5t
         4tIRPNuxALtu5sY0Mrce2Ab1O1zoDH0LKd1JqVoN4GfBG+cLfp/EOK6EfnATvVfGwFeR
         BN0oC9c+LXmTc78zL9kckl7jqH+6rK+R85sedN+Y1JC+KzITVv2MuoY7KD9JpH1aswkZ
         cctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109355; x=1784714155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BpJzZu2JI6YrdHbblIuBNywzFxSYtVh1mg+KZtTDf0=;
        b=TWwuKbVh6BkUdY4s9voZdYQa7YOvRAeUD9WytGv00aBZQCpjgTXJFAnapKZkVw39nE
         4dsxdVEM/ekSUSzYiFxYhSFWHvrATpn+ADTmVIbUVRhhAdrzZQlK7pwev+cv4bX4RapP
         ZZqo1EpSqqGd/2mk52e7YzKCmWoAqEDcY0fY6lthTqMS/9orw1+VztKFIBjsF4b083jq
         io/gbwTt7TTvRAMGCxovr3bn/UZYJQgMEKrydaAEWZLg51UCP0Wgjo9HLyvrIDaNE5xE
         rLn8X3laxfLohkit+L9EDIMjhbpHmGJ/qKQpIU0r/tW1Y1qxXbdO8LjoCoXNNx1SEnid
         qtkw==
X-Forwarded-Encrypted: i=1; AHgh+RoQIIMAgQhDEDq/29JSeSJx+FjIgswDt1HQL8Dt7mFFoIcF/NgBl7OxNBWRkbB2uEsvDrZexUJi+q78UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMpg48FEkSvUHqzPNIey/pxjyVuoqODtxCM/k+VH2WcMh/GOQA
	nJcm70HDkZsDxnAcv93V2dw9LGIai0sjtys+Nkufe9B7XSoX/ZUup7M6
X-Gm-Gg: AfdE7ckq4Ju2ck9oBoUNkGmf81I/RH3H2/OYB931EKSlZJPjGFVf56+qHo3yiSasivh
	T/J4YLmmqzF7OCVM+bOCDlvBhccloX4Wuce69+aLt2yYJQyqT3W6tPFaaJu3V+k5zQj9EbBq+SK
	Qz/lPV5rIOYtjLi5dzEpXvkxRvp0gdA+qGSaeTdfThFbfDx+PJsKNq+EfhqRBwB2g9fSLoxXgwK
	rQW5wa58Vq9tCoBGgsb84zibf9sk8okB17Yt+95ogRPvio9Gs6Bkxps6QKkq1R8ZWkAxLjImwyV
	2YU6NnouE6X+gYkDh26w38YsX3wCROt6MoEfnJwnYnqKEbfHEtDJ3Lh388aBS/TE8x1hRAZiSuz
	fan9ppN7IY+i0Uzs+7uO/xbBcQry316tXgc55ToPcP/RXtHEcp8z2ym6dqr+FFDQ70oyWRN1I4O
	V0IS1AQOHzyK42h5vDWh7OvuJNNKaicCPSxjUgVhaBxyjHluc=
X-Received: by 2002:a05:6a20:3d8b:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c357553dfcmr7448713637.44.1784109354620;
        Wed, 15 Jul 2026 02:55:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:55:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:20 +0700
Message-ID: <20260715095525.40668-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 70 ++++++++++++++---------------------
 1 file changed, 28 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f4e22af594fa..05308df3ae5b 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2316,67 +2316,54 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	scodec->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       quirks->regmap_config);
-	if (IS_ERR(scodec->regmap)) {
-		dev_err(&pdev->dev, "Failed to create our regmap\n");
-		return PTR_ERR(scodec->regmap);
-	}
+	if (IS_ERR(scodec->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->regmap),
+				     "Failed to create our regmap\n");
 
 	/* Get the clocks from the DT */
 	scodec->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
-	if (IS_ERR(scodec->clk_apb)) {
-		dev_err(&pdev->dev, "Failed to get the APB clock\n");
-		return PTR_ERR(scodec->clk_apb);
-	}
+	if (IS_ERR(scodec->clk_apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->clk_apb),
+				     "Failed to get the APB clock\n");
 
 	scodec->clk_module = devm_clk_get(&pdev->dev, "codec");
-	if (IS_ERR(scodec->clk_module)) {
-		dev_err(&pdev->dev, "Failed to get the module clock\n");
-		return PTR_ERR(scodec->clk_module);
-	}
+	if (IS_ERR(scodec->clk_module))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->clk_module),
+				     "Failed to get the module clock\n");
 
 	if (quirks->has_reset) {
 		scodec->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
-		if (IS_ERR(scodec->rst)) {
-			dev_err(&pdev->dev, "Failed to get reset control\n");
-			return PTR_ERR(scodec->rst);
-		}
+		if (IS_ERR(scodec->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(scodec->rst),
+					     "Failed to get reset control\n");
 	}
 
 	scodec->gpio_pa = devm_gpiod_get_optional(&pdev->dev, "allwinner,pa",
 						  GPIOD_OUT_LOW);
-	if (IS_ERR(scodec->gpio_pa)) {
-		ret = PTR_ERR(scodec->gpio_pa);
-		dev_err_probe(&pdev->dev, ret, "Failed to get pa gpio\n");
-		return ret;
-	}
+	if (IS_ERR(scodec->gpio_pa))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->gpio_pa),
+				     "Failed to get pa gpio\n");
+
 
 	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "hp-det", GPIOD_IN);
-	if (IS_ERR(scodec->gpio_hp)) {
-		ret = PTR_ERR(scodec->gpio_hp);
-		dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio\n");
-		return ret;
-	}
+	if (IS_ERR(scodec->gpio_hp))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->gpio_hp),
+				     "Failed to get hp-det gpio\n");
 
 	/* reg_field setup */
 	scodec->reg_adc_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
 							quirks->reg_adc_fifoc);
-	if (IS_ERR(scodec->reg_adc_fifoc)) {
-		ret = PTR_ERR(scodec->reg_adc_fifoc);
-		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(scodec->reg_adc_fifoc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_adc_fifoc),
+				     "Failed to create regmap fields\n");
 
 	scodec->reg_dac_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
 							quirks->reg_dac_fifoc);
-	if (IS_ERR(scodec->reg_dac_fifoc)) {
-		ret = PTR_ERR(scodec->reg_dac_fifoc);
-		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(scodec->reg_dac_fifoc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_dac_fifoc),
+				     "Failed to create regmap fields\n");
 
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
@@ -2422,10 +2409,9 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, scodec);
 
 	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register our card\n");
 
 	return 0;
 }
-- 
2.43.0

