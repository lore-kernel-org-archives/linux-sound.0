Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2A3EC2EB
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179171; cv=none; b=oYLUG53vuu88RcvrHPKlUkcctFBszU5Mbsap5zoc3ftHkQFm1UeqhxycH/QpzDkNhZmqCMzgkjOueYejUrgDkotQ4Ca5BeeTryZ3H5q6XR9v7AaAX4T042afygVnwgAlNIbu1XE0Q8a/XGSHzUdoC8U/3SV7jK5NthLB4gpPRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179171; c=relaxed/simple;
	bh=1F239UYPLIrGy4+qfOtom1X7ZzgTvbBVjLMelsmI0os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Be82Ivwdo++CrrMPFp8T8Slyl3xtMqKHNIRbm5R4ss06/Mvsx4tmmXCrNE8dyFVz7vSi4Ew096jz2BVbGKvaKQrcRmcQUL0mc85SoN1Fuk/xNccXHM7XlqplQVXGXQnHEDrY3fpm/E3gpCn9pr3MAJ/CDaApPGH7G8k1bp4e1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaairMlD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaairMlD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so5147622a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179170; x=1781783970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LGwl9Ca/ahgzdKu9eaaXl5zm9WU2DHHXPH7cdDgJKE=;
        b=aaairMlDY1bEeCaBzCoM0LwiE6Fop345SP3lX9criavKfMQznBpkzVuOcflqaq9jRO
         icgUH81q6bj81SWbUBoz2zWeYUcqIkEbUUA+jRKqclthUGyNwGiViVY7FS1/ruZQQ8yR
         m45r/ml11rwzd+O0nc7pGRcWiFKracRM79vtenlPF5R5YAOUA09nwKWJfO95NNroE7x7
         nAOVU/1iVEpQwJYN0N4YA2o7Al8jhRMqfAP8L/yAx4ISApPkDb4dza/wz7HFvT2KJmu1
         Vunv8FGRC2F07wfv01CvcuW4VSznlf9JTHisJNXO87jGQUo+uyOd2VvFG9HB6EL9Dgne
         lr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179170; x=1781783970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LGwl9Ca/ahgzdKu9eaaXl5zm9WU2DHHXPH7cdDgJKE=;
        b=U/Tm+B9MKd3YggCv5sM/QIUA/RmfLhm7qQTOb2o/9DrnKUSEUeg5rh8vOZdLPWatKR
         nVjwujCQgisyioMNn9feYKzwoRWeeOIH9qjD5JUrKMiL5C1unLQ4IwAud4KYr1P2XHtX
         oYHwb+qXy2EKVIBpXkPgNVHbKT7bRWwI7Y7v8M/I237pULtIkDtHTCk4MSRW/VKQbMzG
         PJdjCPuVKTgltYHeqtUWMdQB8N2I0/tdH40YuEkvTl7niDXUai0Z6b1JX/NvpimwZEwt
         ZWAa5cwn0rexW5blZhAgWyPRAqqeST+E9wj1ya/iUwGLXodj3+ZgSTv1fLXf8xcJ5N9O
         zABQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yf7Qk5uN3IjExdqNFs2nC5WS+blZmhXQYbVw4O4tz0eQsmtdMdINn//q87KR6LgnCVux0MhfxF92xmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7i1fU4tlyx4HMcAvnhAq8StAAaYmeYjOm+J5G4byeoCJ42y8T
	zVse96qXfLtzY+iAcDvjEtaJlpKW6EWnp3e2jmJL0iirHNNCi330fLiw
X-Gm-Gg: Acq92OFtaCwx5C8Oz2cLIQkv4GS9yPme8dvS+eTY56V3xh7MWyQFD+wMC3OhbujrNdr
	9uwfDhrC/rDUb33MzLIlBElxaR/YAyTtWpmOveuE+j+HPx4hcz8g2rXoHkCjNxAcqYQpBn5nm/l
	+6gJCvOvJrpekFrc5o+P/aFM3gRcGtqvdUnpEyiXm5K7j1GEtxviwjlm/UEkD24c0uzo4eKnjHO
	WBx7YkPqVFvFuDeo45EOA5ZvzcJunFTZ8LcfK+tjKiVzz9CiSey5PiJLLwJ31/C5kfUd5AmFkI6
	CG8yTBltWp4GTO/xelSv5McSDDfdNLaxffpg8N30PAT5v4jsafLRzw7cjmGTPZK9xFl36LzQ24q
	Xfj7FDayiz1aqhLDu5AAzPWc1aFv+qJIElEnMUgVexeoKyWjsSmupmhUlnkbMWK9cADBcK3HrwL
	YtbrciXqHcYTWqkcRbYS/1FUcFF6jtTxlV3/tr/6SN++WHP3PAMyEgXTPClBVXDbBjXDyW
X-Received: by 2002:a17:90b:3f48:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-377abda15cdmr2867265a91.24.1781179169639;
        Thu, 11 Jun 2026 04:59:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:29 -0700 (PDT)
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
Subject: [PATCH 03/20] ASoC: Intel: avs: utils: Use guard() for mutex locks
Date: Thu, 11 Jun 2026 18:58:44 +0700
Message-ID: <20260611115901.80438-4-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/utils.c | 39 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index ee36725ac731..ca1236731824 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -48,13 +48,12 @@ int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_mo
 {
 	int idx;
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	idx = avs_module_entry_index(adev, uuid);
 	if (idx >= 0)
 		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
 
-	mutex_unlock(&adev->modres_mutex);
 	return (idx < 0) ? idx : 0;
 }
 
@@ -62,13 +61,12 @@ int avs_get_module_id_entry(struct avs_dev *adev, u32 module_id, struct avs_modu
 {
 	int idx;
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	idx = avs_module_id_entry_index(adev, module_id);
 	if (idx >= 0)
 		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
 
-	mutex_unlock(&adev->modres_mutex);
 	return (idx < 0) ? idx : 0;
 }
 
@@ -86,13 +84,12 @@ bool avs_is_module_ida_empty(struct avs_dev *adev, u32 module_id)
 	bool ret = false;
 	int idx;
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	idx = avs_module_id_entry_index(adev, module_id);
 	if (idx >= 0)
 		ret = ida_is_empty(adev->mod_idas[idx]);
 
-	mutex_unlock(&adev->modres_mutex);
 	return ret;
 }
 
@@ -163,50 +160,44 @@ int avs_module_info_init(struct avs_dev *adev, bool purge)
 	if (ret)
 		return AVS_IPC_RET(ret);
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	ret = avs_module_ida_alloc(adev, info, purge);
 	if (ret < 0) {
 		dev_err(adev->dev, "initialize module idas failed: %d\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	/* Refresh current information with newly received table. */
 	kfree(adev->mods_info);
 	adev->mods_info = info;
 
-exit:
-	mutex_unlock(&adev->modres_mutex);
 	return ret;
 }
 
 void avs_module_info_free(struct avs_dev *adev)
 {
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	avs_module_ida_destroy(adev);
 	kfree(adev->mods_info);
 	adev->mods_info = NULL;
-
-	mutex_unlock(&adev->modres_mutex);
 }
 
 int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
 {
 	int ret, idx, max_id;
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	idx = avs_module_id_entry_index(adev, module_id);
 	if (idx == -ENOENT) {
 		dev_err(adev->dev, "invalid module id: %d", module_id);
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 	max_id = adev->mods_info->entries[idx].instance_max_count - 1;
 	ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
-exit:
-	mutex_unlock(&adev->modres_mutex);
+
 	return ret;
 }
 
@@ -214,17 +205,13 @@ void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id)
 {
 	int idx;
 
-	mutex_lock(&adev->modres_mutex);
+	guard(mutex)(&adev->modres_mutex);
 
 	idx = avs_module_id_entry_index(adev, module_id);
-	if (idx == -ENOENT) {
+	if (idx == -ENOENT)
 		dev_err(adev->dev, "invalid module id: %d", module_id);
-		goto exit;
-	}
-
-	ida_free(adev->mod_idas[idx], instance_id);
-exit:
-	mutex_unlock(&adev->modres_mutex);
+	else
+		ida_free(adev->mod_idas[idx], instance_id);
 }
 
 /*
-- 
2.43.0

