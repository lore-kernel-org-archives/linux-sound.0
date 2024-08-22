Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312731C93C5
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326803; cv=none; b=GyM5SqZaudAwuD/ywYV+kA8MN2QoaJmbmQVdtbvfx6YSiSkhC605QTZ3dMKj3XQ3jt+cslTjznMvoTVRQL8u3tBetZJONamAPeEge/KYF36t40UeOM6vgzV/1HTRe1kyG+g57hxXZUin/gcL4PIOK+Y/gJ4Z8FN3hPz7V7nAutg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326803; c=relaxed/simple;
	bh=AGSMaxSz01inn+8NeWtBPwcoIXK+tzPuyBIf1ZEjtCQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XG2lc+wz4VdLwgbXkubgCpRLRqk0BwgnIxzGCiuMNolTNvAolJSo15QVb8uPI6Wtk7puDZqfadQS9cmD4XgP4b+ooECFrBWAszuWRek0D/R9XnLju87Hxiha7Ls+xZ03+Y2NiZ8afTmGkKdLSO8MNIWfh2vG3oRvJi3azvEXotU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WqLpd0Wvcz1S8Yt;
	Thu, 22 Aug 2024 19:39:53 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 48FC118001B;
	Thu, 22 Aug 2024 19:39:57 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 19:39:56 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to simplify code
Date: Thu, 22 Aug 2024 19:26:48 +0800
Message-ID: <20240822112649.58376-2-zhangzekun11@huawei.com>
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

for_each_child_of_node_scoped() can put the device_node
automaticly. So, using it to make the code logic more simple
and remove the device_node clean up code.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 sound/soc/generic/audio-graph-card.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 3425fbbcbd7e..30152a681aa8 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -363,7 +363,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node = dev->of_node;
 	struct device_node *cpu_port;
-	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
@@ -373,14 +372,9 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	/* loop for all listed CPU port */
 	of_for_each_phandle(&it, rc, node, "dais", NULL, 0) {
 		cpu_port = it.node;
-		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
-
+		for_each_child_of_node_scoped(cpu_port, cpu_ep) {
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
 			codec_port = ep_to_port(codec_ep);
@@ -410,10 +404,8 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 			of_node_put(codec_ep);
 			of_node_put(codec_port);
 
-			if (ret < 0) {
-				of_node_put(cpu_ep);
+			if (ret < 0)
 				return ret;
-			}
 
 			codec_port_old = codec_port;
 		}
-- 
2.17.1

