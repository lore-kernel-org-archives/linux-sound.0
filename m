Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D06192D68
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223652; cv=none; b=dAQTa+Dh2Pr7IAYg6euhWfo43jvrVqfXJbhz/uCUUoMvbxlW6pKHBg7Hf6NORPz7B7DXMoU8cpbFqOm5wWUqUGY1anBNrDmMRH0x4LN1C3z+X8/bVKBcunAMuEmTGM9fpVsvwzAfqXuARgmonJcwEle4ZD1oLAP6jnqOx/cYNz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223652; c=relaxed/simple;
	bh=piXbiGVvY4Z7McD5MuSb1uPg8CaOYhJJ02CXfa8WQVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u36hLqIMLcWWFVLHI+uaGLvNo+AsX1fAiD03ku37M6EM4kc8A2gikVs60Qshp43puNoFu9l+k9XwnaA3+6Tx/7p44cYkRBT3GFrP7LQfCxHpxIulnUiwGByVRfeesuhIAH+AWY1n39PRUSTLY0PMo3VytTTORIUDSPv+IVnV9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpcdJ2HyVzpTMd;
	Wed, 21 Aug 2024 14:59:16 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7636518006C;
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
Subject: [PATCH -next 2/5] sound/soc remove unused substream in macro soc_component_mark_pop
Date: Wed, 21 Aug 2024 15:08:12 +0800
Message-ID: <20240821070815.2326534-3-lihongbo22@huawei.com>
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

The soc_component_mark_pop don't need substream, and also
substream is not used in this macro, so we can remove it.
This is detected by macro_checker.py script.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/soc-component.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b3d7bb91e294..b67ef78f405c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -58,7 +58,7 @@ static inline int soc_component_field_shift(struct snd_soc_component *component,
  * In such case, we can update these macros.
  */
 #define soc_component_mark_push(component, substream, tgt)	((component)->mark_##tgt = substream)
-#define soc_component_mark_pop(component, substream, tgt)	((component)->mark_##tgt = NULL)
+#define soc_component_mark_pop(component, tgt)	((component)->mark_##tgt = NULL)
 #define soc_component_mark_match(component, substream, tgt)	((component)->mark_##tgt == substream)
 
 void snd_soc_component_set_aux(struct snd_soc_component *component,
@@ -339,7 +339,7 @@ void snd_soc_component_module_put(struct snd_soc_component *component,
 		module_put(component->dev->driver->owner);
 
 	/* remove the mark from module */
-	soc_component_mark_pop(component, mark, module);
+	soc_component_mark_pop(component, module);
 }
 
 int snd_soc_component_open(struct snd_soc_component *component,
@@ -370,7 +370,7 @@ int snd_soc_component_close(struct snd_soc_component *component,
 		ret = component->driver->close(component, substream);
 
 	/* remove marked substream */
-	soc_component_mark_pop(component, substream, open);
+	soc_component_mark_pop(component, open);
 
 	return soc_component_ret(component, ret);
 }
@@ -515,7 +515,7 @@ void snd_soc_component_compr_free(struct snd_soc_component *component,
 		component->driver->compress_ops->free(component, cstream);
 
 	/* remove marked substream */
-	soc_component_mark_pop(component, cstream, compr_open);
+	soc_component_mark_pop(component, compr_open);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_free);
 
@@ -1210,7 +1210,7 @@ void snd_soc_pcm_component_hw_free(struct snd_pcm_substream *substream,
 		}
 
 		/* remove marked substream */
-		soc_component_mark_pop(component, substream, hw_params);
+		soc_component_mark_pop(component, hw_params);
 	}
 }
 
@@ -1254,7 +1254,7 @@ int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 			r = soc_component_trigger(component, substream, cmd);
 			if (r < 0)
 				ret = r; /* use last ret */
-			soc_component_mark_pop(component, substream, trigger);
+			soc_component_mark_pop(component, trigger);
 		}
 	}
 
@@ -1294,7 +1294,7 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 		pm_runtime_put_autosuspend(component->dev);
 
 		/* remove marked stream */
-		soc_component_mark_pop(component, stream, pm);
+		soc_component_mark_pop(component, pm);
 	}
 }
 
-- 
2.34.1

