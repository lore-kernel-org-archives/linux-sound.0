Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A22D060D
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112774; cv=none; b=LsGZFP/TWt15BBdimil/RBwsLhfX0Xfng2sf8GR0NHy+R/KFcR0JdqmTmu46Ii443XTFiPMm+kyowygjwnDCLi+UcOyCjnJhxOca3diB0k2TeLREuWl6vZaxi/civ2ZAkhJDw4utArBRjf/FAfs1cm3Qt6OZkrt+DS7fssquKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112774; c=relaxed/simple;
	bh=JqB8Uwhv6ILF3YvX0Yq99mgeuQS/GfvAwvtq2RRloms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOBmuL100mROE84/AQbhQb9DNeVJFEEC8hXbGRKAySjPIITBc3WdShOxZi5Urdgq1XpAO97jl8wRPTF49CRamVOtUns2WdU0nl/iD7lAvfXnWZxoFtCDtghd75nvcF+55jxzuLmg+qD5mXaa19y1m02BFDbwZKxCdDYQL61vMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3wjMSae; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3wjMSae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770112772; x=1801648772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JqB8Uwhv6ILF3YvX0Yq99mgeuQS/GfvAwvtq2RRloms=;
  b=j3wjMSaeiu2vSKlSZP8G/m7I9Yx+q9YiZ7dtzXdEvwdR2K5eQ5/BUou3
   1RU6t/MUxSwMPtPRCw9ob8U61ha+FVFWvca9Prr3Fv3E+J46KLch798PB
   p8Gp9S62SiI8ihPyxe62HDoqvHjCBZ+PvEY7OSnhPinZ7/DJX2j/sQQXU
   OcsAAXcBijmDAkISSxKP8rLVqTXpL7pyHO/kI2RPj4BGOSV2bgUsIOu5V
   I33HYJ1tsbZjdnCPnXYIhJ0Gsa+Cldxu7SB0x4Gsf4Mj+HWBZaexep6pe
   /hxO/yT++y98D8qWY2ykjtcnPWCiPZgE/HLKxo2ohaTGHz/scSxMkX2Pm
   A==;
X-CSE-ConnectionGUID: 7FjVXGz+RQK+rhRe1HlC8g==
X-CSE-MsgGUID: nwihU/SbQ6OiYfhbdfMbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="74904996"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="74904996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:59:32 -0800
X-CSE-ConnectionGUID: Pmo20tJmQBm8w5OSCh2raw==
X-CSE-MsgGUID: J9eR4n0bTAS+rv62rRUFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="232723035"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:59:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda: add SDCA property check
Date: Tue,  3 Feb 2026 17:59:23 +0800
Message-ID: <20260203095923.3741674-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

If SDCA property is not present in the DisCo table, assume it
is present. This allows DAI links to be created from codec_info_list
instead of being skipped.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f1b58b822598..c23f50b4fcbb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1138,6 +1138,12 @@ static bool is_endpoint_present(struct sdw_slave *sdw_device,
 {
 	int i;
 
+	/* If SDCA is not present, assume the endpoint is present */
+	if (!sdw_device->sdca_data.interface_revision) {
+		dev_warn(&sdw_device->dev, "SDCA properties not found in BIOS\n");
+		return true;
+	}
+
 	for (i = 0; i < sdw_device->sdca_data.num_functions; i++) {
 		if (dai_type == dai_info->dais[i].dai_type)
 			return true;
-- 
2.43.0

