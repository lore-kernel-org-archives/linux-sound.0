Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58093EA8E
	for <linux-sound@vger.kernel.org>; Fri, 22 Mar 2024 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711106681; cv=none; b=t0naXa8rdDiazhDmIe1xLjnOOV0MFzmlG3+/mcOXXLvVIcB6bSDYFuIhExm/Ye8p5Tu9T2lb9SoUKRXvO7g2lFTTlSuJVWtM8P5riRH+lXOvJPIXl83xio8adcBKSVbdoDKiLxaw8dJkFACOBVJlW5iAnoY2zXQzpvOZsSiYTIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711106681; c=relaxed/simple;
	bh=1v7K6FuT0FXxl1LoP3a/ozWX859AhDJc8GxXCmXI0A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oU9lf0CUt1BaOtepVRzRI5Q9NF8UjE3VWnt5RYeAq8LLqcu73zuytSDT38jJyasxh4ulPotTMOaHHLZ/eTCjgB2zncf7j74qcI5jfDOW05JTFZonmNA94HHwUQmgyqUK5X6e+58BDtYuywIigiSTLu/hycy61f3BKDLeskj4IcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/kbzjaf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/kbzjaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711106679; x=1742642679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1v7K6FuT0FXxl1LoP3a/ozWX859AhDJc8GxXCmXI0A4=;
  b=B/kbzjafNgqTacdpzBohOopORIziZN0jCE+vLHRIxwQ7Y3syr0/BJ7Ee
   jOF+xjGUEXRi+P9EYYq8n2t9pXL1takbqYWjL0pTZqtHIY+lVeMGd+Pi4
   tideJd8jLUL3bwqpX1TmwWSDsZ2ju3O8YIkLd5TXjfJs3xtJ5X10anWjo
   A2zS4vjiZS68U0qp9w1sCdiKIzQQGPb/FYXqwrR/9pU0U89s7lxZZ1HHL
   k7lgyxuhFjtgQIF6CqkhkQxuGeFdkYJAPk5r1mTx/ey0odaFvi+XNxS1h
   a4tK2+ZcZfOMsyMOuXlXkY+cd8q4RX5XZbW/z1hOC03y7fEp+oHhR49Q4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5977031"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="5977031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19580809"
Received: from kridax-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.32.117])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:24:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [RESEND] ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE platforms in case of S3 suspend
Date: Fri, 22 Mar 2024 13:25:04 +0200
Message-ID: <20240322112504.4192-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SoCs with ACE architecture are tailored to use s2idle instead deep (S3)
suspend state and the IMR content is lost when the system is forced to
enter even to S3.
When waking up from S3 state the IMR boot will fail as the content is lost.
Set the skip_imr_boot flag to make sure that we don't try IMR in this case.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
Hi Mark,

Can you pick this for 6.9, it was originally sent on 13.02.2024:
https://lore.kernel.org/linux-sound/20240213110701.12818-1-peter.ujfalusi@linux.intel.com/

Thanks,
Peter

 sound/soc/sof/intel/hda-dsp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 31ffa1a8f2ac..ef5c915db8ff 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -681,17 +681,27 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	bool imr_lost = false;
 	int ret, j;
 
 	/*
-	 * The memory used for IMR boot loses its content in deeper than S3 state
-	 * We must not try IMR boot on next power up (as it will fail).
-	 *
+	 * The memory used for IMR boot loses its content in deeper than S3
+	 * state on CAVS platforms.
+	 * On ACE platforms due to the system architecture the IMR content is
+	 * lost at S3 state already, they are tailored for s2idle use.
+	 * We must not try IMR boot on next power up in these cases as it will
+	 * fail.
+	 */
+	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
+	    (chip->hw_ip_version >= SOF_INTEL_ACE_1_0 &&
+	     sdev->system_suspend_target == SOF_SUSPEND_S3))
+		imr_lost = true;
+
+	/*
 	 * In case of firmware crash or boot failure set the skip_imr_boot to true
 	 * as well in order to try to re-load the firmware to do a 'cold' boot.
 	 */
-	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
-	    sdev->fw_state == SOF_FW_CRASHED ||
+	if (imr_lost || sdev->fw_state == SOF_FW_CRASHED ||
 	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		hda->skip_imr_boot = true;
 
-- 
2.44.0

