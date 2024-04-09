Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84785131BAE
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662439; cv=none; b=APti9e2TWCe4JDgugBdo3p6lkAjkjX/lS98Sqg19tmgUOgDdz/Ty1HMya4H9bFmLqWXBOEZcOuSJNfmYtx8dyeef9SzDxTWCHNVtzpQqKxciKCrGsW/Y+wP5FE+Th7VQkRWzDcOHmSvZnOkEqDr08wDXPj3b4M3net8XVK3AqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662439; c=relaxed/simple;
	bh=xm+pyRuox+RlzmIfj/5lD//RTwHt2KOQGdo22HpUdWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZ10oN1w6hOT/2VPcKWN0THahZ1lnAXCcdPbpKu26M2TdXXAl8UZxX1/8q92IcbeOcF/Spezfjsvk4/X1Uw7p+mjZ4HzIyC5vt5YBpQaQGmlFUeKewZw8+62Iwwm5ljo/nMoHGwn2JZ3R4HhaEECFBy03rjM6Am/U5WKxeLTwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRf9AWKp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRf9AWKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662437; x=1744198437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xm+pyRuox+RlzmIfj/5lD//RTwHt2KOQGdo22HpUdWI=;
  b=hRf9AWKpPUz6xG4XeYCac3sGhi5B+EbmXNuliHJdyDagau8+jYMPAr9W
   UFjqBVgzsZH3fLjvZo/iokaWDK1wuqOR8802hRufT1wM4YSF844SaXG6U
   MKGEINEX5/pW4Ve1mLmdrh73TbzO8mLYNw2wh9c+7YRal2nlnTpF7dTcC
   A1r04x/WWu+Dq4JM1cCGBGg9KeyhV4/GuGL3jyqtsML6Y/ftj3Aq3M8zn
   Ss33IEKUWULo8OoTg+PlATERZQ1H35Mm+eK+EvOPD0UNFuAYXw2yTqzDz
   egBblDgRuZR5OfhXoq3NuOzu1Vrpyw3Kgg5iPQJ9hhNenE9MT2qIuXhU1
   Q==;
X-CSE-ConnectionGUID: RsBKUlKNRjGnD6oxT7Ofvw==
X-CSE-MsgGUID: VyEWFf+SSIq5Sv+iUwydTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18687793"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="18687793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:57 -0700
X-CSE-ConnectionGUID: CYcXHKZZT5+YGzQ8e3RJNw==
X-CSE-MsgGUID: aKJuDvKIS1+45W6jvzHTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20241684"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: tgl: Add fw_regs area to debugfs map for IPC4
Date: Tue,  9 Apr 2024 14:33:47 +0300
Message-ID: <20240409113349.21623-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
References: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the firmware registers via debugfs. it can be of great help while
debugging complex issues.
The area is only available with IPC4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/tgl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index c2bb04c89b9d..6cda47a78118 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -22,6 +22,13 @@ static const struct snd_sof_debugfs_map tgl_dsp_debugfs[] = {
 	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
+static const struct snd_sof_debugfs_map tgl_ipc4_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"fw_regs", HDA_DSP_BAR,  SRAM_WINDOW_OFFSET(0), 0x1000, SOF_DEBUGFS_ACCESS_D0_ONLY},
+};
+
 static int tgl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
@@ -75,6 +82,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_tgl_ops.ipc_dump	= cnl_ipc_dump;
+		sof_tgl_ops.debug_map	= tgl_dsp_debugfs;
+		sof_tgl_ops.debug_map_count = ARRAY_SIZE(tgl_dsp_debugfs);
 
 		sof_tgl_ops.set_power_state = hda_dsp_set_power_state_ipc3;
 	}
@@ -105,6 +114,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 		/* debug */
 		sof_tgl_ops.ipc_dump	= cnl_ipc4_dump;
 		sof_tgl_ops.dbg_dump	= hda_ipc4_dsp_dump;
+		sof_tgl_ops.debug_map	= tgl_ipc4_dsp_debugfs;
+		sof_tgl_ops.debug_map_count = ARRAY_SIZE(tgl_ipc4_dsp_debugfs);
 
 		sof_tgl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
@@ -112,10 +123,6 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	/* set DAI driver ops */
 	hda_set_dai_drv_ops(sdev, &sof_tgl_ops);
 
-	/* debug */
-	sof_tgl_ops.debug_map	= tgl_dsp_debugfs;
-	sof_tgl_ops.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs);
-
 	/* pre/post fw run */
 	sof_tgl_ops.post_fw_run = hda_dsp_post_fw_run;
 
-- 
2.44.0

