Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FE12CD96
	for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731308791; cv=none; b=kkGyUZn8EzuElPa0c2YR5WLzprJ3dliEf66cC5nOEcgxNq0uwbHVtGuICKYXuFjubxgq546avlu3Pp+QifEu3U5zXRVkEFyKtUUeOaAOSlvi+6xi/wNearypdv/ye3Zu4d1mAoDZlO+p2ieZFA/v5Haqi2ulbVkCNlAG+6qVbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731308791; c=relaxed/simple;
	bh=7WoC4ixReXB9JdPcU2MUc3nImVJL603zLfdPs38fh54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T8MnY+Y1JMNIAWKIYWLiPZdK7nIJkyMys/BHIzncdM1WNdkXsK2FVyvhhwQjlu4W3iQlIiE+hyDgh6H+ynn4eAChAJ+pE+V6c9HACueAkMyLr1w0+KBGdwUmAae31MjNFSVRjMGJpPDbzqV3YhKJsVwB67Yb7NKE/xBqd1vgikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYT5KHeC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYT5KHeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731308790; x=1762844790;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7WoC4ixReXB9JdPcU2MUc3nImVJL603zLfdPs38fh54=;
  b=TYT5KHeCloFEgY022cGIg6O2bqfpHe28QB/d3Xw6hhjs4S3md7L8LxuC
   Qm+pPmNUTh1P9IkjR+A81Wi1QmL0jc1w2HqM5nDSKPpBSbO3HoyEGEaGK
   4mvFUASWmXtBVWslBzv3u5ls9MTO5jXLkdlhLJqyRyZFYso6dRl/9lpqU
   vmSlkDcgP59sJFePltAPacqVynaCDFBBxqkClC+k7hAROkI2yeaW5BDg0
   pzqh7/seYLQvmn+1wxfifx4Pw+paPnSt9D3C533CF/NelrlixxEit8FMw
   5c8MTvw5rkF5S8QNADOTYh5Zpa8grDG8V8VpFLFMRyZWVzoL1lGwvziT4
   A==;
X-CSE-ConnectionGUID: nGyqeA3WRhuTW0V1hL4gOw==
X-CSE-MsgGUID: zvlqVWcUSmCa7sZx0xrpKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30518515"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30518515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:06:28 -0800
X-CSE-ConnectionGUID: H70kcmPXTsKreTILI+DgTw==
X-CSE-MsgGUID: iBT1DEcKRtSCxdP0BoSzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86718676"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.205])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:06:26 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	deep_harsora@dell.com,
	bard.liao@intel.com
Subject: [PATCH] ASoC: intel: sof_sdw: add quirk for Dell SKU This patch adds a quirk to include the codec amplifier function for this Dell SKU.
Date: Mon, 11 Nov 2024 15:06:18 +0800
Message-ID: <20241111070618.5414-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Deep Harsora <deep_harsora@dell.com>

Note: In this SKU '0CF1', the RT722 codec amplifier is
excluded, and an external amplifier is used instead.

Signed-off-by: Deep Harsora <deep_harsora@dell.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index eaba91dad967..06d8069ea7b1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -671,6 +671,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF1")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

