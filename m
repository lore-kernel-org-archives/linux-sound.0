Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2794367B9F
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257307; cv=none; b=fy70UP3JgnPTdUBE5Eumfq+xeb6/qJ4X1As3iF3ut5yqA83sef/R/rXCH65qKODJqKVAHHqSUr6zUHzJjT4rE95AoVP6bpWyl0ru2kCEyESuI+J+qfMV3Jt7BH7jEnBO6l3JAlN6im8J3Y5M2aVB9peTJrfJ/xdj6g8ypKVuc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257307; c=relaxed/simple;
	bh=QU6exWzEUApgSI/AiSAR5kCA0Qkkc0RdUthmv2HQaf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t1VXIb+RioluQAxSq5mI2OBePrl+jtDl8KxrnUGO11beRF2Gdw5jbSJ2ze7/uRo3y31YiS6GcWXsP+XUMhsRuRS0Lq38U7vfHIgpj/tUlkj/X3tnSpfVeL5qqQSng/v55RQSbjE0Cbw8H5kXLAvViI/Obkc39VIYfEfDadFbO8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqMroLyT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqMroLyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779257305; x=1810793305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QU6exWzEUApgSI/AiSAR5kCA0Qkkc0RdUthmv2HQaf8=;
  b=WqMroLyTo1tvkOwGYoH+mYFkYqO0x9/cYS3nxG0KO77PJ5ZYZ7uW1Wt3
   xWteMKkRWP9z1MyTpUNqNvAaySdZa95kekX9agCE6qjQMIKcrfCK3joLW
   pFo3491WuKj/KXyZM+kLUEzSyEiJAZYuKct/j7KNbYUyuoGlntw7nziVR
   tCmKXu217/pKZRGT6phknk3t5ikSU38GdhI/JOt3aughu5d7OS7j2nOPg
   IzOxbWe/FBFBNZAAdeMXlVDpWuvOYVm0BwyiojStV3F4PvqORrj+HeWYo
   5ip3fMIokN1/PwoFh9xMNkHkLAQi/pGU/XD/GR7vogD52bebcgkEn6fa8
   g==;
X-CSE-ConnectionGUID: c1Yyw6UnR1mtDwwp8oKhCw==
X-CSE-MsgGUID: U7MLQv6WRZS1e861TOFeVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82717777"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82717777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:08:24 -0700
X-CSE-ConnectionGUID: fpI8u7nyROaLRLF7UxtsCw==
X-CSE-MsgGUID: t31AgJNgQZWI9Y/WsGlL8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239199783"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:08:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL platform
Date: Wed, 20 May 2026 14:08:13 +0800
Message-ID: <20260520060814.2024852-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jairaj Arava <jairaj.arava@intel.com>

Add an entry in the soundwire quirk table for novalake boards to support
NVL RVP

Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5c4682f9f7c9..d43daf9b025d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -837,6 +837,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	/* Novalake devices*/
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_nvlrvp"),
+		},
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
+	},
 	{}
 };
 
-- 
2.43.0

