Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5816C876
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220759; cv=none; b=ULy+uXE2/AAcr7u2fHJiWFfBXRJZCIgq8EkGpsMq92Y9iUcDHHBpP2p+25OIL5vTuWqZ87G7VRuZZqBm/TTeVXp0u6LMAImzH7EYq6FLineMdTVYCCQhi6WQjmq8t40Mt+JxzXBOR7SkvMTGwy+nT/YFn5QtVQxICGHlbPDfjVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220759; c=relaxed/simple;
	bh=qKe7mAsCbNTax7GyAQZm5YszCm5EuHDxQsyBvVey/pc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YrizhWk/zOnnj/dlpcaBWHFFxqE8TQPsfm1oSsrU3g/xAFHs5V5HxJaFPrmyU7NipO9d+7p61ap7Sz2RytR0oOCvYyrgCnu2YZ927xdVS0Syx34C+TnSBzlp3PvCLQ5BF0f/U3lvT09BmE8Crt8kQ+IJOASzIa+uf5299bh9bbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WpbYF1cTxz1xvQl;
	Wed, 21 Aug 2024 14:10:41 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id A8F8F1A0188;
	Wed, 21 Aug 2024 14:12:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 14:12:35 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 1/2] sound/soc: allow module autoloading for table db1200_pids
Date: Wed, 21 Aug 2024 14:19:54 +0800
Message-ID: <20240821061955.2273782-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821061955.2273782-1-lihongbo22@huawei.com>
References: <20240821061955.2273782-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Add MODULE_DEVICE_TABLE(), so modules could be properly
autoloaded based on the alias from platform_device_id table.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/au1x/db1200.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 83a75a38705b..81abe2e18402 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -44,6 +44,7 @@ static const struct platform_device_id db1200_pids[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(platform, db1200_pids);
 
 /*-------------------------  AC97 PART  ---------------------------*/
 
-- 
2.34.1

