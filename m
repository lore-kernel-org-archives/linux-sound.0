Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1734EEE8
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857326; cv=none; b=gDLv7G+pcjCG1jWprrwOmr2yKGsIhiY7vbjJ3uJ5NIFw8CIkGUD+XqU/mzik3LSp5NW0lhW5bryWo0AbOI8LdZgK7CooZuJYHFgPFZ5WQwi9eEK70VU+zDdRTs+8PwYlhdAGa9t4jVwA6LaDnAIFJlP0IuSgp6bTislEPBQe5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857326; c=relaxed/simple;
	bh=sWov6V/qp1XBeFU+oASomjJrrN/03Y3d8A9cI/+pD0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXGMeY1WOaFzIwFWJBubr8Y9ZlWKwwAdNiP88OcI+zeUaVvPwuQQselsWVcUJK328caDC7U8pD7e5uljFvvG/5xA9YwMgYxqkTtanMqnDgNLD7Ib8oKECRpLLZbyrCAR2lXR48ga5FYEJhRyjzoJhWf4z8XmtHGvIfmw1pfWO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8A/VrwI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8A/VrwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762857325; x=1794393325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sWov6V/qp1XBeFU+oASomjJrrN/03Y3d8A9cI/+pD0I=;
  b=c8A/VrwIqXuSt9wZtK2kS17X0BDmN8QLHpK9SL2CuUZT3/nBJoFpD0d1
   36moVy/1y/osQBoFHiWcnSHhNJ2AN8b3ypPBO9mqY9NO6exeuerggpNvp
   oraVXy9M2jGOBDu9MfBFrkQa/jmTrBSJvXeb9UDapnEUacNBykbY9lJPb
   /ySM4YaUyCjTg1l/jdkis/lKk7MffXBz3FCH0HdvXi7ALJABibMIscXoO
   F2Jvwvru4R/Yu10CunIx71j1x0fbkPq4EU+j/wJeZFyjzjeaiN0KVBbOV
   ikfdAsEOP/4v7eKG2sMBlMOJyYSMUD5EpF3wyNt2wcJTZkqX3A3wjWplE
   A==;
X-CSE-ConnectionGUID: BE2JYgoXTri+Ewq2jjGOlQ==
X-CSE-MsgGUID: 02PNg/FfTHOWUiWqa57B6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68558652"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="68558652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 02:35:24 -0800
X-CSE-ConnectionGUID: KeVZG1HLRzSZLbCvHJngKA==
X-CSE-MsgGUID: m+7wWDyLRhGUyjdcXW9I5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="188573339"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 02:35:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add quirk override support
Date: Tue, 11 Nov 2025 18:35:12 +0800
Message-ID: <20251111103512.244147-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

adding quirk override support to configure different quirk configuration
at runtime.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4994aaccc583..6ca114c30ae1 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -35,6 +35,10 @@
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0);
 
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, int, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
 {
 	sof_rt5682_quirk = (unsigned long)id->driver_data;
@@ -643,6 +647,12 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
+	if (quirk_override != -1) {
+		dev_info(&pdev->dev, "Overriding quirk 0x%lx => 0x%x\n",
+			 sof_rt5682_quirk, quirk_override);
+		sof_rt5682_quirk = quirk_override;
+	}
+
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
 	/* initialize ctx with board quirk */
-- 
2.43.0

