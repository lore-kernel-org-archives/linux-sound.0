Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BEA1A0BC0;
	Tue,  3 Sep 2024 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356192; cv=none; b=I1i0lH825WkJ1xC8DPsp486Bgu9PxOOTa6EpwU4+mJobhDVu7u6aFVLStEL1oILdJI0UDjLttuPZNDLlyY6pT3Td6csODEJUAbHc5fASvf7AE75kNRutC0wr9zsEdRrdjsz5/Qz8nGhIo/nUBrow17hdzoGn/RrPPzjrUEoHv7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356192; c=relaxed/simple;
	bh=fOBTd6vK4Wl3rRRMzFrMhBEU+PiOZ3K1qzb18PIshVI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JkGC+EfYy3/O+QJV+BQKMclcldckrTNK5D4BzZEe0juWZnTwIC6T1W7aks6eaM0N3finizU7YWVdgW5D276OnRNVd7IkgMO9xfOOJKXoLu7rovPTbxTxSfguZy9jY8Ik+XkynzVZywWHYasgaPZeuiwEM223ErzC65NmOBniFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee866d6d89aced-16d21;
	Tue, 03 Sep 2024 17:36:26 +0800 (CST)
X-RM-TRANSID:2ee866d6d89aced-16d21
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee666d6d89826f-e0132;
	Tue, 03 Sep 2024 17:36:26 +0800 (CST)
X-RM-TRANSID:2ee666d6d89826f-e0132
From: Liu Jing <liujing@cmss.chinamobile.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linus.walleij@linaro.org,
	bartosz.golaszewski@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mediatek: mt2701-cs42448: Optimize redundant code in mt2701_cs42448_machine_probe
Date: Tue,  3 Sep 2024 17:36:23 +0800
Message-Id: <20240903093623.7120-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize the defined parameter 'dev' to make the code cleaner.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 1262e8a1bc9a..4974b0536b7b 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -329,10 +329,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 	struct device_node *platform_node, *codec_node, *codec_node_bt_mrg;
+	struct device *dev = &pdev->dev;
 	struct mt2701_cs42448_private *priv =
-		devm_kzalloc(&pdev->dev, sizeof(struct mt2701_cs42448_private),
+		devm_kzalloc(dev, sizeof(struct mt2701_cs42448_private),
 			     GFP_KERNEL);
-	struct device *dev = &pdev->dev;
 	struct snd_soc_dai_link *dai_link;
 
 	if (!priv)
@@ -341,7 +341,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
 	if (!platform_node) {
-		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		dev_err(dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
@@ -355,7 +355,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	codec_node = of_parse_phandle(pdev->dev.of_node,
 				      "mediatek,audio-codec", 0);
 	if (!codec_node) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Property 'audio-codec' missing or invalid\n");
 		return -EINVAL;
 	}
@@ -368,7 +368,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 	codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
 					     "mediatek,audio-codec-bt-mrg", 0);
 	if (!codec_node_bt_mrg) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Property 'audio-codec-bt-mrg' missing or invalid\n");
 		return -EINVAL;
 	}
@@ -377,7 +377,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
 		return ret;
 	}
 
@@ -395,10 +395,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(dev, card);
 
 	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+		dev_err(dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 	return ret;
 }
-- 
2.33.0



