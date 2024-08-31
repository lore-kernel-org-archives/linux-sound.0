Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB2A3C30
	for <linux-sound@vger.kernel.org>; Sat, 31 Aug 2024 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725097419; cv=none; b=aRCvaxENKESunRQICW6OQltVpfjjtw9QJSslZ5fSH8+bQthXKNmnwb9d+WwqYZa2vxJ5rI5nSatuG3eHs0znUs8o6+gD/nivQ8nCxLndRSFIKKlzBQ9MjHjLdNiJMErIRTmsrY2vEOL63NgU7GHNNymQ/7CS346DSyrqAN7JnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725097419; c=relaxed/simple;
	bh=fsew26hiKnsxCkTZuwEHt58gXKXp0YD4WYRjIeAd9pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QJKYXzVGmNO+cBAyLvmItZT5Y+ZGmeGXBezv6mW5EX3tdgG0qGHVhWoeDNCVoWTUZt7Ig746snhLNOR7sv+XkLLUgQKhZwGVzu3mMMR2thXaQQe9xZ8fPG9LsVcVkHV707abpDjRbnBad9rdh593UFg6jvA7kH7dW5TcpQ3pyQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WwqnH2TZ0z16P6G;
	Sat, 31 Aug 2024 17:42:43 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B1B31400DC;
	Sat, 31 Aug 2024 17:43:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Sat, 31 Aug
 2024 17:43:35 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <lihongbo22@huawei.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH -next] ASoC: adi: Use str_enabled_disabled() helper
Date: Sat, 31 Aug 2024 17:51:49 +0800
Message-ID: <20240831095149.4161729-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Use str_enabled_disabled() helper instead of open
coding the same.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/adi/axi-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 7b2563075743..4107eddc9ca8 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -264,8 +264,8 @@ static int axi_i2s_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 
 	dev_info(&pdev->dev, "probed, capture %s, playback %s\n",
-		 i2s->has_capture ? "enabled" : "disabled",
-		 i2s->has_playback ? "enabled" : "disabled");
+		 str_enabled_disabled(i2s->has_capture),
+		 str_enabled_disabled(i2s->has_playback));
 
 	return 0;
 
-- 
2.34.1

