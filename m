Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31032361669;
	Tue, 27 Jan 2026 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530138; cv=none; b=pyzdsGn3BzXTHAkHxaIUa4Gi8IaW2YRnywcZ4ZY6aYBQcHHpxx5dXPZYG7jY+cE3Y29YPtV05+DHvlKnL2MkIZm7mLWoT3kbOaQsaR98N+2I+wG+Mhn0KbEd/XgKcjQSdhPTFL8jT7KB5XTWCNiO8qJw0OPTA9bJ4PNrFgdl4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530138; c=relaxed/simple;
	bh=a7chRUmXSxGtQoJKcymf1nEhKZUkHOKYGlejPfcNTMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Icq0+AxATBpsFR1qrpyPzaLcKJQzF0Ff/W0V+jwnjhTY3x+OtaxcFWVKD1mpk51duE5pdRcMKQvlU6Hd8Z6OXwZGW8DI5agZHWIET+/igyY5dfCyNyjdsCY/ijsRgGJ7pxEIEjMIKZ3pKv1ebS0AMU4w+X6306GKXZsYBF8UIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o+fNHbA0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o+fNHbA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530134;
	bh=a7chRUmXSxGtQoJKcymf1nEhKZUkHOKYGlejPfcNTMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o+fNHbA0OlmPbae2D8RGX96cJ/8F62ii+jNgUp2+A5YIL3AdADiUgFcYE7i5jlCEc
	 tFJq5uUIVP77SKNCZw5sLFJF1tcqFztPK8pZf4B7+DpeA/m7Tp1TsgCyko7UBITRyP
	 Zh5//tAb6AN2xSh7YmGMhsRKRvXS2ZHf1722yJRRW02aJPX/tzEiIFI1etuBegDYhK
	 xXU/7kW8ZMtCcWABxdCUJjvAa8M0OSbGxDfeWjgdHwE0JD49WLPUKkh2X4n+N3MXNj
	 cFs27STzHpgFPoNsqx9oqlt6rOhA26IvloTUqmE7Jzk5hiYlxactl8RVsbHvzwOvZu
	 X+gdEOcaWGkjQ==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78D6017E368F;
	Tue, 27 Jan 2026 17:08:54 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 37734480055; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:24 +0100
Subject: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=a7chRUmXSxGtQoJKcymf1nEhKZUkHOKYGlejPfcNTMw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xDifjfW9AsZhzCw+KRI3+ll6d8qvIFis
 2pf4FH4CJNCk4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qalc8P/A/cDBmcLWTLa4wHVXwxS4u9xSrRwkNSkW0PRESSEBOUv+At0WVQq+UhyeoOZ6i93Ib
 ZbmG3cdAjosMhtTqx7TXhrqKzAL1KOeyRTTle0tQ683bfWsLk+j2nx0E4rYK/F7kNkbSQXBFNvU
 oj3LPkIn7JMiTtLHjXvgwR/8otKXM4by7An9dDDp7qNzeQI3XQfXTlFn5Osv//3n4nBMfp7wOj+
 zX5gXMgP9PJWiRqQU9vh7lZGHu2QHH8z9Tod2b30ZkEyo/o5Fk2+dlmph+2S5vIXEU3n5Aom+vx
 AsWojqYqvMfAvS0BhAJf7v6Un0ZI1C3yBdeBexmrTPnCGeA4ZsOfz3CHqlS9b7x3BGtLxLGlT93
 /fGkfl2xFu6P+YvUHhXLVjYtDndN83nCsc8p66nmjsWo+jpcJ7uIlnjgyjYgQ9HL6fsIu21FtLZ
 sFwuJAaFDt5UkCaJ22A1aklx1wD4bY0bl9JpREH4eYMWobws2WZDryz9LPEEIfjfx2nT+L/Y+0b
 s8vZoXlZGajenTMvhrhJlYy6AkkkBhh21hwnPQaeK32hJNGIy6qe3lATVnKVJuYrriF4GKKmCVf
 N6Tny3ubuJpSnt9WaZTAob69MW9sv9jqNQ/YLIVXx01gt2qRB4FHkAS++QBYT2xeEN5Lpv6E8Vn
 q9ChSqjRcxpSo72z/p+s47w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup the probe routine a little bit by using dev_err_probe
instead of dev_err.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 841ef499ed7f..20ed64c1fa42 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -279,11 +279,9 @@ static int rk_spdif_probe(struct platform_device *pdev)
 		struct regmap *grf;
 
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-		if (IS_ERR(grf)) {
-			dev_err(&pdev->dev,
+		if (IS_ERR(grf))
+			return dev_err_probe(&pdev->dev, PTR_ERR(grf),
 				"rockchip_spdif missing 'rockchip,grf'\n");
-			return PTR_ERR(grf);
-		}
 
 		/* Select the 8 channel SPDIF solution on RK3288 as
 		 * the 2 channel one does not appear to work
@@ -334,16 +332,12 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
 
 	return 0;
 }

-- 
2.51.0

