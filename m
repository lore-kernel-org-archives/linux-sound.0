Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7116C87B
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220760; cv=none; b=eMRLYmLUnYuLdisQAD3Jwzm1mOgfXz57CJFe/YL2dOELn9BvY0HoyBnf5FO2boxXesdL0oaX9d+fEB2oo/PZLGeSgTiuqDm/aY2ejri1ZIdP388SxsiW7X0iomH8F7i2GT2ThIxzPOXOgIVhIq/ae0rwy+MfSavJSABpFICQPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220760; c=relaxed/simple;
	bh=hLYnCis8Q7yGRT/7UC5GMPLid7FAZxzpUrsLDeSpoFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4otMnIDXmLtpojLOoU1+6sDFd62D2r2xrbHsRcuAhQ5/cs9Y3r4plpp4tzJSUfZ14/TEDJ2Ckujldt6VX37xszl1xxaZz+20VzqJgk77NY4amlN5/OHgd6wzkX5rmQCJGcBaCF/mU2sQgcaLkBheflNmxgS5p1hlMAovSVpsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WpbV16gBKzQqG4;
	Wed, 21 Aug 2024 14:07:53 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id CE2C11401F4;
	Wed, 21 Aug 2024 14:12:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 14:12:35 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 2/2] sound/soc: allow module autoloading for table board_ids
Date: Wed, 21 Aug 2024 14:19:55 +0800
Message-ID: <20240821061955.2273782-3-lihongbo22@huawei.com>
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
 sound/soc/amd/acp/acp-sof-mach.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index fc59ea34e687..b3a702dcd991 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -158,6 +158,8 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, board_ids);
+
 static struct platform_driver acp_asoc_audio = {
 	.driver = {
 		.name = "sof_mach",
-- 
2.34.1

