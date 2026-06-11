Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DC3E7BD5
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179184; cv=none; b=d6b9tQRgFDjq+yRsdh/QJ2cW/jHP+MiM+AW6DYGbXnI4gfm/16b/4J55Bmy0S/sQ+H3r0akxXAUb+BzDqS0WoeBSedfDk6oAULbPNQ2Z4MCV2BO3wi9+mgztSxV/dkT0XbtiFCmzYtkHnb96VUytrlGIe0x+eWGNs7Fa994unkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179184; c=relaxed/simple;
	bh=NLomaQ6f9h66TtxmjBp23SzjugOKhbrbx2uoTdQ2ghw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB7Ohzb74EFth+J3AskktrXeqqJOmr8/KarZO3Q+S1TPSXMAarENFhpkhCQxHvftH5Ymh2ddFYG0XDcD3q7+6yOvjxdq/GkHwPGCWCzy/hRIYfSLu9ZF+V/u6mkGG5bdhNjXODIL2gzjTIEQ7j/6Dy2hrxDRmRYKNNwEm8jEotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcH71aWd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcH71aWd"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso4763085a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179182; x=1781783982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwQ0QPbBob43h3NKRSqkYp6Cl8ZSaH3nArrp0e8EZ4g=;
        b=ZcH71aWdIoWePTM5xsvv9pG5Fm4B/YNoN0zyPNEykfCGSWEOt8WY+BwtI+UGWxLH++
         jTrzdB3Fie2/4XUs5FFI8aYwiNuGVC2lritUNVQdvbj4H0jZbA9cZzKMIH8v/R19dX4o
         AKAbrxHUX9TjxOFq4jE3n130PEifXV61mFG7RcWXDGjz++5Qx8vUpluc4wn1fQVbjQID
         UVKNEFMPuM8nsJZjFsBviJIQU839SZRn9AEuba+pCBLtUJ0L0J9jZhwqhqz5tPngWWVi
         W93RVXXZOZS/j5pIa2J0gIKjxdA/YzrGvj/T1Jrgc00kRsCjyfaRlNOdMRIsvgCMgLHS
         df2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179182; x=1781783982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dwQ0QPbBob43h3NKRSqkYp6Cl8ZSaH3nArrp0e8EZ4g=;
        b=FXWG0/DQelCmMxF8prayik4U6TVIIn9ikHYvjCkh2yNYqqZOQb9KOIG7wSQO6jgdmi
         LeRyD0u7ULFw4kwIj75feRv1X/nD/uZbLxb/u3Mczbgrg0BHnOBT4QUgV/WbudCf/64J
         TXFuywwOdFeYA6kI6Y7dkiM09p+ufPk8tX1pxPHPIUmhYgkGbZYLo45GAkSg/R3eyesk
         +a7rqOFrMKJCtQfRyiyFxUBTW32Ad5KRaCc56xMP7PJjfsaAJIGv0pxW29CzgzGj56As
         dE4tN/XHVylNmo55HK1Lf5HI5K/WnsXi/r/1IB5LYKKAADndmf3vSjJC7NFk1Iyq04eg
         7CXA==
X-Forwarded-Encrypted: i=1; AFNElJ9XUCYmXVzRaXu7xzQ0D1B8AolF3okzH0nMmkwmXMX/rNd3aQ8n2Rc6sqhfTUc214zZvEe6uOz3ys0nzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFUCdjcA9xOZg2CxFkGbEAsCRRIYqiBZ6xrK4hfYiW0778JhN
	QZqSLQhjPh7xOk7WAbo342puNvxXHnznkqNnFePeGDSF+Sxyh2GLmTPb
X-Gm-Gg: Acq92OGozKfALxxWKxKbxNRpdYQoCm2alkf3V0c1y4aQNeRmrvmUSpMVqUpgg3vvBmy
	Zd9jqK5Tvc1hE7rOsSwgaP++hX6qAhxPamShYvG+6ELj7K9wK5VCSKJu7OG58OHlXW/iteMeDdT
	49EwpbIrd5mgroaidgkfd7P0g5KV/Jj7r8U4Mi+5Bq8Xt7HB4Xe6mh9LFtWj330783A9Kama+Xj
	9kO3FEHJTTTXrUGgIHlNtzoxLCfluY25ojlnbmCY0wFrQO6TqXHWo9ks4d2ZKqeMcPGoWtsJSKg
	6LMM6Bpsh4g/fhkEVS368A8vWMtfta9zfvwLr9C88BHMKRUF22ebRYNVOEjIMwQ509orlY5N4n6
	hAe2obMqx5ZJuXxaMUGZCnUKvdlc229fRYZGusnU7hV4asWxQB2b9SELB7W9Z4r7SbEX2CFnT5E
	BNIO3eyejuVCxu1WJh4DyNrebYe0FkL1DhX5sJo2ApNpHYoC1S6EHv/tpkpUpb+G45XEmeXW1lZ
	H2fswk=
X-Received: by 2002:a17:90b:498d:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-3779e231174mr2810185a91.9.1781179182120;
        Thu, 11 Jun 2026 04:59:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/20] ASoC: Intel: avs: path: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:47 +0700
Message-ID: <20260611115901.80438-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/path.c | 39 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 2291f9728a54..4f78df93a24d 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -69,16 +69,13 @@ avs_path_find_path(struct avs_dev *adev, const char *name, u32 template_id)
 	if (!template)
 		return NULL;
 
-	spin_lock(&adev->path_list_lock);
+	guard(spinlock)(&adev->path_list_lock);
 	/* Only one variant of given path template may be instantiated at a time. */
 	list_for_each_entry(path, &adev->path_list, node) {
-		if (path->template->owner == template) {
-			spin_unlock(&adev->path_list_lock);
+		if (path->template->owner == template)
 			return path;
-		}
 	}
 
-	spin_unlock(&adev->path_list_lock);
 	return NULL;
 }
 
@@ -1121,9 +1118,8 @@ static int avs_path_init(struct avs_dev *adev, struct avs_path *path,
 		list_add_tail(&ppl->node, &path->ppl_list);
 	}
 
-	spin_lock(&adev->path_list_lock);
-	list_add_tail(&path->node, &adev->path_list);
-	spin_unlock(&adev->path_list_lock);
+	scoped_guard(spinlock, &adev->path_list_lock)
+		list_add_tail(&path->node, &adev->path_list);
 
 	return 0;
 }
@@ -1157,9 +1153,8 @@ static void avs_path_free_unlocked(struct avs_path *path)
 {
 	struct avs_path_pipeline *ppl, *save;
 
-	spin_lock(&path->owner->path_list_lock);
-	list_del(&path->node);
-	spin_unlock(&path->owner->path_list_lock);
+	scoped_guard(spinlock, &path->owner->path_list_lock)
+		list_del(&path->node);
 
 	list_for_each_entry_safe(ppl, save, &path->ppl_list, node)
 		avs_path_pipeline_free(path->owner, ppl);
@@ -1305,7 +1300,7 @@ void avs_path_free(struct avs_path *path)
 	struct avs_path *cpath, *csave;
 	struct avs_dev *adev = path->owner;
 
-	mutex_lock(&adev->path_mutex);
+	guard(mutex)(&adev->path_mutex);
 
 	/* Free all condpaths this path spawned. */
 	list_for_each_entry_safe(cpath, csave, &path->source_list, source_node)
@@ -1314,8 +1309,6 @@ void avs_path_free(struct avs_path *path)
 		avs_condpath_free(path->owner, cpath);
 
 	avs_path_free_unlocked(path);
-
-	mutex_unlock(&adev->path_mutex);
 }
 
 struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
@@ -1334,13 +1327,13 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 	}
 
 	/* Serialize path and its components creation. */
-	mutex_lock(&adev->path_mutex);
+	guard(mutex)(&adev->path_mutex);
 	/* Satisfy needs of avs_path_find_tplg(). */
-	mutex_lock(&adev->comp_list_mutex);
+	guard(mutex)(&adev->comp_list_mutex);
 
 	path = avs_path_create_unlocked(adev, dma_id, variant);
 	if (IS_ERR(path))
-		goto exit;
+		return path;
 
 	ret = avs_condpaths_walk_all(adev, path);
 	if (ret) {
@@ -1348,10 +1341,6 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 		path = ERR_PTR(ret);
 	}
 
-exit:
-	mutex_unlock(&adev->comp_list_mutex);
-	mutex_unlock(&adev->path_mutex);
-
 	return path;
 }
 
@@ -1496,15 +1485,13 @@ static void avs_condpaths_pause(struct avs_dev *adev, struct avs_path *path)
 {
 	struct avs_path *cpath;
 
-	mutex_lock(&adev->path_mutex);
+	guard(mutex)(&adev->path_mutex);
 
 	/* If either source or sink stops, so do the attached conditional paths. */
 	list_for_each_entry(cpath, &path->source_list, source_node)
 		avs_condpath_pause(adev, cpath);
 	list_for_each_entry(cpath, &path->sink_list, sink_node)
 		avs_condpath_pause(adev, cpath);
-
-	mutex_unlock(&adev->path_mutex);
 }
 
 int avs_path_pause(struct avs_path *path)
@@ -1560,7 +1547,7 @@ static void avs_condpaths_run(struct avs_dev *adev, struct avs_path *path, int t
 {
 	struct avs_path *cpath;
 
-	mutex_lock(&adev->path_mutex);
+	guard(mutex)(&adev->path_mutex);
 
 	/* Run conditional paths only if source and sink are both running. */
 	list_for_each_entry(cpath, &path->source_list, source_node)
@@ -1572,8 +1559,6 @@ static void avs_condpaths_run(struct avs_dev *adev, struct avs_path *path, int t
 		if (cpath->source->state == AVS_PPL_STATE_RUNNING &&
 		    cpath->sink->state == AVS_PPL_STATE_RUNNING)
 			avs_condpath_run(adev, cpath, trigger);
-
-	mutex_unlock(&adev->path_mutex);
 }
 
 int avs_path_run(struct avs_path *path, int trigger)
-- 
2.43.0

