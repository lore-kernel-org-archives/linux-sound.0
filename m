Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28331145B26
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743212; cv=none; b=jvefoITgVT5AQfiwv/5rHzPm5VK5JkpYYFAe+5N1LljvYN517NSO0LIN2P//z+WdMvtEHJ+F0KfxtY/HE1IVLBy89Mtgm5kcLrQ3KKxTZdKMxgIl7yOSoE92aQ5Rekv4TpqQKxZr+BUdkXEoOMBNQ5poZ8gAVRuAag/ss5Wflpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743212; c=relaxed/simple;
	bh=8X8ziSV+rYOTdVcM+SN+s3iwUYxMmHI33u6ka2fUtQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dj00jD91RANNvLGgbsY/6V4iZ1dHQNvP8gwqGjk5cEV3tJR5EqYa+h+w1l+0IZtPeNfhniMfONbJau9L0JuRekknp6kB+lRBmsiGIRIYyeftV8+BuxBCiowQDI3PbN9TymLX2r64Vi8dt6xUPAlvHskks2uFLovm9OFva+8siIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WtJpP07fbz1S98L;
	Tue, 27 Aug 2024 15:19:57 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E9CB140136;
	Tue, 27 Aug 2024 15:20:07 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:20:06 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 0/2] Some clean up with helper fucntion
Date: Tue, 27 Aug 2024 15:06:48 +0800
Message-ID: <20240827070650.11424-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

There are some helper functions which can be used to simplify the code.
So, let's use these functions to make code more simple.

v2: Fix a code logic broken problem and add the comment back.

Zhang Zekun (2):
  ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to
    simplify code
  ASoC: audio-graph-card2: Use helper function of_get_child_count()

 sound/soc/generic/audio-graph-card.c  | 12 ++----------
 sound/soc/generic/audio-graph-card2.c | 11 +----------
 2 files changed, 3 insertions(+), 20 deletions(-)

-- 
2.17.1

