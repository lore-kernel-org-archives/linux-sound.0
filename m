Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F523185B44
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326802; cv=none; b=k29vvApygi/MIswzkZCH1+kRNjNohOMT+C7XgPIFRH7FGoo8bq1vvMkh80HZLqu5O4jNbBFgieLZnPSQwcviANTph1L9/e6isEkH9FWS+Lb71Rr2o4x3N0ryifWfYKK7Mqt/cEhA/akJ5G78wM2MVK+oBceey47mh+TSQp6nTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326802; c=relaxed/simple;
	bh=H+a8r8Jj4ufrNpLlVvBIkB8KHLBnwUUAQuB7L5gcy/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekriulyIA+NX1o1D/s3Vz5j3plpcP8RWOeNuSIKz6LHgSsYecNIqbLe2wGXUaxEtUOLv9HFxuDr4bxGLrmfU5ycI+JZW4y+5i6oCykIX5s3m451U4+SpoJWrpdfm2srBYUMzdlMaihGPqhEnR8Nmn4mVfVzbkkaBxf26vLb4kr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WqLmV66kyz1xvNd;
	Thu, 22 Aug 2024 19:38:02 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id CEF2C140447;
	Thu, 22 Aug 2024 19:39:57 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 19:39:57 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: audio-graph-card2: Use helper function to simplify code
Date: Thu, 22 Aug 2024 19:26:49 +0800
Message-ID: <20240822112649.58376-3-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240822112649.58376-1-zhangzekun11@huawei.com>
References: <20240822112649.58376-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

for_each_child_of_node can help to iterate through the device_node,
and we don't need to use while loop. Besides, use of_get_child_count()
to get the num of child directly. No functional change with this
conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 sound/soc/generic/audio-graph-card2.c | 28 ++++++---------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 56f7f946882e..03f6eb1df84a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -351,15 +351,12 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	do {
-		*port = of_get_next_child(ports, *port);
-		if (!*port)
+	for_each_child_of_node(ports, *port) {
+		if (of_node_name_eq(*port, "port")) {
+			ep  = port_to_endpoint(*port);
+			rep = of_graph_get_remote_endpoint(ep);
 			break;
-	} while (!of_node_name_eq(*port, "port"));
-
-	if (*port) {
-		ep  = port_to_endpoint(*port);
-		rep = of_graph_get_remote_endpoint(ep);
+		}
 	}
 
 	of_node_put(ep);
@@ -1141,21 +1138,8 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = port_to_ports(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
-
-		/*
-		 * CPU/Codec = N:M case has many endpoints.
-		 * We can't use of_graph_get_endpoint_count() here
-		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
 
-		return cnt - 1;
+		return of_get_child_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
-- 
2.17.1

