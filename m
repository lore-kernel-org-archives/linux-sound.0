Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1782153BF3
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744360; cv=none; b=BOrZdghvFkOcfPyclvVg54SWi7aFcTPgCbB7vOP1hHs2+F5KEyXngd7rt0F6v1jRAxsPgCZLmEI1svDqG2ERO0aLI5gsmWgbevAXW1omOZf37XoRlhGU3BBAKYj3IspFymz9rdVxeuizL3ZJ/O1n2eMLY5tczjl1CYCfDW+Xaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744360; c=relaxed/simple;
	bh=jAmF9TapQ0bMEJFmBmDWJ3wBI0lRy4F6KUp4fwsstTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YV7StKHX0Q9r7PpYnMdRPLahwj/FFjNplxR962uG7jsrWv9sRiO4RLhYDdLkvdnS8y13xiKp7eSJzLnK1G4TxN/ttqEayBxEl/ibJSBlff63NAOguOXdn2K7Q6RRzAKwT2hsYyFza4vOxNJT6GkB5Gn8NgiT842r9NI2Ph9VnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaIeTyW0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaIeTyW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744359; x=1746280359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAmF9TapQ0bMEJFmBmDWJ3wBI0lRy4F6KUp4fwsstTo=;
  b=SaIeTyW0wZIld7NicZE5w7bsqD97s7OLKi5+UPV6ET4mvhWDMtGlNKJU
   Us9K28VvGHgvpmcK6S/BEhq+kUS3xaDktb6STpfu+tFV5sJVlhSPNiIQ8
   XadAFdzwg+PEiRLrWRSMxKY36jWLqKe+7nsprbsBgcACE244xkO427eCv
   q+xKdAE1aYhpSn8QZOHKXjJ3gEG2chfUdnrPQ+N5Al7Mo8fGVCWjG/QpQ
   4lH9MgYIIPqAOT5JW+DMeAi5xyi8GIZyh0GDk7RQtAtUlK22qIRJnsiR4
   sHCkQyiqbtuWBt0x2CZ69RK5hhLYP/WSa6MNGWF9du7OB1rFIZ/RXMMtx
   Q==;
X-CSE-ConnectionGUID: h7ZPb5vaSymJuPgX+6Kakw==
X-CSE-MsgGUID: M7Ex3TYnTFCe4XJIKssKdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029429"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28029429"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:37 -0700
X-CSE-ConnectionGUID: JbXCBeDYQgSCp8rtAdYVAg==
X-CSE-MsgGUID: /ZvZYLuUSfufjFb+a4kxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548769"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 6/7] ASoC: SOF: Intel: remove circular dependency on hda_sdw_process_wakeen()
Date: Fri,  3 May 2024 08:52:20 -0500
Message-Id: <20240503135221.229202-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hda_sdw_process_wakeen() is used in hda-loader.c, but defined in
hda.c. This code split will create a circular dependency when hda.c is
moved to a different module. Rather than an invasive code change, this
patch follows the model used for sdw_check_wakeen_irq() with an
abstraction. For now all abstractions point to the same common
routine, which is arguably not great, but this also provides us with a
future-proof way of addressing platform-specific wake processing.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c     |  2 ++
 sound/soc/sof/intel/hda-dsp.c | 15 +++++++++++++++
 sound/soc/sof/intel/hda.c     |  3 ++-
 sound/soc/sof/intel/hda.h     |  5 +++++
 sound/soc/sof/intel/icl.c     |  1 +
 sound/soc/sof/intel/lnl.c     |  1 +
 sound/soc/sof/intel/mtl.c     |  2 ++
 sound/soc/sof/intel/shim.h    |  1 +
 sound/soc/sof/intel/tgl.c     |  4 ++++
 9 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 460bc404ddb6..1936865b2937 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -473,6 +473,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -508,6 +509,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 974ac1cd8c6e..780f4c33e678 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -1311,6 +1311,21 @@ int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+
+void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+{
+	u32 interface_mask = hda_get_interface_mask(sdev);
+	const struct sof_intel_dsp_desc *chip;
+
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->sdw_process_wakeen)
+		chip->sdw_process_wakeen(sdev);
+}
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 #endif
 
 int hda_dsp_disable_interrupts(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b15b1f5edcea..183b2526b6d2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -331,7 +331,7 @@ static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
@@ -345,6 +345,7 @@ void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 
 	sdw_intel_process_wakeen_event(hdev->sdw);
 }
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0345c90ead4d..e675ff8a83a5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -817,6 +817,7 @@ int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
 bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev);
+void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
 
@@ -855,6 +856,10 @@ static inline bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static inline void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
+{
+}
+
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 115866225e05..9b916eb4fc21 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -187,6 +187,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index ca0cb91d2b2c..a7446be36627 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -238,6 +238,7 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.enable_sdw_irq = lnl_enable_sdw_irq,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 13f780f33c22..b9fc123be75d 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -779,6 +779,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
@@ -806,6 +807,7 @@ const struct sof_intel_dsp_desc arl_s_chip_info = {
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 18ce3d33fa80..448ec54a6aa9 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -190,6 +190,7 @@ struct sof_intel_dsp_desc {
 	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_sdw_wakeen_irq)(struct snd_sof_dev *sdev);
+	void (*sdw_process_wakeen)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 	int (*power_down_dsp)(struct snd_sof_dev *sdev);
 	int (*disable_interrupts)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 6acc65923834..062327d4f068 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -156,6 +156,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -184,6 +185,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -212,6 +214,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -240,6 +243,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
-- 
2.40.1

