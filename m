Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70E346FC3
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724199; cv=none; b=ute9mWzwrKSOoQt2Iil9x7BypLGfqcnZfBCaS2mnTi7jlWomd4+dUUtAX0EZY2r/zlM3tEF1CCO6W0KBmKQOZVOSXSY9GU4slLCg4td4MMMOOmWB1x6TOjl4NRUTiOyxwaule7gtmNAliE5yg5lM/hBBcFjMSdqEJ17btaLdvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724199; c=relaxed/simple;
	bh=YBwuenmV6qwcD5DmctifmB7aJ2subTAKvJhj8OAUNww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TbsghMYQ+3PtIdM4mwfpJk4SAidtxyMhZWwcMHM6aueBeRQKVqk+BQ66G06/FSQ45EOHDmJgfv0F6CVIWApsYjqGvkF9mM53nZdS1xGuTllaoOD0N3VYF+c+otWsPkuTE7m1A/m9Fhnw8YE4pw4p6rAr83/hUYpVj2Ynz1ryF3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6mwoaqR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6mwoaqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724196; x=1795260196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YBwuenmV6qwcD5DmctifmB7aJ2subTAKvJhj8OAUNww=;
  b=E6mwoaqRlbLinrV0EOa/3KEoMMUR9PW8PdWu7XbntqTd402JVCgzbSRL
   kQYMPv19ZlQnF42Axf0/XyUXwxj9btmFjuEcSkA+4CWRY6ZgMK3MF6h5T
   1bXA8eHIcYJZ8HiZVujblbG21GgQw3sUsWJKtmd9ZLJBZX+Aq9jvgbqvN
   xAn+ROk+JmMXHJfIjesrmhL9RHnvjTSP979kMUW5YolXSSm1D7WCkEtUv
   Oj4GrV18KPpL0G17qJeLnLK/EQ8zaJfsIP0D1N26ZOwAxNFNEoqKJsv0T
   ejGWKtJzbjoBtG01OTiKGJUsEq55RCVbZ8Ahk8CZmgX7qhrBNnIrwilNC
   A==;
X-CSE-ConnectionGUID: 2ahc6Z8uQt2RrCNlcyE4sw==
X-CSE-MsgGUID: BKvtD+AZTTio2tuM3YhKKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845922"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:16 -0800
X-CSE-ConnectionGUID: 9ahjPDuGT9iWF47abtU8lQ==
X-CSE-MsgGUID: jwp+jg07RaWF9mhzBFEKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462840"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/6] ASoC: Intel: catpt: Fix probing order of driver components
Date: Fri, 21 Nov 2025 12:43:28 +0100
Message-Id: <20251121114331.3841335-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

catpt_dai_pcm_new() is called during the bring up sequence of the
machine board device. That device is a child of the ACPI device the
catpt-driver attaches to. The function manipulates pm_runtime_xxx() to
ensure its parent is woken up before sending IPCs. If the parent's
pm_runtime is not configured before that happens, errors will occur.

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

