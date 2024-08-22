Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33F1AAE36
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328704; cv=none; b=MsvEl58GONZHRTeWDCd0x5793dmLTtiPW80bTDDaXr9hKfdN27jX++5E0VhFjaERrgrcyRTQp5nUL+J50a7iQfv6sOtEvKxd3MbKvE5BtuJHz/RmINEcLpYssgxlqsCQ/fvGRJrYritkIPdS+zmFJGYJ+l2Aa65+SaEd/PSR2ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328704; c=relaxed/simple;
	bh=6bwXf/4AgzEicEQPinyElUwNGYc5AEniUJWlOIl3kvg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b6l2OiCW9HIMwWNGvBO4w/j51x4wiiTHOC3a1vJDRBelGqXNhUF0qMJ7e+SULLvJcjxcWAMbcnb4qWX6etPWpc/yJYiRaglEfButSoyBAVv63+DirP/R+WvC4wrgosD/UpI2ayncCPFx+NKNgvHBV/7BwQwAaGWaSwdgo8wzbw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqMSx6950zhYBp;
	Thu, 22 Aug 2024 20:09:37 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id E3BB718010A;
	Thu, 22 Aug 2024 20:11:38 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 20:11:38 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] ASoC: simple-card: Use scoped of_node_put() to simplify code logic
Date: Thu, 22 Aug 2024 19:58:31 +0800
Message-ID: <20240822115831.20000-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use scope based of_node_put() to simplify the code logic, and we don't
need to call of_node_put(). This can simplify code logic a bit.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 sound/soc/generic/simple-card.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index d2588f1ea54e..60a09ee5b159 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -375,8 +375,8 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
-	struct device_node *node;
-	struct device_node *add_devs;
+	struct device_node *node __free(device_node) = NULL;
+	struct device_node *add_devs __free(device_node) = NULL;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
@@ -393,9 +393,8 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 	/* loop for all dai-link */
 	do {
 		struct simple_util_data adata;
-		struct device_node *codec;
-		struct device_node *plat;
-		struct device_node *np;
+		struct device_node *codec __free(device_node) = NULL;
+		struct device_node *plat __free(device_node) = NULL;
 		int num = of_get_child_count(node);
 
 		/* Skip additional-devs node */
@@ -409,7 +408,7 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 					     PREFIX "codec" : "codec");
 		if (!codec) {
 			ret = -ENODEV;
-			goto error;
+			return ret;
 		}
 		/* get platform */
 		plat = of_get_child_by_name(node, is_top ?
@@ -417,14 +416,14 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (np == add_devs)
 				continue;
 			simple_parse_convert(dev, np, &adata);
 		}
 
 		/* loop for all CPU/Codec node */
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (plat == np || add_devs == np)
 				continue;
 			/*
@@ -454,22 +453,13 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 					ret = func_noml(priv, np, codec, li, is_top);
 			}
 
-			if (ret < 0) {
-				of_node_put(codec);
-				of_node_put(plat);
-				of_node_put(np);
-				goto error;
-			}
+			if (ret < 0)
+				return ret;
 		}
 
-		of_node_put(codec);
-		of_node_put(plat);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
- error:
-	of_node_put(add_devs);
-	of_node_put(node);
 	return ret;
 }
 
-- 
2.17.1

