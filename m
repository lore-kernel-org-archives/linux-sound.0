Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166337E30F
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409268; cv=none; b=aEL0fDGhH/87gcksaJC7KgynORF1xpdA/Im8s4eLmtZoTRln62nq7OKYaGVzU7IKQ6ADUYXuJxTqsNn72ifnPXcB6K8d/aepptDprqI4BIMSdXy4d9ea/MGqf9oMqjUNz9ld13ox8MgDDcB9joXxcJkzCdrBqwMSt1EHqpzibd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409268; c=relaxed/simple;
	bh=Ee6csCFuJ7OyP4zRXUsk4xv4MxFegFSbv4TGQOLft70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kEQEfFQDdstSrnIALRvLsad6dafgdQdev/ijsEMlrEsXcK2qh4rPh+qik+/isNGMBp+csMXEpjaZswbZFGhGTAGvVMXQ5aQv9J31N21uODDLz924C+7foKR8xY2C6wNITzGHUOt2oZhKSCy6lTABx4YEMYeIZEQj3dzkF6qmM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XojILrPC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XojILrPC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad21f437eeso1791335ad.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777409266; x=1778014066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAa2PNw2MA0LtCcMxB82x0dNjRxhDcqLLkFOsUniKRQ=;
        b=XojILrPCE71A8+57gtpmVhPcmrMrX0L8n17xNOpp1N+4dLhx0PGEyU+/tcVlsN63B+
         7IP5FFBfPtJAsroEGBeOh6G//RCIZOdNStufjbmJVxf/HXVkI+o21WZJITcZGWKC7HHM
         QC8YxVbat2tSwm9E/VLgBUPkVfGFcoVwWN5O/75i4mQIifTUpqRGR7oZ9pVO7mI7L7DL
         rDxCaxqjB/uf7mP2dBrmW8BfsBTburJnnQcxzlbEUgzKEj+0MMVGTkxN8128hJntin//
         U9EwEFz02wDrxJEup9LpEU0XKpOS6l9UmCg6hm6oOmrYJyhiIIVRi3HDg+eV7yiXTJG8
         BEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777409266; x=1778014066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAa2PNw2MA0LtCcMxB82x0dNjRxhDcqLLkFOsUniKRQ=;
        b=SJqMWl5CcEBpOM6ZeXWwuxU7HopGBpzTNJDaVT8Md/hth5nQg9DrD6JsMar/x2i6WB
         ijNQOGtRF6SAmUx0KTgYKjZEouOPjis6ccq8LzdriqqehS/UN20exdpzcpmtuOomj54l
         gbXKF0mO/gZChcKeS2S7D1KL0JGrJBAH2zCmiqbAR7GGCsbfXgz8L4o18p9Dh/tl/S2A
         h/MvNrpFED7KiLkM+RIgbU7Uu4if7DqgezjUSk1y/Y+GFMXKegqdmZbwbQPbKGybkC+K
         /Izmm5eXnRKaWEpuDS/cWNY2CeRCdzeMDFAaGWQURt1V00TdxfTshgSYUf7GCpjG0hQ4
         8oIg==
X-Gm-Message-State: AOJu0YzTqVGIwf1EApnh/I7zXYnC67zJ+SA5rrJl20bJ4oAaxlNDjPss
	SQCPl7O8PMHi1oHTiRbtPE/DPWqdyyUtGHPlU63juBsjuK59jMx5pdVA6Rbacg==
X-Gm-Gg: AeBDiestgAy54Vh5NEacO90919h8/VRzmk6/5Ylh8OTJsvWjelFaoDfc38+SH1qSzNx
	FyLpCWx3GSKQ9J1ZQUucKEN5U9xBlSuwOcVzpK8Hana7XISTl1BQRnKOlMD2xLPuUiCuvCoSKt6
	+yFMKxvl7cP7EUAbVgUz79Obn8AQY/YG2nqxRpcCpa4BMfu27eNNUu4RK176ISZK1TYglAnP1Wd
	jYZSLTKZDZZ7ylb+bWSwCpNe3pe9P3+69feaNm/mr5IFWbnWhAAluJlSDOlHnvzS1Qe+z+wBaDO
	oaEf9TtYE0LT5bKnyeDyIUorL1IwlblvkwMr64jx0Yu6YPKlbr7sfNrKJ7kkNJdm/4uyffS58f9
	hNqVyGUnq9bgyOgjzmGawiG1ATw1TPjib82G4A89JCLetgLKC5ym20f3twk9bKEFgF3d2FfkbJT
	9uWYQCN6Aqkqzl13bwU3YJjv8CXWIM9sxkQeBx51zABJ//SSDH1EF70FdhxYm5ijP3PfbLgeOBi
	rl2fVPtVOy69JCgrogii7Ggyw==
X-Received: by 2002:a17:903:2410:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2b9882388cdmr4242925ad.17.1777409266098;
        Tue, 28 Apr 2026 13:47:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f7easm1107525ad.42.2026.04.28.13.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:47:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ASoC: ti: j721e-evm: allocate dai_links with priv
Date: Tue, 28 Apr 2026 13:47:28 -0700
Message-ID: <20260428204728.24103-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations. Simplifies the code
slightly.

Remove open coding of of_device_get_match_data as well as unnecessary
NULL checks. of_device_get_match_data cannot fail. All compatible
entries have a corresponding data section.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: bring back of_device_get_match_data NULL check.
 sound/soc/ti/j721e-evm.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index faa62c1a9b8e..be9c363df361 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -74,7 +74,6 @@ struct j721e_audio_domain {
 struct j721e_priv {
 	struct device *dev;
 	struct snd_soc_card card;
-	struct snd_soc_dai_link *dai_links;
 	struct snd_soc_codec_conf codec_conf[J721E_CODEC_CONF_COUNT];
 	struct snd_interval rate_range;
 	const struct j721e_audio_match_data *match_data;
@@ -84,6 +83,7 @@ struct j721e_priv {
 	struct j721e_audio_domain audio_domains[J721E_AUDIO_DOMAIN_LAST];
 
 	struct mutex mutex;
+	struct snd_soc_dai_link dai_links[];
 };
 
 static const struct snd_soc_dapm_widget j721e_cpb_dapm_widgets[] = {
@@ -844,33 +844,23 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 
 static int j721e_soc_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
+	const struct j721e_audio_match_data *match;
 	struct snd_soc_card *card;
-	const struct of_device_id *match;
 	struct j721e_priv *priv;
 	int link_cnt, conf_cnt, ret, i;
 
-	if (!node) {
-		dev_err(&pdev->dev, "of node is missing.\n");
-		return -ENODEV;
-	}
-
-	match = of_match_node(j721e_audio_of_match, node);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match) {
 		dev_err(&pdev->dev, "No compatible match found\n");
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev,
+			struct_size(priv, dai_links, match->num_links), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->match_data = match->data;
-
-	priv->dai_links = devm_kcalloc(&pdev->dev, priv->match_data->num_links,
-				       sizeof(*priv->dai_links), GFP_KERNEL);
-	if (!priv->dai_links)
-		return -ENOMEM;
+	priv->match_data = match;
 
 	for (i = 0; i < J721E_AUDIO_DOMAIN_LAST; i++)
 		priv->audio_domains[i].parent_clk_id = -1;
-- 
2.54.0

