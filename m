Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DC2E1C57
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149721; cv=none; b=KY0dEJRGfAQOTyV4JW5mdgejacxAmdANNwOHazC7DE94gij8rR4ryLDeX8EXl503gEqYoumTdoaByiDXVt2oQ60xAQlZGX4pp5FeVhpstpnSxFAkGkMhIM6axoJjpkuht8EPczYXrKHwVMKPzANWSyrmC6IQLV273XnZhWgZOVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149721; c=relaxed/simple;
	bh=A+BZv36iMr7LIbIRdSLg1elk6bSjVNRnhIWcwXvpOy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pL/N/FPnpLjTkyy1fhJSudym+cBJhIOUo7lcyZEGzJrVh8z4/naVTgUdMUPHIZ8OVmESZLVdzQ1Dlq0SwYtFwEbH9xbUMcnPAtzMW6SOsxi0sliQ+EZR3e2R1Evsek79HoGG/TGsBhJDoP0lApSku/UTmJD+a1W4x4BNsGjlFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQI7ydHm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQI7ydHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149719; x=1795685719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+BZv36iMr7LIbIRdSLg1elk6bSjVNRnhIWcwXvpOy8=;
  b=eQI7ydHmVypiBu0rr5SDX1V3t6wtEUagJtLHMfwdWp3fS8WkMOgZZWoj
   NaTp0G4fmBmVYdoCPHOi3nWvbzyzBpOrtbRLwRlM+mOtd1nZDsOloQeBf
   7MkQqM1HVZXr2xqf9SEAVYWngEng6uXNB+FLMmt3aF+ETuTBHzzvXeI9p
   I+XLfVt8A0VKw/fqcsDZyrwjm4l1DYvS0Df/8iAgb5pbdluG7wsETh8iQ
   h+ETltkaA5rzcgpLVlhBG9TCJqdLoJSDTnrKNoZ1qmXnJKbpypbnaQr10
   g4Qxd1gOaZK2lsPb0hsFzUeaoHAqHVGTygBIJhKOeKyVEopbzEmgGJSZr
   w==;
X-CSE-ConnectionGUID: QVX+ITySQOybb+3lkovRxg==
X-CSE-MsgGUID: uukAp2jmTZeLPYJZ6Bcn6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769304"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:19 -0800
X-CSE-ConnectionGUID: O9Ruyc4YRk6WUxy+3cbteA==
X-CSE-MsgGUID: r5kgt0a0Qz2pahY5YwTZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251717"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/6] ASoC: Intel: catpt: Fix probing order of driver components
Date: Wed, 26 Nov 2025 10:55:21 +0100
Message-Id: <20251126095523.3925364-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

catpt_dai_pcm_new() is called during the bring up sequence of the
machine board device which is a different device to the parent (DSP)
device yet utilizes pm_runtime_xxx() against it in order to send IPCs.
If the parent's pm_runtime is not configured before that happens,
errors will occur.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index faa916f40069..eed330bc82b6 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -184,22 +184,25 @@ static int catpt_probe_components(struct catpt_dev *cdev)
 		goto err_boot_fw;
 	}
 
-	ret = catpt_register_board(cdev);
-	if (ret) {
-		dev_err(cdev->dev, "register board failed: %d\n", ret);
-		goto err_reg_board;
-	}
-
 	/* reflect actual ADSP state in pm_runtime */
 	pm_runtime_set_active(cdev->dev);
 
 	pm_runtime_set_autosuspend_delay(cdev->dev, 2000);
 	pm_runtime_use_autosuspend(cdev->dev);
 	pm_runtime_mark_last_busy(cdev->dev);
+	/* Enable PM before spawning child device. See catpt_dai_pcm_new(). */
 	pm_runtime_enable(cdev->dev);
+
+	ret = catpt_register_board(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register board failed: %d\n", ret);
+		goto err_reg_board;
+	}
+
 	return 0;
 
 err_reg_board:
+	pm_runtime_disable(cdev->dev);
 	snd_soc_unregister_component(cdev->dev);
 err_boot_fw:
 	catpt_dmac_remove(cdev);
-- 
2.25.1

