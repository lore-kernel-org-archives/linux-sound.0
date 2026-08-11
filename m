Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A928A2F3C18
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 00:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409652; cv=none; b=P5LxJWsFE1ryZmZnGX8gTKvDeEIDJwA3REN7nwv6v3AHwIrBT2VUs3O4TTs/zIVhxuQ5CQaewXbHDv2ovYqbf3T08zYeNLpa5O++qK5qIEVRJkeyU5ZCYjWh4bN+j23ozBD5mJ484bOB3uxE6re1RITX6bfOuZKBtAqQ8NMkbz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409652; c=relaxed/simple;
	bh=enOzU0zUZGvBmUO+QotpiCE5E8ttv2bB0enGMYU/OOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjaZ/2lXlTq4CrUlPrk0M6okR6zhN2DidEW4yzO2RvOmoxyrVbBUfL0nJbZDaRXKDh+cDCwoNLsM6JKxfJfylznrAtCQE96QV7dI+g0XsXM9KYY1i5WJwxQ9y0OZYcSLeN0H8G4qqYIgrMouBC5ks/ncgPG8dGGHhdkTNSYMB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h66R0oSM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h66R0oSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786409649; x=1817945649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=enOzU0zUZGvBmUO+QotpiCE5E8ttv2bB0enGMYU/OOM=;
  b=h66R0oSM+SnYO/3Pi2y4ZCNQJkK0NE5t7uv8tarhb3p6eyX2jo1c4/Lj
   no6hoZFE8pUh3tjvg0B6og9tQtlfkpYY4K53iQO2RO0ZRd+G9ANvyRoXI
   BORO0F9ZzHZ3gn1LUt0DiAoITfCUmaXRbDa/2/O6Miq5+HJzErkGcwpKi
   F0r8luzFdvPvAD+892CRLX8OMF0xsNVq1CxkJ0mgjdZ7HFvCtM/GfVURN
   k7PXYr4RAlkC6V3tUh7aaz6RJK3naRQVbe5AemNQiTDARbzMvawWVbpN+
   juZDHqD/k3uPn8S80dk6WiyqO++8B4zmY43k49NmltuBfYNXtgBVhm/3Y
   Q==;
X-CSE-ConnectionGUID: yhk8uIJaSAmKImpwD3hahw==
X-CSE-MsgGUID: IebEGOrvRNeEwmCCZVr/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98451913"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="98451913"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 17:54:09 -0700
X-CSE-ConnectionGUID: lXL3ujfyTOe5IWxcQu4UWw==
X-CSE-MsgGUID: QpEfd501RjS2jzdW7b8Jcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="262685541"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 17:54:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards.
Date: Tue, 11 Aug 2026 08:53:54 +0800
Message-ID: <20260811005354.2884137-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture support for the NVL products which doesn't have
onboard I2S codec. But need to support HDMI-In capture via I2S and
audio playback through HDMI/DP monitor.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c              | 6 ++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 729c0cd7c19c..b80d24966cbd 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -222,6 +222,12 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
+	{
+		.name = "nvl_lt6911_hdmi_ssp",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_HDMI_PLAYBACK_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index 4a6208f821eb..8f6e987c791e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -56,6 +56,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB,
 	},
+	/* place amp/hdmi-in only boards in the end of table */
+	{
+		.id = "INTC10B0",
+		.drv_name = "nvl_lt6911_hdmi_ssp",
+		.sof_tplg_filename = "sof-nvl-hdmi-ssp02.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_nvl_machines);
-- 
2.43.0

