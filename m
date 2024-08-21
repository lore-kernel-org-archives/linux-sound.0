Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EB192D6C
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223652; cv=none; b=iYUHUeLedFE/xWFDGWe9KMzMX2oh5J9Jp7v5/IY172DGQrTfokahtqn1G82GDmedx1Al9XuB+7AfmPA9MAl961OmFrTlJa+WNQmpzJ9Z+B1MMJswJsL3YTts3QbJh6PJ1pp+cqXUa6fK+LVjSy6z/27gAd+UxBRPhGipX9SmlZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223652; c=relaxed/simple;
	bh=Ad5taQnaxXCn0Fcymptyag1gQ3UI8NWbmdclq+fU0dk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewKt2DA9NzMs8FYLvy4Z1MhovgeGnCWoJNoEkbHLNVKTt2FMuNvKyzBYBrPpMuagna3esdyWEPNhe7OySLpsaZfGN9zmK/xBf09cjZFQrvO+Q+8SwFECWx2xwnkejsq3DJjS+riUxXn8/eDdgs4+g/auZlIBBo0oeyJrkivU/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wpcg11ZGPz1S8PG;
	Wed, 21 Aug 2024 15:00:45 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id E38C21A0190;
	Wed, 21 Aug 2024 15:00:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:47 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 5/5] sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC
Date: Wed, 21 Aug 2024 15:08:15 +0800
Message-ID: <20240821070815.2326534-6-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)

The macro STM_SAI_HAS_EXT_SYNC accepts a parameter x, but
it was not used, rather the variable sai was directly used,
which may be a local variable inside a function that calls
the macros.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ad2492efb1cd..40efd2854e87 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -53,7 +53,7 @@
 #define STM_SAI_PROTOCOL_IS_SPDIF(ip)	((ip)->spdif)
 #define STM_SAI_HAS_SPDIF(x)	((x)->pdata->conf.has_spdif_pdm)
 #define STM_SAI_HAS_PDM(x)	((x)->pdata->conf.has_spdif_pdm)
-#define STM_SAI_HAS_EXT_SYNC(x) (!STM_SAI_IS_F4(sai->pdata))
+#define STM_SAI_HAS_EXT_SYNC(x) (!STM_SAI_IS_F4((x)->pdata))
 
 #define SAI_IEC60958_BLOCK_FRAMES	192
 #define SAI_IEC60958_STATUS_BYTES	24
-- 
2.34.1

