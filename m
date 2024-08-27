Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B314D2B3
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743213; cv=none; b=XNbdUqQW68iJpoNr3Vpo+TabOHInukkRl5we7a5lc55oFBiqTLrew73Q5U+Kw3EP2peF/N3mfVBuQ01Fn48r/8NCok8nzp9k75MO6+LPMN2UvZtNuoyLoPlhTB3cI+CUmL9cEFmCtfV317xSyPYQGCjxOIQp9boLllCjsKHQe5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743213; c=relaxed/simple;
	bh=vjV3k0HFFp5C7DEFWtEAMP7t4IbkwjP8TU05lebKjew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKwcDBFSkZPGE2EDvvUQs8Vo7ifTOnM/yOT0ll7q4s9Vm2V6jwwrs9pVA24BB5rfRGFMgdcN6/mRXyzCo3qzUQpX2aQPwWbIbA5PKRmuwSdjjwAT9cCtoJf/FAz68AC9/2Mv0SihSTeMixLV/bUtEnthb3g5SopkS1BvNSGF7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WtJpQ4h6xz2Cnl6;
	Tue, 27 Aug 2024 15:19:58 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 7BE43140136;
	Tue, 27 Aug 2024 15:20:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:20:07 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 2/2] ASoC: audio-graph-card2: Use helper function of_get_child_count()
Date: Tue, 27 Aug 2024 15:06:50 +0800
Message-ID: <20240827070650.11424-3-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240827070650.11424-1-zhangzekun11@huawei.com>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

of_get_child_count() can help to get the num of child directly and we
don't need to manually count the child num. No functional change with
this conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
v2: Remove the use of for_each_child_of_node() to avoid code logic
broken and add the comment back.

 sound/soc/generic/audio-graph-card2.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 56f7f946882e..ebbe12692f57 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1141,21 +1141,12 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = port_to_ports(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_endpoint_count() here
 		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
-
-		return cnt - 1;
+		return of_get_child_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
-- 
2.17.1

