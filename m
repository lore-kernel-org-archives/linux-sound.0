Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689F1C93C6
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326803; cv=none; b=eEpujucTvfT8jHUJb5ZwuL9qF0p65zmStzHXuzGFRAEC1fCDnGASVl1SaF+z0ywInxtodzo9E/hZ+i6umurVdyLaz6RXaaelK5S+8FcimuDciEdNzSeiBYtpfCHcxNbnHVclM8vEpVDLyjTlvkuEdr4fs443K1q5yzpIxrC1DSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326803; c=relaxed/simple;
	bh=5f53fsR68Xc8DgD8liu2YrG5Jfkna4htTDUcr1TDIA4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NXl+dIq5IPXn90bWsqI5pfH+z4DqcBGxZQ1QCn1Mn53muCIhXGNPDzSAWwelj7f9Tch82htnU7gl+4LZ5vAC3KwNXba+85fRwV4yV03fRV4DdwQxBEbTy644EfBcSBIbemCRnrU+OEvP4cZB6cwyVmIfxdcHTtYtNGjGQGm8N9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqLmM5D1yzhY8n;
	Thu, 22 Aug 2024 19:37:55 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id B0956140134;
	Thu, 22 Aug 2024 19:39:56 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 19:39:56 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/2] Some clean up with helper fucntion
Date: Thu, 22 Aug 2024 19:26:47 +0800
Message-ID: <20240822112649.58376-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

There are some helper functions which can be used to simplify the code.
So, let's use these functions to make code more simple.

Zhang Zekun (2):
  ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to
    simplify code
  ASoC: audio-graph-card2: Use helper function to simplify code

 sound/soc/generic/audio-graph-card.c  | 12 ++----------
 sound/soc/generic/audio-graph-card2.c | 28 ++++++---------------------
 2 files changed, 8 insertions(+), 32 deletions(-)

-- 
2.17.1

