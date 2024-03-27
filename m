Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1192F131196
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556680; cv=none; b=BL8ctKVXTd2SyuyX/+s7BViggp0r8uKYDI7IijM3KwrZ9yPbLAF3bfcmHmv9vja069evsDWntKvL2SwPEadRqyzlCJwdLW22W2DLIRgzkhinDWJvMXRhVraSMsM2/vs4HclIrG8qlpDxr/HH1epkocP+WWeDbtPkZbUdsNhOuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556680; c=relaxed/simple;
	bh=cOyf6fdZwa3ljk1RfWn3pKTRNtto1U1plCa6n3+94CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ec77iRZwq1uSyd80U/MWcz7Jtbin+RJF4pvrij/qs7HoCelLp6KUXn2K6YuBMBl4oP5v8m3QoL+8ulxf3TgHdZldSUxpDfBFwLxLFZh3J582dArMITVEbDL67z+jeJwQfV5pwUGA49C3m+fpP63Eb5GF8zSqgSpBYFhS+kXrgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1vz8teK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1vz8teK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556680; x=1743092680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cOyf6fdZwa3ljk1RfWn3pKTRNtto1U1plCa6n3+94CY=;
  b=W1vz8teK2buhMBbXNgvVocY3f32+FHbkZh1jtujasn7/YaLSAVpNSXp7
   Anr2L4y6h/g7K3gCI4SjqO9I8aVyiKBT9IU5aEOgqWlXK8zEdTFk/MbMH
   STfEHU+mVcFcdxkO2LxE2oLlp2CHdamiY8QnaRTjGUcWYbOIs9IDdFz/u
   pQRn0g+Ydh3EKgorSfiOjJ2kWQri9ayGnrNpwxGF4mT/Wj490rS8JbTug
   bXkx813QCeBy0AAst88fOwMypB2hK4/wupKzg50c1anOhmhwXrQoCPj5L
   4oD83RdQMFTDwohWc1LaHVk7VVK6JNY7wNdHYDNBCyEHopLECB77scU9R
   g==;
X-CSE-ConnectionGUID: bd6UtIegQua8I9FXAE/+Aw==
X-CSE-MsgGUID: SbJHy9w7RreuhNmQV6XSAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221576"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821350"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/18] ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl boards
Date: Wed, 27 Mar 2024 11:24:07 -0500
Message-Id: <20240327162408.63953-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add the board config rpl_cs42l42_def to cs42l42 machine driver for all
rpl boards using default SSP port allocation (headphone codec on SSP0,
speaker amplifiers on SSP1, and BT offload on SSP2).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 8a2833a0e3c5..3fc76184bdb3 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -270,6 +270,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT |
 					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
+	{
+		.name = "rpl_cs42l42_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(2)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index e28a21667780..34588db6138a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -404,6 +404,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "rpl_cs42l42_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "rpl_nau8825_def",
-- 
2.40.1

