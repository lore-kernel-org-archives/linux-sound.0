Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD156347529
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430454; cv=none; b=hmR+a3vX4RICDs+N8YXoBVQ8p+IvLkNplpVkaVZqCLp5NV/OtiZlR0KDvSzOm7zBGF9Q4Vxwg+JV+Ok/9RtaYPr5Iqt5n0Vkr7YkZifmTRLimgN/hSQe1/7qvHsH1oM7GB/i+JRdTc5F/pMf8VoeRaW/hzx+ojcr/NX2x6qgSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430454; c=relaxed/simple;
	bh=U5lPNEYDJtCvtEBN0jIqHBrO9qI6djsZBu1zZpHzY54=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UqzwFc+xVRvW89BPwrB18pc8bvYZJhfaW+qtyl7oGRokUBbcNXGwr1a4mBZWuFsxNqZ35tfdwi60ab9QACydKvseorjh8BTy3fnkd2P9KETqalzqzKklLsGvArxq0CXFqdTbtKwsOwz9kTGAKlwmwBHgnV2iYveNK1Zjz1t2vrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=nWqnIGSX; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="nWqnIGSX"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62P9KKPV03100006, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774430420; bh=0PLvuhGC0E2XxuwlDpzHBrJ7eSlKiw9WTZZXhpm1oRU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=nWqnIGSXD27p9W1wGPw8xZaTkz9geo4G0TkWyeZCM7UyOuwyPbW7WBtQU4BN+KKpX
	 6z0WPadlc9Md4swpaVDN4FZ7U9cGpZMahaG5L3dOlGx2ioF2sAo3lrpAAnsyZgeruX
	 Gt3DFc93NTHQqswt/bu8imzn7aikBNZmcyZzJZ626mFQ4/nJ3ZZK8Suf1p3rFZTxHE
	 4WXnhR2byRPR93vXpoKsHULF/lnoqPYnMLT93YTzroPlISPkUepx9v7JEAkXpQ2L2z
	 WJWTgW2DGo3wcerets/BtzgMx/GEcZ3Epm3bqfS7eiBVkzEn5fzOZNF+B+411n8Eg4
	 507g8xBsZQ1hA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62P9KKPV03100006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2026 17:20:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 17:20:21 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 17:20:20 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 25 Mar 2026 17:20:20 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: SDCA: remove the max count of initialization table
Date: Wed, 25 Mar 2026 17:20:17 +0800
Message-ID: <20260325092017.3221640-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The number of the initialization table may exceed 2048.
Therefore, this patch removes the limitation and allows the driver to
allocate memory dynamically based on the size of the initialization table.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/sdca_function.h   | 5 -----
 sound/soc/sdca/sdca_functions.c | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 79bd5a7a0f88..0e871c786513 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -26,11 +26,6 @@ struct sdca_function_desc;
  */
 #define SDCA_MAX_ENTITY_COUNT 128
 
-/*
- * Sanity check on number of initialization writes, can be expanded if needed.
- */
-#define SDCA_MAX_INIT_COUNT 2048
-
 /*
  * The Cluster IDs are 16-bit, so a maximum of 65535 Clusters per
  * function can be represented, however limit this to a slightly
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 257158bc67ea..0b7d97dcb236 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -216,9 +216,6 @@ static int find_sdca_init_table(struct device *dev,
 	} else if (num_init_writes % sizeof(*raw) != 0) {
 		dev_err(dev, "%pfwP: init table size invalid\n", function_node);
 		return -EINVAL;
-	} else if ((num_init_writes / sizeof(*raw)) > SDCA_MAX_INIT_COUNT) {
-		dev_err(dev, "%pfwP: maximum init table size exceeded\n", function_node);
-		return -EINVAL;
 	}
 
 	raw = kzalloc(num_init_writes, GFP_KERNEL);
-- 
2.53.0

