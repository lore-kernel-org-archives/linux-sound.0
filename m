Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172E19992C
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=136.143.169.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260059; cv=fail; b=bU+2tLFlbNOdVjwix873YydXnClkVaSYH492ksv04ZsoVcqFI/t5622bB+j/tdL4IvgwMe0p9sA8EKooCW9HJdFNULrIFojPasWq5kHUDcwltpOv+kWjsmrMnXwW96acC40bahDyytu85FRdD6jq71hC6LOyPHpzcDFiLlWK89o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260059; c=relaxed/simple;
	bh=PCAKehK5DUOMZd9Bs/gTSisjiCfPa1eVvcAGKnLbpB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMdKzCk4zMlBhL0wO1RRd4vWTLYvFHK+TPnCPCj0x5NZsMQFwYkjX5MvSoV/Gwz/WKQ2Njccgxc7Px75SeFsmmM1mlBNNxmhHVHZ0n9QDRN751ZPcwQyLA4zeAJR/GBLYthfElcV0WnRSjvlLCa7kU99ZNSgB0baIkF2y0jOBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=NWUhyFgn; arc=fail smtp.client-ip=136.143.169.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="NWUhyFgn"
ARC-Seal: i=1; a=rsa-sha256; t=1768260029; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=araiHaMRmm4ZuBcH7YAZrBpzPlOqWDTwy97dM/lkk+eEsjZXy6djk3GnMdZvUZ0/CXnwEZfu2znKZsh1pKl2TB1VtidLPHX+464749hLXnN38Yy7AFwQHVgOCKDjVpO9GdrUGndRIKDdbRj/kmDU0LkbPHmPo+tq+CJprD9mA70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768260029; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:Message-Id:Reply-To:To; 
	bh=0p2baUfPXG8dXJs3hoBkprKJUvk/AjdNX0qpZhHQNbE=; 
	b=dC0DdN1oECfxGN39eKeFD9M/g+FQqT2VzJ2Us5XLnZk1LITYfkw2oqqMLMjlWFNOOLZoZSVNIMdGt2QD6w/tQcnQ88/lH7qqrzr7C12TbID3tU6LzjjMt1HXZ/80mRwbBBhoMhwj+55USup3I2+h5ZcOxHv96O3HF+4LNtI93Ac=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768260029;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0p2baUfPXG8dXJs3hoBkprKJUvk/AjdNX0qpZhHQNbE=;
	b=NWUhyFgn61d6mX3Xw+w+ngwsOdzbZzsREdLP2Mw0miRK/3sMj3aZthtXsjP8xY11
	m5OeEaPxzdj48JHjQEF/5RYjKEQZd4l27m59SpWcpZXak6/r96AMd8Pz8DAW75lrzo3
	n5f2YUE1lo3hOil9sGACAAKXuCaPHN6z3JatF3nQ=
Received: by mx.zoho.eu with SMTPS id 1768260028871828.048558199409;
	Tue, 13 Jan 2026 00:20:28 +0100 (CET)
From: Fabio Forni <development@redaril.me>
To: 
Cc: Fabio Forni <development@redaril.me>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe function
Date: Tue, 13 Jan 2026 00:12:24 +0100
Message-ID: <20260112231855.193030-4-development@redaril.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112231855.193030-1-development@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It wasn't clear to me when different simple_probe's gotos were to be used,
plus some allocation errors and snd_soc* errors were printed as if they were
a parsing error. This commit:

 1. Splits the allocation logic and the initialization logic, respectively in
    simple_probe and simple_probe_merge_components
 2. Adds more error messages to improve the debugging experience
 3. Reduces the cognitive load of gotos, as there is now only one label (I concede
    that's subjective).

This commit also documents simple_util_init_priv.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 sound/soc/generic/simple-card-utils.c |   9 ++
 sound/soc/generic/simple-card.c       | 137 ++++++++++++++------------
 2 files changed, 81 insertions(+), 65 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 355f7ec8943c..46a8ee04c6ef 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -888,6 +888,15 @@ static struct simple_util_dai dummy_util_dais = {
 	.name = "dummy_util_dais",
 };
 
+/**
+ * simple_util_init_priv - Initializes private data of a simple audio card.
+ * @priv: Private data to initialize. Must be pre-allocated.
+ * @li: Links of the card. Cannot be NULL.
+ *
+ * Returns:
+ * * %0       - OK.
+ * * %-ENOMEM - Could not allocate memory.
+ */
 int simple_util_init_priv(struct simple_util_priv *priv,
 			  struct link_info *li)
 {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 298f8cc98130..b8004aa8f452 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -706,47 +706,26 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }
 
-static int simple_probe(struct platform_device *pdev)
+static int simple_probe_merge_components(const struct device *dev,
+					 struct simple_util_priv *priv,
+					 struct link_info *li)
 {
-	struct simple_util_priv *priv;
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct snd_soc_card *card;
+	const struct device_node *np = dev->of_node;
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int ret;
 
-	/* Allocate the private data and the DAI link array */
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	card = simple_priv_to_card(priv);
-	card->owner		= THIS_MODULE;
-	card->dev		= dev;
-	card->probe		= simple_soc_probe;
-	card->driver_name       = "simple-card";
-
-	ret = -ENOMEM;
-	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
-	if (!li)
-		goto end;
-
-	ret = simple_get_dais_count(priv, li);
-	if (ret < 0)
-		goto end;
-
-	ret = -EINVAL;
 	if (!li->link)
-		goto end;
+		return -EINVAL;
 
-	ret = simple_util_init_priv(priv, li);
+	ret = simple_get_dais_count(priv, li);
 	if (ret < 0)
-		goto end;
+		dev_err_probe(dev, ret, "failed to count DAIs");
 
 	if (np && of_device_is_available(np)) {
-
 		ret = simple_parse_of(priv, li);
 		if (ret < 0)
-			goto err;
+			dev_err_probe(dev, ret,
+				      "components missing or uninitialized");
 
 	} else {
 		struct simple_util_info *cinfo;
@@ -756,57 +735,85 @@ static int simple_probe(struct platform_device *pdev)
 		struct snd_soc_dai_link *dai_link = priv->dai_link;
 		struct simple_dai_props *dai_props = priv->dai_props;
 
-		ret = -EINVAL;
-
 		cinfo = dev->platform_data;
-		if (!cinfo) {
-			dev_err(dev, "no info for asoc-simple-card\n");
-			goto err;
-		}
+		if (!cinfo)
+			return dev_err_probe(dev, -EINVAL,
+					     "no info for asoc-simple-card\n");
+
+		if (!cinfo->name || !cinfo->codec_dai.name || !cinfo->codec ||
+		    !cinfo->platform || !cinfo->cpu_dai.name)
+			return dev_err_probe(
+				dev, -EINVAL,
+				"insufficient simple_util_info settings\n");
+
+		cpus = dai_link->cpus;
+		cpus->dai_name = cinfo->cpu_dai.name;
+
+		codecs = dai_link->codecs;
+		codecs->name = cinfo->codec;
+		codecs->dai_name = cinfo->codec_dai.name;
+
+		platform = dai_link->platforms;
+		platform->name = cinfo->platform;
+
+		card->name = (cinfo->card) ? cinfo->card : cinfo->name;
+		dai_link->name = cinfo->name;
+		dai_link->stream_name = cinfo->name;
+		dai_link->dai_fmt = cinfo->daifmt;
+		dai_link->init = simple_util_dai_init;
+		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
+		       sizeof(*dai_props->cpu_dai));
+		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
+		       sizeof(*dai_props->codec_dai));
+	}
 
-		if (!cinfo->name ||
-		    !cinfo->codec_dai.name ||
-		    !cinfo->codec ||
-		    !cinfo->platform ||
-		    !cinfo->cpu_dai.name) {
-			dev_err(dev, "insufficient simple_util_info settings\n");
-			goto err;
-		}
+	return 0;
+}
 
-		cpus			= dai_link->cpus;
-		cpus->dai_name		= cinfo->cpu_dai.name;
+static int simple_probe(struct platform_device *pdev)
+{
+	struct simple_util_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card;
+	int ret;
 
-		codecs			= dai_link->codecs;
-		codecs->name		= cinfo->codec;
-		codecs->dai_name	= cinfo->codec_dai.name;
+	/* Allocate the private data and the DAI link array */
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-		platform		= dai_link->platforms;
-		platform->name		= cinfo->platform;
+	card = simple_priv_to_card(priv);
+	card->owner = THIS_MODULE;
+	card->dev = dev;
+	card->probe = simple_soc_probe;
+	card->driver_name = "simple-card";
 
-		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
-		dai_link->name		= cinfo->name;
-		dai_link->stream_name	= cinfo->name;
-		dai_link->dai_fmt	= cinfo->daifmt;
-		dai_link->init		= simple_util_dai_init;
-		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
-					sizeof(*dai_props->cpu_dai));
-		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
-					sizeof(*dai_props->codec_dai));
-	}
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
+	ret = simple_util_init_priv(priv, li);
+	if (ret < 0)
+		return ret;
+
+	ret = simple_probe_merge_components(dev, priv, li);
+	if (ret < 0)
+		goto err;
 
 	snd_soc_card_set_drvdata(card, priv);
 
 	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to register card");
 		goto err;
+	}
 
 	return 0;
 err:
 	simple_util_clean_reference(card);
-end:
-	return dev_err_probe(dev, ret, "components missing or uninitialized\n");
+	return ret;
 }
 
 static const struct of_device_id simple_of_match[] = {
-- 
2.52.0

