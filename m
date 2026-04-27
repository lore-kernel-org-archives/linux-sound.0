Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFD2777FC
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 05:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777267213; cv=none; b=XJL+LP6wGtysOk2AgRc54kZhd1SL9xBr8tIF24AAGslRRZSgoirxD9avq30kU3abbsbgYTZIWvckEJJ9qnfYO8rahJSA1IpFIYufr1agWjBpNJSVLNXLFgvYdW5tg1jCpGKbCavc5mtaZOBxtdsXOfIAnEagNO0qjiRrigypANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777267213; c=relaxed/simple;
	bh=kLZWnM9y28y8ldbkGVoQdJpea9B9e0SdXFajf1RExA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SVNx7kxgM3xfiX1HbCEHrnTZBGO6foLKlHUaHH+MkDJDubefedTTpuVIkEGber2XjzSD/CfMgD6DOVMDbzw+9trU5FLwMIdHbuG6tGC1vOv/+Kn3uQ58ChFVWOcqLLUdIHaMm0m4tsDBu1kIIKZ3XzfK/vrfAGuyfhLAy7e7xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAPy0GLP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAPy0GLP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad617d5b80so57142235ad.1
        for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 22:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267211; x=1777872011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGtV/ZWxjAAYhGmZ7Trrlqe5ZDiPRNjc23KXIz9tO/Y=;
        b=EAPy0GLPwq6PTiz1qJ6kgwKHLvDHsoxJPVt6pOcyn5GFjhnvtFA/8oPdteGRiIeCbr
         eWWskLrb3ThbQMZaBoPPjzu9S6MK6BDWBtbP5FqG5JtatJNA9NLn7mycrCmVgKP+uP6s
         CFduzK5GkvuTBBKcI9Vcr7yew2V+1xdawj1Pq3v0a8efCIltNvrHd+yjTwj4zJUyToet
         tbwhgLjIHnJ8h8GzqO2R9L55og9hmsbocM2R1myMuKTSmmNh7PZV0hW4Ll4S8F1qH+CQ
         EnNRYe8VoNxK1jCFRQj4nEYKe+32qoAoS3LHMAjxxqBRtipRLUwUrvphsKE7erHFDPdw
         s3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267211; x=1777872011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGtV/ZWxjAAYhGmZ7Trrlqe5ZDiPRNjc23KXIz9tO/Y=;
        b=Ma8NjhdCqxS+Jk/iY4ILgU/k6LXVekts0PILDtsKG0XV2bYqorzuBqBpO0OZ09c6rq
         mxRhGNFGl7AJTQdQeJf7kE7dW/KcxjBCiJpZnbm5uUxXvWe0711JVChIq9r6km0+ZhmA
         JTm7Q2fH2jyFFo9BKJcofzlW5KzlCeUviDNG/TGUCHnM9lD91SoZsGBeQzukKpxYTZ97
         jvUNm8fJFj/UINH9w9/M+xLJviQIgC53tkEFf1FcRCcMWXcv9De4Hbg+SFGG4b1yCAGo
         tbZmQRCeCIvlDPEQIe9KJ04tmk3BCz71z6h7sK8PyJ5Ki6GemG84XB1tbSMvFagJ25Oz
         oJyA==
X-Gm-Message-State: AOJu0YyLjSYngtvz0XXELYehNThEcw4Fb/A803XvXgOsX1AChIIqwSmK
	b4gHFfWXdBV3xm2WOTJXVhfNWiX4DUK5KT3NsGWzl5UsFTwFjgnd39mwQTkx0A==
X-Gm-Gg: AeBDievvDE6oo10BW+u4n2ZWjfN9xVs6bBakNmfhFYXKAWg5H9ZHlLUAAfzmUsAV9D0
	BN5erZucrkOYh/DMekmJNmsCxayVAWnwZHJZVhewT6KIsGctoFw8ckTjqJUi9q5N8au32vD4LaE
	wh/+n3y8etWwkcXpZsflcgx9J96lVzm7dJ7lBaVoV/5tJbhXMIyg9U5VyCfYAgp9AUTwEpSAMM/
	/hc6D2GNdBLn5BprMSmvs6zdv/VbnB5j/0d9+mhF49pCSYaZYyHxnUYDxlaDtyo1TT5//z2gu3h
	S5j/NGQC35UCVRmGUuGYJvEUCPklyxtnGgjnHpQb0JLnRMvrEg5MGL92vsOIonrBuH/0jlsLB6x
	jIMXkub363Kmz4SZp6zWD+x1G0QjBvFM2ZBT4v8/WJnhJpKXkhqNgSZERmFLOJlihzfJX5VOIq1
	BDgUimoM/6qKG8Qmvqgi2YL8BVqtubL2U8K3e+3IucAMfXazrIGDy9tT96/nX9dupNQHeXWRZ5U
	gGumKTl0g2pgFvhpSHDsPRYDA==
X-Received: by 2002:a17:903:2ecc:b0:2b4:6022:bf8c with SMTP id d9443c01a7336-2b5f9f52984mr455496645ad.22.1777267211224;
        Sun, 26 Apr 2026 22:20:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm292136575ad.19.2026.04.26.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:20:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: ti: j721e-evm: allocate dai_links with priv
Date: Sun, 26 Apr 2026 22:19:53 -0700
Message-ID: <20260427051953.956372-1-rosenp@gmail.com>
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
 sound/soc/ti/j721e-evm.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index faa62c1a9b8e..cbb10781e042 100644
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
@@ -844,33 +844,18 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 
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
-	if (!match) {
-		dev_err(&pdev->dev, "No compatible match found\n");
-		return -ENODEV;
-	}
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	match = of_device_get_match_data(&pdev->dev);
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

