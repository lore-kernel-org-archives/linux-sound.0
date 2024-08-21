Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D32192D69
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223651; cv=none; b=Pz8a3OQeXJWFlvZFSiIwU7hg9cUYKa0kRpxqK2wGALNyae1+14LK3MUXQHpuCzTxBLp0IhRuJ/wwn4feeS40SugW8GRy37tY/Qreh7v5O35gQ96wVXe7iDOKPAeCrhnhCnFWvAnWnH7Fb73qhzuEWtWpRozq8yHmHJshwCbSXvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223651; c=relaxed/simple;
	bh=YMTcMRAmuMV/qyUnZuT+QygntPpHZMYDL7Q6RWLxqG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZWSBoeBrhVFmreT7lfEMry2DlDqNto9A5yQ88wl9U8yX1RiYi1WlWpZFw8EqcKir1/vDMIMYTj13JNwU7AxoI5mtw/QKK+N5wiLljLc3Rb7wyidbtL/jTufo2G8lhs/dlE6IkW2AvROaj0nVf2BL1RBfrpsDIPLiQmfnBln76UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpcdJ49KXzpTPd;
	Wed, 21 Aug 2024 14:59:16 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id B70961401F4;
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
Subject: [PATCH -next 4/5] sound/soc remove unused substream in macro soc_link_mark_pop
Date: Wed, 21 Aug 2024 15:08:14 +0800
Message-ID: <20240821070815.2326534-5-lihongbo22@huawei.com>
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

The soc_link_mark_pop don't need substream, therefore we can
remove it.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/soc-link.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index fee4022708bc..7f1f1bc717e2 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -35,7 +35,7 @@ static inline int _soc_link_ret(struct snd_soc_pcm_runtime *rtd,
  * In such case, we can update these macros.
  */
 #define soc_link_mark_push(rtd, substream, tgt)		((rtd)->mark_##tgt = substream)
-#define soc_link_mark_pop(rtd, substream, tgt)		((rtd)->mark_##tgt = NULL)
+#define soc_link_mark_pop(rtd, tgt)		((rtd)->mark_##tgt = NULL)
 #define soc_link_mark_match(rtd, substream, tgt)	((rtd)->mark_##tgt == substream)
 
 int snd_soc_link_init(struct snd_soc_pcm_runtime *rtd)
@@ -94,7 +94,7 @@ void snd_soc_link_shutdown(struct snd_pcm_substream *substream,
 		rtd->dai_link->ops->shutdown(substream);
 
 	/* remove marked substream */
-	soc_link_mark_pop(rtd, substream, startup);
+	soc_link_mark_pop(rtd, startup);
 }
 
 int snd_soc_link_prepare(struct snd_pcm_substream *substream)
@@ -138,7 +138,7 @@ void snd_soc_link_hw_free(struct snd_pcm_substream *substream, int rollback)
 		rtd->dai_link->ops->hw_free(substream);
 
 	/* remove marked substream */
-	soc_link_mark_pop(rtd, substream, hw_params);
+	soc_link_mark_pop(rtd, hw_params);
 }
 
 static int soc_link_trigger(struct snd_pcm_substream *substream, int cmd)
@@ -175,7 +175,7 @@ int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 			break;
 
 		ret = soc_link_trigger(substream, cmd);
-		soc_link_mark_pop(rtd, substream, startup);
+		soc_link_mark_pop(rtd, startup);
 	}
 
 	return ret;
@@ -209,7 +209,7 @@ void snd_soc_link_compr_shutdown(struct snd_compr_stream *cstream,
 	    rtd->dai_link->compr_ops->shutdown)
 		rtd->dai_link->compr_ops->shutdown(cstream);
 
-	soc_link_mark_pop(rtd, cstream, compr_startup);
+	soc_link_mark_pop(rtd, compr_startup);
 }
 EXPORT_SYMBOL_GPL(snd_soc_link_compr_shutdown);
 
-- 
2.34.1

