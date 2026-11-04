Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789328;
	b=TWkvGZ1robcqX/913HMZwfa7pdfbTkTXj3kHGaNQq4BQHmkfFRw9OVrVoso4E3Mjn5N7
	 ZaRcZ+i5WF/mRWqTgnfuEgfdQcyz35pUSteZ29nwcMWbXXNuziI0t9gUP0/dOP1mcmbf7
	 cwW/k5d5FUfoyUaMZLdyLz/ZPDkMT+ymZOiToh9+lOQg0BQJR99dXqC5G6b7fqTOju8RB
	 ZcArkT6gjYKUnKKrvWy3opIWjDEoPayJDkvGtSKUmJ6M57cp9pWxw5P00BjUZGFc/WlDZ
	 fcHz7KcR5s2lI0ZEutSo/weX1cGiwcvg+XCF969MwX4GpIGQnp201f/G5bm+W5LgBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
	b=lEOXA/Y/sgrn5ChBF99n9mQZauwVC3vAn/5AAMWmaG9Dag2G8/SNt6MCNizhK3RdYHOW
	 i8vNi9qbPVOP+tvST9wmskRVQuDsydzTHk0eG4nMHIAM4fmP4EBruktQ97o6T+xKsmwcP
	 jWpNoheKIItAWeLlUCyc/g4DFVCy7bnIwAO4o+9r8w21GG/l0j1zvTCEwIt4i+nYzBty8
	 Q3xJbLhkA4JohePBiJYP5VIBnsr8+tB5hiQUFVVBpuCDBSjzOMhY/oC/DXfNyVqCZ6ouS
	 z4NLjZeIhkuxjy9WuYuTt80N/nn7uBf3uif7KOnAmP8ROB9gUDWafaeRSNPwH0liYxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="XVFARjT/";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D065606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 10:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D065606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XVFARjT/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so320167f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793789326; x=1794394126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=XVFARjT/H9wLsEjRYnPy1ANnD5h8SM/r9beRnFGPeyqSu3TPzFW3EZn9Z9RrtvOvJm
         Nba6QWsAJ4vCslFBJ0/xHTgz+C2BBHtl2VdxlNifeLh2ztuTUMzTG8nckVKE1KZkERGC
         dMlMhS/g7iiVnB3vKbl+AUJfZJkUO1NKXVObWvOGOPBDW8MYiK/dbibWGDqpbALgoC6o
         M3I16C86rb1nHXkuw9MteB1JybBkzemohApabxVxFJ2FajLf5BVeWyaT3XlyiHicX21m
         dXkArf6ni591Snly3rfXk32U/T9OkXrN+RgkscOwyFSaF2qTjBJAoYAb2TeajpYOfanJ
         clZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789326; x=1794394126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=CLqJU7JSxpuCXxy7jqw6RjDzgEqNU9KX/P2Xryo7LVmRKw4HWv5lSxe+EPefkqDcNe
         hM0tFr5u8fjZ4AWj/7rV8UQbVTSfhCWZ4GAWnq02IV7Eq18ln8PLipq/Ba0B+msKo1+s
         +SDg0cX3pr4P3Ea8WDYAFw7hr2zZCQJSu6WBrq6cvzfapa4m9BPULtAr6GuYIpIeStLR
         +pySkh683QoU7+JlwpMWv1DBafKVAVwmmXIkZXZf6UIOX6IUMTVKwPe6FswKztV3hiLQ
         gwXKnMqd2oZ9t68uyxAywfc0obxjFgdVsH1ezMoCVDS7D+gE/jrSGWUrg8jYElJNy9Bz
         wg9A==
X-Gm-Message-State: APuU4Z8QjhHcfKcSd9Kv3AA2jLjfATZkNZukE4/SoqtPXAPbFXjKyY5S
	qdHPQLj2jGykmBqYzFdwQcdlsuuCMQ7/L0czIBsE/oLHmXhkhnqXDfZZ8zKzX66SjH0=
X-Gm-Gg: AYBFou3RZE8RaU5KFkWPfcXfqgIAgoI4aBNNg+aomT2uMYQxDVIp05NCaatKpteLQgl
	mrwmbwnCXEvOfhJCEyM0M1/A6oY/K0cvVXSANq6PGmWU6pfmN7OD2KEi1D4hwMfIie1UGqzRLJ3
	txhtphcAJs3FZ/7hAreg0TzPj8y2xSX0JAbJ9/sIeADydAEUKJuky5e4ccPjMLqDJ7/agT+dSZH
	sFkrPbOweuHassezNZGGWIyP5fcTfcVadlm7RX0JqP79kF9Pfy3lk1oR9R18jxrtlbGZEuuj6GA
	KNxiPAE/DVF2na0K7ots46SabHtijewYYXL2+rWFNf42AH7vS1pKR1fKzIcIVgzY9MGWcaDQ9yQ
	695DrvZ5h+wQCSI5mjrQ9iqsNZ81aq3gFe2V6d3BgdPo8pgwoS8ZJYRmTMTDtc0MVkAlq0J7AZc
	d7SRPRLlpLWA8BMiJKM1ABcaIzOO7kcjZHqh8ZSh6RV7us6qEM0k/kI90RqFj9e9WDuLJpKe8z0
	TZq1mQPWanXro0OzocZnWBBSf1PLgFKjNzwVjbf2rT0rCd2UJcL9MyJc8KzYu08VGRTqQNzcmzU
	+Gw4VFhj+sdb/zyX5wjQqRqNsveJHNkQiiMMKzTmzN9fORUE
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ac180f2addmr415568325e9.32.1793789325659;
        Wed, 04 Nov 2026 02:48:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm136455625e9.2.2026.11.04.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:48:43 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 04 Nov 2026 11:48:35 +0100
Subject: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIIN62oC/yXMSwqDQBBF0a1IjS2oNn7ArQQHpn0xFbQjXRoEc
 e/pJMMzuPcgQ1QYtdlBEW81fYUEl2fkH30YwTokUyFF7ZyUrPPONq5TJSLsJ/RhW/jSODRSohp
 QU0qXiLvuv+21+9u22xN+/b7oPD8+32steAAAAA==
X-Change-ID: 20261104-imx-sgtl5000-cleanup-371e704e5de6
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ioLvTLPQ9whgkMJcbvVWkeDAXZlfFZobCdzIe0dI7xo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvedtyLG/E7rQ9UKBp77CEsZNvw7oJec4JDyW+H73J6
 9v/OHBPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyXoLhD7fllU59pXtZbBOD
 lT4ud685XSI5347ReNq5A1fjTNf+usfwT2NDfkjp8+tNc9Z93pHCG8nwgMk66xf/V4fK3NnJUcw
 P+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The 'codec_clk' is only used in 'probe' to read its rate, which is then
cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding the
clk until 'remove()' serves no purpose.

Release the clock right after reading its rate. This allows turning
'codec_clk' into a local variable, simplifying the probe error path and
dropping the 'remove()' callback, which has nothing left to do.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
While reviewing [1] I realized that the driver could be simplified a bit.
'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
so it can be a local variable there. Also it must be put when no more
used, still in the 'probe()' function.
This allows to remove 'imx_sgtl5000_remove()'.

This patch does not depend on [1] and they are addressing different things.
The two should apply cleanly on 7.4-rc1.

[1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.cn/
---
 sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8bcf54ef709e..032ea3e066bd 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	struct clk *codec_clk;
 	unsigned int clk_frequency;
 };
 
@@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	struct device_node *ssi_np, *codec_np;
 	struct platform_device *ssi_pdev;
 	struct i2c_client *codec_dev;
-	struct imx_sgtl5000_data *data = NULL;
+	struct imx_sgtl5000_data *data;
 	struct snd_soc_dai_link_component *comp;
+	struct clk *codec_clk;
 	int int_port, ext_port;
 	int ret;
 
@@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 		goto put_device;
 	}
 
-	data->codec_clk = clk_get(&codec_dev->dev, NULL);
-	if (IS_ERR(data->codec_clk)) {
-		ret = PTR_ERR(data->codec_clk);
+	codec_clk = clk_get(&codec_dev->dev, NULL);
+	if (IS_ERR(codec_clk)) {
+		ret = PTR_ERR(codec_clk);
 		goto put_device;
 	}
 
-	data->clk_frequency = clk_get_rate(data->codec_clk);
+	data->clk_frequency = clk_get_rate(codec_clk);
+	clk_put(codec_clk);
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
@@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 put_device:
 	put_device(&codec_dev->dev);
 fail:
-	if (data && !IS_ERR(data->codec_clk))
-		clk_put(data->codec_clk);
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
 
 	return ret;
 }
 
-static void imx_sgtl5000_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct imx_sgtl5000_data *data = snd_soc_card_get_drvdata(card);
-
-	clk_put(data->codec_clk);
-}
-
 static const struct of_device_id imx_sgtl5000_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ /* sentinel */ }
@@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

