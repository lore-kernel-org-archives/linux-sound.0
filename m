Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5242062
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707827401; cv=none; b=r3cNk3myxxjWpNkND45FkBRNmt3xv0o8ZenV4am+2XsSix0uBQpSzvpRu9xeRGbB4wLHI8zga3kwuW0wTO+kxidckN8lmLJ0tm8MGr9jEOY6RtPShlVuo1qQer82im+Lb0g5u3mcZlscpKG1W1kO0BObabKUCsj6E0x/LlMoIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707827401; c=relaxed/simple;
	bh=GQRB7CwazkvgHZASfvDiqGrue+8jW8tYjZdSiVWQEbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P98sEaUKpSX6P8c9dT5grjuEkvJqcVFJ6Hjwswqd/rtd9uQsYNZrtzmBO6FvwT9TZUDBf1PnGWHTUC+fbWSh8/U21NhmsFVGFQSJlCUPCyKgMYTHjYbvMEcUHZx7PCYsHiO9bBYi3BkqHW/OMMCyXOrUYJyguOVQ6e7oSkkTu6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLGChETf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLGChETf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707827400; x=1739363400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GQRB7CwazkvgHZASfvDiqGrue+8jW8tYjZdSiVWQEbM=;
  b=ZLGChETfUOJHcA2EbDL4cQ63SJknKp7qBaPhK+r/JgY85TNP80Tzm/sx
   +YYynma0jaGB4DFfWEZ+jxBg64dsJLFTw1WJzeUalrpMLTKULA2141EyP
   9DR+RULdxE5ymtmqNLPVXtHzG8S98FDreX15E//S1ZkWxBMVLnjceW3lj
   TA+X2G/RSsTB7tyMQdYfkKoOoVqsII7nK2Cx7cNA20lVDKHPuxii7MZPI
   kTzJCtguMk16RmRif6YCkyqBd5kdeyRpQhnmuTCpr1vuKdM2RF5BLy4MO
   rOlNkvaqYgspaUuXtkPlGPTDbei4JSa7z750X21eaWy0mJWanrZ2XPz2Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1710447"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1710447"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7507283"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:29:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: set config_length based on device_count
Date: Tue, 13 Feb 2024 14:30:07 +0200
Message-ID: <20240213123007.29956-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Set ipc4_copier->data.gtw_cfg.config_length dynamically based on
blob->alh_cfg.device_count to align with the other OS.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f779156fe0e6..1dc935d737dd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -598,7 +598,11 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		}
 
 		ipc4_copier->copier_config = (uint32_t *)blob;
-		ipc4_copier->data.gtw_cfg.config_length = sizeof(*blob) >> 2;
+		/* set data.gtw_cfg.config_length based on device_count */
+		ipc4_copier->data.gtw_cfg.config_length = (sizeof(blob->gw_attr) +
+							   sizeof(blob->alh_cfg.device_count) +
+							   sizeof(*blob->alh_cfg.mapping) *
+							   blob->alh_cfg.device_count) >> 2;
 		break;
 	}
 	case SOF_DAI_INTEL_SSP:
-- 
2.43.0

