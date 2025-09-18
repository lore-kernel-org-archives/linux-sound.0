Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889522A4FC
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203814; cv=none; b=BzzXYuQFDciyvCls53ai4Lgg0re4Qz6zJ6546o4Zvhma/mzmSRi9zwgmxY1V1LPaxvfjRtIDUbEgwQtGgB+Wez5Dre2o8Xv1xnWXWg0UsMutINqZhaB3Xb14yjVtLYsxU6GmUFTc86VOYQJnzWka7CCt8rgzWzp10InlPw5LYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203814; c=relaxed/simple;
	bh=NEzzxKBDdqFQLfhVjZohirqq7fa7nDjncux9WxjLShM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1jaR+4negOT1vfMJ3fMr55+DJQGNcevI2cmsWFZfIKXLnwloHNnoIPt70BRLL4+T+fi0pKyqguQlcV8E9BaCjNd+5yV1k7xt/GtlQmt3+2e+ty9Vj349iviJvASttf9Vy0o7ts/+nVuXalIJj87zBL6xDG8eQ7kf48EqJMluiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFSvQwzu; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFSvQwzu"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso961712b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758203812; x=1758808612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7K9ht8wqxFgnc1Z8YPXX/7XbpSKNOobNT9NVU2DNjlw=;
        b=BFSvQwzukxVAVdloBMJWqw2pP86emcxJUMzqRKQ7L5grURAaxoTxZ6gc2dli5wvfnR
         czwSpMqkaWC2nLWrGCo/k+gOgDnd1u9I/Qwh3RHuIN6yYnyRB4RugbjELkPrtM9cgDfi
         14JDcWydAF3WUqtT3qUVvXR4gTuGwCqWx0pvHpqB/S2AJqhot59zgyYKF5uBpo2rFAwQ
         W5lVeNC+M9oAQGINCaRawg/d3byJY75GlbFvgo/juhowP+Y+ru7o2Y1kXyZxOA48qG2D
         +SMuDBDRoTHrPPe8grRAvtR/hFORS/25wXF5CfhK++//aeN1zP/pv9PxS0dJHHlnZmx5
         kMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203812; x=1758808612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K9ht8wqxFgnc1Z8YPXX/7XbpSKNOobNT9NVU2DNjlw=;
        b=SoIsdeZgm1CgVufRSfLQd7+UcBNpWP26mHc58dOt7WaTDvzkPa4FTGf9zhMnmSabWY
         /WaLdzudwnUgJVCyeNGf6rAhtC7uxxzHIu60aNYk7GnxXuThfD/UG2c9ycIrkgn7GaP1
         KxYnEbJpbd2Wj47e5ASlQxGjgi2z3FNFqoh+uREBmBaeqp5w3Axfy3iIadR/uPqmzNcK
         /XDbqjDgRmQyg9NrZ/MBfGnvhcYVGHotjN6LYE97OLiFQ6N2l+c6IZpoKfSPcdXDx7md
         gDQuH93JsnKLksvV39WDTNDyk0wYQeBEOQH7ZmC8sIKxS+1JGdVi9ZKkcK79TfJf4MsO
         HziQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhvs39pQMIRDRJZgPkIISu8XM2nzBVHDVEzSfKStmbcyXyM/2O+k5qXybOx6ey1g2dlzr1tTkYZa1Xjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEK22sJt39cTgBTwe/LEPhhLcTOQCrb7MdUkpu3RZi+2mPIQ2V
	lnx/KY1eYoDrHYu5mtWWHV1hrwzY6jkDiwrRN/KtgsVLs7b8BblyLgvNDHAonDSsPig=
X-Gm-Gg: ASbGncv2+gfg1W6xa/cdGg9/itobe1/HkrOPcAMvhwPggvQ2VY3V/E7NHS2KRpdKjB0
	W7SSr5GPTgyRJQHYvkWkyJwFIRJEFGN4m77eTu051vU4NCNwp93sx93oXtrS4vgitqnXgKMu6Vh
	YKJdanwxEvfP3gD9t2SwkZUg2VQJF/d+gbbRCSlRn+ovsj++UOSC5mCdAiH2qN8jxfoU4FiYP3l
	jvJr9OS155FM/v2Em/TBsSHu2+bor6kArGH7Ff2I+cmqQLzp+bOed4G7fgvHCx1Apqcvhjd/N0y
	AY407VKG8H4kM5xXi4l+lScHypt3aCZgUApJY1RZ5mcufU5n+aguTLZiu6Aq6rR5g2emQrB5px0
	IkJIPYYykUV5i3OldAsDlwJ03pKirHsHxpMUuydFaC4v2D8/va9tl
X-Google-Smtp-Source: AGHT+IFM5PbYICeKL5KtPY0OGrSYfAyL/yLW+1e+dl8Ua11+SgxW+x8+VWlbzbax8n+vuSojVrJdxg==
X-Received: by 2002:a05:6a20:548d:b0:263:b547:d0a6 with SMTP id adf61e73a8af0-27aa5b7d846mr9490474637.36.1758203812356;
        Thu, 18 Sep 2025 06:56:52 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:70da:6ea2:4e14:821e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff373380sm2390718a12.13.2025.09.18.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:56:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: Intel: avs: Add check for kcalloc() when setting constraints
Date: Thu, 18 Sep 2025 21:56:27 +0800
Message-ID: <20250918135627.3576836-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kcalloc() may fail. avs_path_set_constraint() writes to rlist[i],
clist[i], and slist[i] unconditionally, which can cause a NULL pointer
dereference under low-memory conditions.

Add checks for the three kcalloc() calls. If any allocation fails,
free any previously allocated lists and return -ENOMEM.

Fixes: f2f847461fb7 ("ASoC: Intel: avs: Constrain path based on BE capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/intel/avs/path.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index cafb8c6198be..cb641d37d565 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -135,6 +135,9 @@ int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template
 	clist = kcalloc(i, sizeof(clist), GFP_KERNEL);
 	slist = kcalloc(i, sizeof(slist), GFP_KERNEL);
 
+	if (!rlist || !clist || !slist)
+		return -ENOMEM;
+
 	i = 0;
 	list_for_each_entry(path_template, &template->path_list, node) {
 		struct avs_tplg_pipeline *pipeline_template;
-- 
2.43.0

