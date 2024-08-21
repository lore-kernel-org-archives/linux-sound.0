Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF6192D63
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223653; cv=none; b=AOop/hsQBUxv9r4nAuaJzyjDQV1V+mCjanjFvyldHtGHZwupXLhqe4hL4SOrVBI0oZFGuQB/Ddi2/jt+XIJBj82jBIBIR5shRB3fo2hE9vmoPYd1wUuPAhJnLfmyyDRkKyUgaEKC7A0dGl1LstZhbyC99suMKrWRFcBcTDsHAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223653; c=relaxed/simple;
	bh=Efohe42vAuAor80qMzZo3RBzR9BzV0xqithNlsU6+lk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMwsH+yWZb44M7drH7NJ/GFLx5C45+/RdKcI6/8hWaPHhp1BH+AXLG5CV61XHY+8s1yUuY+/Zd6hyjuHN4FEMI7bEk2PRc/5BT/9Rr575nbyQJTjHAc4YO1CAr98PalaPyp8H5RoUPDM3FFv0nGQF9Z8KRDVt7g6XlHn3s7halc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WpcYf0nkmz20m68;
	Wed, 21 Aug 2024 14:56:06 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 968A91401F3;
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
Subject: [PATCH -next 3/5] sound/soc remove unused substream in macro soc_dai_mark_pop
Date: Wed, 21 Aug 2024 15:08:13 +0800
Message-ID: <20240821070815.2326534-4-lihongbo22@huawei.com>
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

The soc_dai_mark_pop don't need substream, and also
substream is not used in this macro, so we can remove it.
This is detected by macro_checker.py script.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/soc-dai.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 302ca753a1f3..4000385e0863 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -37,7 +37,7 @@ static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
  * In such case, we can update these macros.
  */
 #define soc_dai_mark_push(dai, substream, tgt)	((dai)->mark_##tgt = substream)
-#define soc_dai_mark_pop(dai, substream, tgt)	((dai)->mark_##tgt = NULL)
+#define soc_dai_mark_pop(dai, tgt)	((dai)->mark_##tgt = NULL)
 #define soc_dai_mark_match(dai, substream, tgt)	((dai)->mark_##tgt == substream)
 
 /**
@@ -416,7 +416,7 @@ void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 		dai->driver->ops->hw_free(substream, dai);
 
 	/* remove marked substream */
-	soc_dai_mark_pop(dai, substream, hw_params);
+	soc_dai_mark_pop(dai, hw_params);
 }
 
 int snd_soc_dai_startup(struct snd_soc_dai *dai,
@@ -453,7 +453,7 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 		dai->driver->ops->shutdown(substream, dai);
 
 	/* remove marked substream */
-	soc_dai_mark_pop(dai, substream, startup);
+	soc_dai_mark_pop(dai, startup);
 }
 
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
@@ -678,7 +678,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			r = soc_dai_trigger(dai, substream, cmd);
 			if (r < 0)
 				ret = r; /* use last ret */
-			soc_dai_mark_pop(dai, substream, trigger);
+			soc_dai_mark_pop(dai, trigger);
 		}
 	}
 
@@ -742,7 +742,7 @@ void snd_soc_dai_compr_shutdown(struct snd_soc_dai *dai,
 		dai->driver->cops->shutdown(cstream, dai);
 
 	/* remove marked cstream */
-	soc_dai_mark_pop(dai, cstream, compr_startup);
+	soc_dai_mark_pop(dai, compr_startup);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_compr_shutdown);
 
-- 
2.34.1

