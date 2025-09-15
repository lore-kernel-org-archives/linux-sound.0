Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206FEED8
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 02:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757905027; cv=none; b=VtYCkokY5AzMoVB1w5ltmv4MKCqavP71nBF/hnAAEoraJGNyZz5N9WjiPB0lAH9TqqLNtr8VCLqIoHTq7Ok5G/zKry6qgQR3o2anseMWyiK1oh8Rj7S4sg0s/CqyyRiRs5eQ6VaZREOWbmz93X0upF5tcM6xw5/h/v9vUXlNXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757905027; c=relaxed/simple;
	bh=3CXzRgbkoTqMNR2QyzpzNkKabUGD5hozElX/LcvZJM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5+XX/EjPCxrGPEO6Dhw92AB5kvNEdMCD/N4K+X0xQX8yXkpSL0NDDqAHaBzNCtvdX+Jvn8nATu7elBPKdNAfJ3OkWKFAszZxQXrakYFiSXqcVfg0EFM9ySIGCHlZnYccJuh+Up6cWiDxwLt373H+nAmFOGl5gRn6CN3u/rofSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgfQfLtJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgfQfLtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757905026; x=1789441026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3CXzRgbkoTqMNR2QyzpzNkKabUGD5hozElX/LcvZJM4=;
  b=FgfQfLtJSLIHHwGw/eoM9s433dk40VBFiJNLRAm3UDdZTRjp+PQxUdZF
   aaQI9xV0SmalWNH88XnAFtSVcnQO/z18h/zsBSl2o/jGuGb3jJch0GjUd
   95zuNR8U8ZqYtXmQUFngTA+LghjtiyBWezqvvJDSWkO+HsyBk563Vsiwm
   GewnPXdskTqDF3As5RFzSawWxGw0TW/uOGhvxAmVjh4LJRjE2IZ2rMe5E
   1Mma1z4vJT0UjE7i4xCrUiPDH2AY7SusOF5/pkls+RKnkVT9d30hl/tS9
   Xd50y/zeVde7T5LGC+sXJqsKFkbGJ+4mjR3oqpQ2uqMufS2tktRqLx9M5
   A==;
X-CSE-ConnectionGUID: ++oPnz5oQUCf2QpmbpG6yA==
X-CSE-MsgGUID: BZ/cldZdRImmMWjAdv1TTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59194015"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59194015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:57:05 -0700
X-CSE-ConnectionGUID: eF/JfOOOS32mo4sOcgCcOA==
X-CSE-MsgGUID: 8XXh2kv1Qvi7RuoXlRY7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="178503531"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:57:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: PTL: Add entry for HDMI-In capture support to non-I2S codec boards.
Date: Mon, 15 Sep 2025 10:56:54 +0800
Message-ID: <20250915025655.1154279-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture support for the PTL products which doesn't have
onboard I2S codec. But need to support HDMI-In capture via I2S and
audio playback through HDMI/DP monitor.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c              | 6 ++++++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 48ee5353bdf1..729c0cd7c19c 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -216,6 +216,12 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
+	{
+		.name = "ptl_lt6911_hdmi_ssp",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_HDMI_PLAYBACK_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index e292701dfcfe..3c8b10e21ceb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -61,6 +61,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place amp-only boards in the end of table */
+	{
+		.id = "INTC10B0",
+		.drv_name = "ptl_lt6911_hdmi_ssp",
+		.sof_tplg_filename = "sof-ptl-hdmi-ssp02.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
-- 
2.43.0

