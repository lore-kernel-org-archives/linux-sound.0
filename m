Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D8261B91
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303305; cv=none; b=h+o25qX5erQXxyJiipETKSECH0S3PjJKxU4mr6B8jMaJlorUHU56k4j82GLx1nagb0tZj1Wnp+rv0OxmxVvU3loY7qUn0Z4pvlkC53wLiqZvV8Q6KHcB5jZbg7fyIY9fFdwmSPGHkBBqqfaeWw/pKuAob41RTYQwubo7D15TpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303305; c=relaxed/simple;
	bh=YDYKVpiQ2XjbCaXrPNJSTFwiU+tpBSilV8jtylz8zxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFeTB2Ex00WXpZrNoWy2LrJDlvWHrbhz02mlM4KQCCqR36eYIOXvqLiWOs7aHdKCuRW72DfntD5dLc13T8Ff4GPyeG78XvrA3doZMmduYuGzOl2wUVfwwt46VVvO0UMtkaaOZUylOhhWaE4CSWFqxjnqTRVlWZuMbm99Jn4Hu9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiNNr5Nj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiNNr5Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303304; x=1787839304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YDYKVpiQ2XjbCaXrPNJSTFwiU+tpBSilV8jtylz8zxw=;
  b=iiNNr5NjhTa6IqfzXLnkG0ho7kO67YyGAR+uGMlfVA+EZJnhpA3ZSoMb
   hGVNSnSj/u/FOppzsBLuuXQnHzcnWXiVn2FbpnlHTc+frN9EKwkTXLQFH
   B/zhZlgFySkQQLkHxW02cHkaTAuJD5kh2BSfu+oIDm1Kq/wEUv84e43Eg
   iG/7prIkqaYXFqGs3cYo0vC0fyRzkln2ughVRn1O+5OzU1N9vP9s8dOYi
   6ELzo5F393utgZaBGBgY7NPd5dP1DF5/AMppP7fCSnYkeR0nXVZcHH5Oo
   5urkKi7mrLS5uZEpwrEIekqlPxHzfOe0Omj7qEeVKU+2u9fKRwhRxjDiZ
   g==;
X-CSE-ConnectionGUID: 8WcuyBvNSq+e8o8rytLCuA==
X-CSE-MsgGUID: AdFD+pZMR52MMRt+WDdRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473790"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:43 -0700
X-CSE-ConnectionGUID: 9zol0F6ES02I9Z+d19OEfA==
X-CSE-MsgGUID: QDtO0EP8RyiNsk0k32BfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016794"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/5] ASoC: Intel: avs: Simplify avs_get_i2s_boards()
Date: Wed, 27 Aug 2025 16:22:28 +0200
Message-Id: <20250827142229.869139-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827142229.869139-1-cezary.rojewski@intel.com>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional changes, just code simplification and readability
improvements as there is no need to operate on 'struct avs_acpi_boards'
if 'struct snd_soc_acpi_mach' is what interests us.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 4b0a8482af2e..8539ad3d97c4 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -364,10 +364,10 @@ struct avs_acpi_boards {
 
 /* supported I2S boards per platform */
 static const struct avs_acpi_boards i2s_boards[] = {
-	AVS_MACH_ENTRY(HDA_SKL_LP, avs_skl_i2s_machines),
-	AVS_MACH_ENTRY(HDA_KBL_LP, avs_kbl_i2s_machines),
-	AVS_MACH_ENTRY(HDA_APL, avs_apl_i2s_machines),
-	AVS_MACH_ENTRY(HDA_GML, avs_gml_i2s_machines),
+	AVS_MACH_ENTRY(HDA_SKL_LP,	avs_skl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_KBL_LP,	avs_kbl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_APL,		avs_apl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_GML,		avs_gml_i2s_machines),
 	AVS_MACH_ENTRY(HDA_CNL_LP,	avs_cnl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_CNL_H,	avs_cnl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_CML_LP,	avs_cnl_i2s_machines),
@@ -382,14 +382,14 @@ static const struct avs_acpi_boards i2s_boards[] = {
 	{ },
 };
 
-static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
+static struct snd_soc_acpi_mach *avs_get_i2s_machines(struct avs_dev *adev)
 {
 	int id, i;
 
 	id = adev->base.pci->device;
 	for (i = 0; i < ARRAY_SIZE(i2s_boards); i++)
 		if (i2s_boards[i].id == id)
-			return &i2s_boards[i];
+			return i2s_boards[i].machs;
 	return NULL;
 }
 
@@ -551,7 +551,7 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 static int avs_register_i2s_boards(struct avs_dev *adev)
 {
 	int num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
-	const struct avs_acpi_boards *boards;
+	struct snd_soc_acpi_mach *machs;
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
@@ -563,13 +563,13 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 	if (i2s_test)
 		return avs_register_i2s_test_boards(adev);
 
-	boards = avs_get_i2s_boards(adev);
-	if (!boards) {
+	machs = avs_get_i2s_machines(adev);
+	if (!machs) {
 		dev_dbg(adev->dev, "no I2S endpoints supported\n");
 		return 0;
 	}
 
-	for (mach = boards->machs; mach->id[0]; mach++) {
+	for (mach = machs; mach->id[0]; mach++) {
 		if (!acpi_dev_present(mach->id, mach->uid, -1))
 			continue;
 
-- 
2.25.1

