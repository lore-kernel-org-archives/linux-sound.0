Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5032825E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864681; cv=none; b=oEpu2hTpbPpQTSpBasTWN/Q0YrExgqnV9YcGD8DAQko7A5dnZ2Jw3g9b+fYJnHOokRTFROL0T8t0AFK+PoxR1s8D1lKzMMSk0VhV4gxCD5lWubaBO6RWYU8M43qqu4j0VGKNAX9/jMb0nq2dlOj6WEo40ExAoHvdrv1u2mT2ubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864681; c=relaxed/simple;
	bh=Ot3vFjrO5uKIRjwgQ0elkYZZHNUBJGvZ1GbGgWw/fHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3noJM1ubxrw3x/fQYcoNEtWWbO+mfoCl+7gDDfXMwR1GjN9Q3VhqmfTYgKqAGrFAE4Gr3IKDnGDfQXf0eHsKhFYDc7uy6kcMO80+NYjWhEc4GjPiZgtYF4LFfIlNmYB6OfAHVe+Gyg06qDrVwxWln4GJQGS0BOTBfxwXX8HuXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3WSlYOU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3WSlYOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864680; x=1794400680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ot3vFjrO5uKIRjwgQ0elkYZZHNUBJGvZ1GbGgWw/fHI=;
  b=M3WSlYOUNCOYhLAv0Tw6Ub22HI0r2pl75y0K56fI8aqb3ktya1PWpChb
   qt1fwcoG7lW5B9hQvWdxRVRE9RsKkYH7MlQTtkW6hBCbnOLw1cYoHJinh
   vt03+0aZtJ/eePBpvDBKz34eiUMgXtehr3wH9FiWZRtqF1g+H1F0NaPnA
   4RHWDk55kCPeI4ng81z5n5DBEGgWuMbtoAfo8iPqoCMZbQnRrsjl0l2Wb
   3In3K5/dZxrrDK1OnFEAbXAEVsPwuTdC0lxkqxV8KQaMIZ2DvQnFhshpw
   JoHpoCpTNuZDpLdnz4zIoIzzV9tMrpRbcnp1IkW0eB7ie4RZNEp8vpAsD
   A==;
X-CSE-ConnectionGUID: uIrxzlyHQ0u1QD/V3A2pWQ==
X-CSE-MsgGUID: XqLwwgtEQ6GFFBAOXBk5sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129485"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:59 -0800
X-CSE-ConnectionGUID: j6xhqpY+Q7msJMK8Yn9s+Q==
X-CSE-MsgGUID: c0PqqhRUS+Ouy5efAxQfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217547"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:58 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 5/6] ASoC: Intel: soc-acpi-ptl-match: add cs42l43_agg_l3_cs35l56_2 support
Date: Tue, 11 Nov 2025 20:37:36 +0800
Message-ID: <20251111123737.246626-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
References: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds the aggregated mode support:
cs42l43 codec with left and right tweeters on soundwire link 3,
cs35l56 left and right woofers on soundwire link 2.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 99ff1771248b..060955825fe0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -236,6 +236,30 @@ static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_3_agg_adr[] = {
+	{
+		.adr = 0x00033001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_amp_spkagg_endpoints),
+		.endpoints = cs42l43_amp_spkagg_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
+	{
+		.adr = 0x00023001fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00023101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_1_3amp_adr[] = {
 	{
 		.adr = 0x00013001fa355601ull,
@@ -440,6 +464,20 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_3_agg_adr),
+		.adr_d = cs42l43_3_agg_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_lr_adr),
+		.adr_d = cs35l56_2_lr_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
 	{
 		.mask = BIT(2),
@@ -675,6 +713,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = ptl_cs42l43_agg_l3_cs35l56_l2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-agg-l3-cs35l56-l2.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rvp,
-- 
2.43.0

