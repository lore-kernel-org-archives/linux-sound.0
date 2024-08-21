Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E21114
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220759; cv=none; b=PZcqAX+rrjqjEKQdDf76wA6f5s8bSbz3ct6wOjd/PAfqAVIwbKdxXJCcPLZ1av/V8IkDMh34OAmU3yK1bS+2BVOMqsRGxpWfnntbYYDsGhavDWlkP5Ai1XiKyfbV1NCL7cW2iQMvZ85eTO3dF2/c9/I8DvpllQxR1XY5pQUr4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220759; c=relaxed/simple;
	bh=VtX8R9SNiURJ7fqdS3Gyz52aeh7vSh+5RObIu46NEaM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=shnV4AIHO85ucwkyvKuxW3ebODHM/Eymqa/JShmk7IFPebn9ZR8PxMX3MDXTnPQhw4XVtLP3GZN8imgxrYh2RDwQ9G6uxZKLLPpbNFIsbMgzf0LLb2G0vsYzNsKyu1+hMitUA/lEOryRo30JJEM6op6qRiOo207+lW/8cM0MX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WpbZg3rRHzpVTC;
	Wed, 21 Aug 2024 14:11:55 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D6241401E0;
	Wed, 21 Aug 2024 14:12:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 14:12:34 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 0/2] allow modules autoloading
Date: Wed, 21 Aug 2024 14:19:53 +0800
Message-ID: <20240821061955.2273782-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Add macro MODULE_DEVICE_TABLE, so modules could be properly
autoloaded based on the alias from of_device_id table.

Hongbo Li (2):
  sound/soc: allow module autoloading for table db1200_pids
  sound/soc: allow module autoloading for table board_ids

 sound/soc/amd/acp/acp-sof-mach.c | 2 ++
 sound/soc/au1x/db1200.c          | 1 +
 2 files changed, 3 insertions(+)

-- 
2.34.1

