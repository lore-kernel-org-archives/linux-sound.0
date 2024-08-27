Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E1322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723065; cv=none; b=b0c3RXwlKyWedQwDg9QJsJ8n26ayZW82jCIOcmG3B+3qmChM79hgSY8l7+O/cvsqOaZwbMpwfG2ff09+C79jCnK2av1eogCFyvBqmbY7gOntxoD3fr4346elm/bwGw/uumwDQS+KwqCgj6KXV9CJzkvVYhiA5OzsKJ/Ty/dws6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723065; c=relaxed/simple;
	bh=lezY8n3FfGb0RUs9k8urcnsN7Kic2at/ihL04g8sWeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STRPtpSd8q9Xuxcyj6u/sjnJP1Z/4zjxG1jGh5mGi3UsrzMvUm2XJfRXLqfPeuHqQXDyhLEsG4OF/AlYbfeL/gHYM98zSpfjSme8N/VXUukj5ZOB90+CkCB3Wjs7sd7fxUvQF23OqFYG4mttITv+/UD+cxmwM/4D/wnGlD4pPwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X094qMSL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X094qMSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723064; x=1756259064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lezY8n3FfGb0RUs9k8urcnsN7Kic2at/ihL04g8sWeE=;
  b=X094qMSLvOm3Ez8oQG7XydpxositelYq5OyvfmDHFvVTXKtDIjLgkA9S
   kYMLWnWHgY9Lqz4OqJ2LLf5Brg+BldP5KzoSzdrXR/rtGuP0koVzTKIdC
   PpU4W+U+L82LFl92sYsUAsmb4Nnxg/PEJ+umjHXgBkbpXFBrw1FpKctmO
   IP7M51udnX8jB5AbYOmop+CUDE1o3XMgzS6ceO9zgUTS6RYQCE+btBwyt
   Twv72Ze50MeqVatKkQSgzB9MonVDHhN9xlylepl7FQSjg4wf+pFvHLQxz
   vZtu+lH4r1sOXQaKxbdlhVj8GkoR3Ljt0+ZhjNekUUKrLzUyKCLqriMEw
   w==;
X-CSE-ConnectionGUID: sFvQPWapSAKjBpEVjtUDaw==
X-CSE-MsgGUID: 7mq69QhaT/qf8Dnr11tV6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984998"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984998"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:24 -0700
X-CSE-ConnectionGUID: aL27cMCESNKN71pYNeZksA==
X-CSE-MsgGUID: u5BKDoetRoynHhZ5w3j+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427972"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 15/16] ASoC: Intel: soc-acpi: lnl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 09:43:27 +0800
Message-ID: <20240827014329.6542-16-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add some new match table entries on Lunarlake for some coming cs42l43
laptops.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index e6ffcd5be6c5..2522e6f11749 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -36,6 +36,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	{
 		.num = 0,
@@ -103,6 +117,51 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_2_l_adr[] = {
+	{
+		.adr = 0x00023001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00023101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_r_adr[] = {
+	{
+		.adr = 0x00033201fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00033301fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_lr_adr[] = {
+	{
+		.adr = 0x00033001fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00033101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
@@ -210,6 +269,39 @@ static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0[] = {
 	},
 };
 
+static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0_cs35l56_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_lr_adr),
+		.adr_d = cs35l56_3_lr_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0_cs35l56_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_l_adr),
+		.adr_d = cs35l56_2_l_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_r_adr),
+		.adr_d = cs35l56_3_r_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -312,6 +404,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = lnl_cs42l43_l0_cs35l56_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-cs42l43-l0-cs35l56-l23.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(3),
+		.links = lnl_cs42l43_l0_cs35l56_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-cs42l43-l0-cs35l56-l3.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = lnl_cs42l43_l0,
-- 
2.43.0

