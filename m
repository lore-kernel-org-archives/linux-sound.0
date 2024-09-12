Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4221A263E
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142618; cv=none; b=ks4nJuN0FOVVZg8VX3/+NFo49IBD3Oe/y6XEO9x+I3Md2MxBDhnsh4D45RetbNRxE4QeWLax9UGHpLdTn+WdiKWdwFrOrqudOsYevYAAEbLM97UXZf1ZpphW5efOFkiZkwtOJAbba1iaG98ECTfkJLwQPwFB9SnRZWA5vJMig7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142618; c=relaxed/simple;
	bh=8l2/JABV6H5hQ/YCfrafkBQB+l3NZBTPfqVM1ryBXtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFKZR1Uvysxn2Y8dx31ZLNdfJ0C+bKrIkj7B16pqJ4dg75RUjmoVwFwKY8/yVuDeCS1cIWS+KS1x+bx0i168o7oRlu24UAvzt3nugrtNk7QwyJE5hUedxr7VdTeWJTc2M4i5FKmuKCwbRFXIUtXesqQ+s6mgaIYiGg3SXMpmSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMJH/+UL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMJH/+UL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142618; x=1757678618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8l2/JABV6H5hQ/YCfrafkBQB+l3NZBTPfqVM1ryBXtg=;
  b=WMJH/+ULwKa11TsvkidEIAtKDuSDcX9o7DlTTq9QUxEb3GYURra+yZ9u
   4z1SZHjwWmrfqK8hNlx25HoFyXioTFudaJm/hIXmzMiA0CDV/A8ttak1i
   NBYywqRjxewXx0snTluQsrksCxl44fEnW4M7ECPY4pmMVdPIeBhQPhOvy
   RO5pWDOfXp98+ahnaONXHVHJRDmrKwTv3CnlumcmFRetta7tMV/bdFaNo
   0xT1bvy6bfgRd7nCP5JyxYkhu/z6R5s3YkuT+UI+QY9WqJV8NdV5aatUQ
   +M+BJLjrE+Ilwpweh3uA8kHVfAwZuAgp4e03WACU0/iR4HEg8CcsZCCI4
   g==;
X-CSE-ConnectionGUID: GD2ZZWyxQDODaAqemljBIw==
X-CSE-MsgGUID: 2v3TMWBOTIG7sZMWUB7g7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812804"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:37 -0700
X-CSE-ConnectionGUID: bZDq6MwRT2eYDeUsyJBHQw==
X-CSE-MsgGUID: mxFHo/UESHCgllSYipeGbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459213"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 7/7] ASoC: Intel: ARL: Add entry for HDMI-In capture support to non-I2S codec boards.
Date: Thu, 12 Sep 2024 20:03:08 +0800
Message-ID: <20240912120308.134762-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture support for the ARL products which doesn't have
onboard I2S codec. But need to support HDMI-In capture via I2S and
audio playback through HDMI/DP monitor.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c              | 6 ++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index f51f1008e016..6ff8895a294a 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -210,6 +210,12 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
+	{
+		.name = "arl_lt6911_hdmi_ssp",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_HDMI_PLAYBACK_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index c13afff84923..c97c961187dd 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -323,6 +323,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
 		.quirk_data = &arl_lt6911_hdmi,
 		.sof_tplg_filename = "sof-arl-rt5682-ssp1-hdmi-ssp02.tplg",
 	},
+	/* place amp-only boards in the end of table */
+	{
+		.id = "INTC10B0",
+		.drv_name = "arl_lt6911_hdmi_ssp",
+		.sof_tplg_filename = "sof-arl-hdmi-ssp02.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
-- 
2.43.0

