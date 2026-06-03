Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA047799C
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487447; cv=none; b=n7s6ky4oMsSD1ugqsnMtQIjPNqNCMex9A6a8KxWAa2HMQXUWIFpFTDaj5B/7WMaaRhLzBPYMdy8nT4jkDHin5Ic13zPjZrYfGPnnPiwVEU/Xmyr3/X5q62+u4CLk9Ck7JfcMumvuo5Xl9yzeG5PZhQfKAp4LdOTyuy5oZ2P7kjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487447; c=relaxed/simple;
	bh=pw1Xomz8P67jYUl18bj/VcuHb5qLX1jm74fDqyanzgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koyk7dykkXNsL42vXAVi2J1RuM5JmFJk380CgstKEMHi/vSvC+w7IEMUlm47iYTIM6epua6301hRbGA4E9pgLqxfQZMLOODLjkYCWd74hRSBir/Wqjc4linDzYXY482iy2qUF/K4bvHn2dqJy6NexVZU4Ut2iRZiJz3NTeC2JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCs1iEYa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCs1iEYa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0bd02d97eso42618475ad.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487446; x=1781092246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL5+qjOA7bv12mhMT3uoOE5lmwvzw8y82TwvGRMCpDE=;
        b=UCs1iEYaELn+qjPDFLJgnNcL+kDTPSFOhU6U7xvJ0DyxlT/zvb7SxulAlt7tjym5dc
         ETvjKcmvaRcbcjtq/bCSp9BTXNjJO41K9fsW4bEAu/QfJsL53YYY2P262qSAUj2044xZ
         7QJIaUHrTGHHxZmrDQPppqWO5VZCU/iATJEfhPFvF3nKIVjqfMEJSmUivZZWK5PtScsN
         hX35Sys4Hb4ybRij+xh0sgXk/yt/9kcqXjQzNKI/D58go9/j2mJPZZ2iKWx9xvkofWQ3
         v8iXz3XrDa2Ab13ix9gBgOeau9DsI08pCLqfOhs7gBp1uUeauDroBr23rjm8X90TJH94
         B42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487446; x=1781092246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rL5+qjOA7bv12mhMT3uoOE5lmwvzw8y82TwvGRMCpDE=;
        b=BRS1sHK/TRQpw134vGvIYsPtFDDDw7o8QV0Gb4SWZD/wPDi53bIknlcySTbdkn6ZHN
         2rHQHqUUp+asb0m1GyVun+AGqn2m/iVG1q/yLmYu9xiqzbqzu8ZBBuAcO+1VSGlYgxoz
         byAZrfQ7YCnZKpwCN4g5161Z/jezZDYqGCXsoUiVTf3pQccXfitHGYGbzq93Djfs5d43
         mFE2BOLcwhI2MlGxUQ0CkIMX8vr79vwHhowuG7+kvPzDB5o2FKP8EF5zn8hBbnYeS2IW
         nzrwrxoNRewxeLQVzj/7jKKcla42herxod04mxnXoxXLw1hU/9M/XRj4+BFXU1rrwYU+
         Lkqg==
X-Forwarded-Encrypted: i=1; AFNElJ9nuwNVIu0KpsoTMjyKmGC2NgaEYdUKNKaNaxBNSmRVSNCoYifkFixJgztumB1E/cnYhB2wEtHSfqA3Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMlsoeZ6k/iCI7ti+AM7PQuXtgrRKP+gmCjO3tdGgSqJt3T6c
	HowGb6wse6J8GnoyEH0l3GNS8VJ12EFRl7FNMGZt0QLReaNSouomoP7F
X-Gm-Gg: Acq92OHrVtB9ryx3WHbzdZVzhoUsHqXqSYOTd7n1atl4nejoHg+vM6G8YMXlUKK2BWC
	TZNhpB1eAkq91HyoZvy8LoSfAvRw1sc30o83WAiS+ovU3KDFsbgkOBrGG47ff9jVcEJdOMGLmD6
	O/naZOGeLckAUiu6rfLMuimxvnmy+gMwutggP1LcPK29VY44z6UKtokcleXo2A866F5yyjtwpoZ
	VeRoifTvjqSOO6UeYpJMJS7eTaQEjtcIhYII/mjMOGmiL9Ou5cNWL+P1TT47Qodg4XiwnJdj+zS
	GbbzJQcgrCdJVE5APnPH4odDBZPLijlc3DiFnEMxktyF68hTwo8jt+WkwlYfeBYnHsC+a3SOKpY
	DZBpiDkdG88SMYRhLJ0YFuAFCWLz3go8llTPPdaYcn0V0AQvbHfV/Aj4nfmaDzMDieXSkScIZJt
	9jtux/SkcolumkTgbEpJ8T5uTZpK+gNG2oyOYZARRFVkztA5ux5ObaPNFLifsfXTOF9Kwl
X-Received: by 2002:a17:903:244c:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c177cdfbfemr14896165ad.37.1780487445843;
        Wed, 03 Jun 2026 04:50:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 9/9] ASoC: qcom: topology: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:49 +0700
Message-ID: <20260603114949.149595-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/topology.c | 71 +++++++++++++++------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 1f69fba6de26..efbbebb8c6d3 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -32,9 +32,8 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 	struct audioreach_graph_info *info;
 	int ret;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, graph_id);
 
 	if (info) {
 		*found = true;
@@ -48,9 +47,8 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 
 	INIT_LIST_HEAD(&info->sg_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Graph ID (%x)\n", graph_id);
@@ -82,9 +80,8 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(-EINVAL);
 
 	/* Find if there is already a matching sub-graph */
-	mutex_lock(&apm->lock);
-	sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
 
 	if (sg) {
 		*found = true;
@@ -98,9 +95,10 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 
 	INIT_LIST_HEAD(&sg->container_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->sub_graphs_idr, sg,
+				&sub_graph_id, sub_graph_id,
+				GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Sub-Graph Instance ID (%x)\n", sub_graph_id);
@@ -124,9 +122,8 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 	if (!container_id)
 		return ERR_PTR(-EINVAL);
 
-	mutex_lock(&apm->lock);
-	cont = idr_find(&apm->containers_idr, container_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		cont = idr_find(&apm->containers_idr, container_id);
 
 	if (cont) {
 		*found = true;
@@ -140,9 +137,10 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 
 	INIT_LIST_HEAD(&cont->modules_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->containers_idr, cont, &container_id, container_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->containers_idr, cont,
+				&container_id, container_id,
+				GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Container Instance ID (%x)\n", container_id);
@@ -167,9 +165,8 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	struct audioreach_module *mod;
 	int ret;
 
-	mutex_lock(&apm->lock);
-	mod = idr_find(&apm->modules_idr, module_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		mod = idr_find(&apm->modules_idr, module_id);
 
 	if (mod) {
 		*found = true;
@@ -180,15 +177,17 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	if (!mod)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_lock(&apm->lock);
-	if (!module_id) { /* alloc module id dynamically */
-		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
-				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
-				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
-	} else {
-		ret = idr_alloc_u32(&apm->modules_idr, mod, &module_id, module_id, GFP_KERNEL);
+	scoped_guard(mutex, &apm->lock) {
+		if (!module_id) { /* alloc module id dynamically */
+			ret = idr_alloc_cyclic(&apm->modules_idr, mod,
+					       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
+					       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
+		} else {
+			ret = idr_alloc_u32(&apm->modules_idr, mod,
+					&module_id, module_id,
+					GFP_KERNEL);
+		}
 	}
-	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Module Instance ID (%x)\n", module_id);
@@ -966,7 +965,7 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 
 	cont = mod->container;
 
-	mutex_lock(&apm->lock);
+	guard(mutex)(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
 	cont->num_modules--;
 
@@ -997,8 +996,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		}
 	}
 
-	mutex_unlock(&apm->lock);
-
 	return 0;
 }
 
@@ -1106,9 +1103,8 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
 {
 	struct audioreach_graph_info *info;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, m2->graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, m2->graph_id);
 
 	if (connect) {
 		info->src_mod_inst_id = m1->module_instance_id;
@@ -1130,9 +1126,8 @@ static bool audioreach_is_vmixer_connected(struct q6apm *apm,
 {
 	const struct audioreach_graph_info *info;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, m2->graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, m2->graph_id);
 
 	if (info->dst_mod_inst_id == m2->module_instance_id &&
 	    info->src_mod_inst_id == m1->module_instance_id)
-- 
2.43.0

