Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE6111B1
	for <linux-sound@vger.kernel.org>; Fri, 15 Dec 2023 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV2RBr9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702628249; x=1734164249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zwLBxMonVK0AOgxTrekrxFdQ+N4/czfNF8KfEhPQQ2w=;
  b=hV2RBr9A4mqqtvL4SYLXNyq0S8pxYAKmdcbO8u1qKf2JayWqpDy9gS0K
   tdEwm372M4k8idRQ5Wmrb+7nqPQP+jPvgTaoQAmBfV01Y1g3cO1YVsOqX
   1+lKYLWMXqBm+2e53PFixf7kgqXho1wYDN7M5YRGEjHquDQZ71ZMJpGDE
   gnhKJLWTMW135/O1z+Oo64vya84EUTH6qrqT9F5lVjahxYcpdcpjehm6x
   j0sxzCTUE6a8z+FyCxhH9ktxDnr3lp6WM/d5kRzD5eCE6pjp/fRMytakG
   XNCZwbr8oYyGqgPdCrDvB/Fo0QZ57Ag5pbeIUB+hN2D/B7yjqVPSDji78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2414133"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="2414133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16206837"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: check fw_context_save for library reload
Date: Fri, 15 Dec 2023 16:31:02 +0800
Message-Id: <20231215083102.3064200-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
References: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

If fw_context_save is defined by fw, driver can skip library reload on
d3 exit or reload library.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index bc3256d714f0..d5af0a5fc46e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -551,14 +551,15 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 			      struct sof_ipc4_fw_library *fw_lib, bool reload)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct hdac_ext_stream *hext_stream;
 	struct firmware stripped_firmware;
 	struct sof_ipc4_msg msg = {};
 	struct snd_dma_buffer dmab;
 	int ret, ret1;
 
-	/* IMR booting will restore the libraries as well, skip the loading */
-	if (reload && hda->booted_from_imr)
+	/* if IMR booting is enabled and fw context is saved for D3 state, skip the loading */
+	if (reload && hda->booted_from_imr && ipc4_data->fw_context_save)
 		return 0;
 
 	/* the fw_lib has been verified during loading, we can trust the validity here */
-- 
2.25.1

