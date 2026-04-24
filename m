Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6131E5724
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027848; cv=none; b=BVcfHpweKL+YK7krJI+58dY5R4Mxn4AY9ntDouYs1u4l7YjGPsoNq/ka2dpKDDOxGqaOhqbv4tmVT1areztxNb2qzu2rEVXdSAhOnW/oiXJWhAQlSDzR1BQ8pMIrKxLZnenl/7tgEOd1JNFnyA/Sjph/V/aOCdI5PwH1Y9r5mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027848; c=relaxed/simple;
	bh=pdJenmUgm55PhwI009m5l3PRJ7TmjT7useyTw0jW4bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i15VdSeiYkyZ7yE3Bz4Z7mdjFsoiOOAxCTo8WgmFXhTyT/GNXgYeYlW8CGdCeHN+INeockS11mHOtOoCS0fDdz8yH5BAuOizG4Qy8ZdIAd3ciWWNxblJzYVsVz/QOsgyvRZKi5XrDcdUeLlOkfwgRHOQF5Kb4cBUYITRwjE5V1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ckk/5Mqg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ckk/5Mqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777027847; x=1808563847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pdJenmUgm55PhwI009m5l3PRJ7TmjT7useyTw0jW4bM=;
  b=Ckk/5Mqgyqiosw2+jgYfKnuyfxos6UJcXpM8pW/6G0nrhkWQz4lZl1gi
   zAk5ETbvb1ly9xiZ8zkt80kztpe9tYJnueaoQabk301ZJpX12pPU6pnQB
   ORhxl64SV+vLgcgtXtRqvuJeItcWTyWnN4EjCWLiq1YAZdqyWoDuzTRoq
   fgYlCou6yad8IQLX/Uo2ZtVoNjzwhHib9/KbsvXiT5ASrhf7MEZDgCQzf
   kluwU64/yph6M1A6kaVWuqOM+an5QL1TO82PEyADrA1pva0yiw+rWTFMx
   21gfeROqFK9Zq+ONVHksVAuBQgSuH1qUtjxDmSR1onFNlRs9/Qtfs0Xg1
   Q==;
X-CSE-ConnectionGUID: +ZoCcCRVTpOFxSIgFJGhVg==
X-CSE-MsgGUID: O1wzg95zSU6GqaRBh4yZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77993424"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77993424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:50:46 -0700
X-CSE-ConnectionGUID: DZaI8dYCTo2SILipZgKgTg==
X-CSE-MsgGUID: vomrLGQPQIu2+QFqT+JWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="271050204"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:50:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: add an empty adr_link
Date: Fri, 24 Apr 2026 18:50:31 +0800
Message-ID: <20260424105031.114053-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An empty adr_link is expected to terminate the
for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) loop.
Allocate link_num + 1 links to add an empty adr_link.

Fixes: 5226d19d4cae5 ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sof/intel/hda.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b3d61d973ce4..8662b422eb80 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1412,7 +1412,8 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		link_mask |= BIT(peripherals->array[i]->bus->link_id);
 
 	link_num = hweight32(link_mask);
-	links = devm_kcalloc(sdev->dev, link_num, sizeof(*links), GFP_KERNEL);
+	/* An empty adr_link is needed to terminate the adr_link loop */
+	links = devm_kcalloc(sdev->dev, link_num + 1, sizeof(*links), GFP_KERNEL);
 	if (!links)
 		return NULL;
 
-- 
2.43.0

