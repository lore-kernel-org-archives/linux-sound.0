Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23F1DFFD
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295377; cv=none; b=aX24q1vksBH4bKT1NMf7Pd0GW8boYT+4hsRPWXwuEdC7OqHX2wPNfGq/+oC0mlVFGXB8IORzhk5xnhjd4OYYPwJbOeVX7seGRuj/r8tULnOEimaB6/eqO/wJZvCz16zFS8zNB/ZWTe8wU9omh1R7vBoKYc8a3b0gC9AtR9JNj/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295377; c=relaxed/simple;
	bh=wvqyPR4Jyp6z9ecxlxJqscrd69g5WNf58JgrQlsY7OU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kEcvaykoKvbTef/L5LG5eHm1zBZSJ8UWPJWYEQsPVd8iqwQVdOdOpXZS2WIiURzc3jeJCgYBc17sYXje5bwz/LgPtQVLAndZyyiJ8uotLrpj00DbkVBc/Jx9Nv2JsYVDRV5ORqzO/N5iTPD+dRXU81IMkXZHJMcszqJtmjZJAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=hIfnjVsL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="hIfnjVsL"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66T3MUAP0168430, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785295351; bh=7qLwD0VJRzH6jtuSCTGjILfH/NOil/qq2sdEUELQCww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=hIfnjVsLc9GFevv+FvNDhQU9qYRifP11dln2jVWkeHH9KGLhUo7GnIYzdavdXdKS/
	 YPb8IG3r7Q5W2eq2F+vJleaZQwOJwJ8lIhASgOIu0n4uMHs9tba3qUlvMGiTvXEH7I
	 m/rU8UJytPfROfMMr7c6xnyft0rUAG9QjhTeKtyccPwIgvqoYz/ZSvqxHWkeP0L+0P
	 qiWfn/NKrucXMNQC6lJhH2PNm/R15fYYebWs2hZvyxv+tOKsEmqYB0UsMaf23CdTiJ
	 nPnZFLjAIfXOfbxcjjB2cta7/yFsp+twxgRgvAL46tv2Olra5t0hEEEAljQq8gnpoi
	 Pdwja789TCLWg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66T3MUAP0168430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 11:22:31 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 29 Jul 2026 11:22:31 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 29 Jul 2026 11:22:31 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Wed, 29 Jul 2026 11:22:31 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 1/3] ASoC: SDCA: export sdca_find_entity_by_label() helper
Date: Wed, 29 Jul 2026 11:22:27 +0800
Message-ID: <20260729032227.3750770-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

Export the sdca_find_entity_by_label() helper so that codec drivers can
locate SDCA entities by their labels.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/sdca_function.h   | 2 ++
 sound/soc/sdca/sdca_functions.c | 7 ++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index b1489178b0ef..fb931ae735a2 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1469,5 +1469,7 @@ struct sdca_control_range *sdca_selector_find_range(struct device *dev,
 struct sdca_cluster *sdca_id_find_cluster(struct device *dev,
 					  struct sdca_function_data *function,
 					  const int id);
+struct sdca_entity *sdca_find_entity_by_label(struct sdca_function_data *function,
+						     const char *entity_label);
 
 #endif
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 7a7a9f1a4938..cdf1e68d60ac 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1619,7 +1619,7 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
-static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *function,
+struct sdca_entity *sdca_find_entity_by_label(struct sdca_function_data *function,
 						     const char *entity_label)
 {
 	struct sdca_entity *entity = NULL;
@@ -1648,6 +1648,7 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 
 	return NULL;
 }
+EXPORT_SYMBOL_NS(sdca_find_entity_by_label, "SND_SOC_SDCA");
 
 static struct sdca_entity *find_sdca_entity_by_id(struct sdca_function_data *function,
 						  const int id)
@@ -1688,7 +1689,7 @@ static int find_sdca_entity_connection_iot(struct device *dev,
 		return ret;
 	}
 
-	clock_entity = find_sdca_entity_by_label(function, clock_label);
+	clock_entity = sdca_find_entity_by_label(function, clock_label);
 	if (!clock_entity) {
 		dev_err(dev, "%s: failed to find clock with label %s\n",
 			entity->label, clock_label);
@@ -1873,7 +1874,7 @@ static int find_sdca_entity_connection(struct device *dev,
 			return ret;
 		}
 
-		connected_entity = find_sdca_entity_by_label(function, connected_label);
+		connected_entity = sdca_find_entity_by_label(function, connected_label);
 		if (!connected_entity) {
 			dev_err(dev, "%s: failed to find entity with label %s\n",
 				entity->label, connected_label);
-- 
2.54.0

