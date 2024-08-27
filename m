Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3F1BC9FC
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761992; cv=none; b=AcZ6xPNvHd5jPX/++tjrV/70oOh4Eg5ociB4mq8zyvc/bjEzJlzExInfeNyLF/iNcD//IPwF9t9RPLir+ShtAxXj1f6PgCD/+6Uapa1HJB3HARAy9g4e61Qw16gaaiMCvkZclwTg6vUTjhjPfDOt1WNsmxJGktS7LmaYMOJCuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761992; c=relaxed/simple;
	bh=lezY8n3FfGb0RUs9k8urcnsN7Kic2at/ihL04g8sWeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eC70m9jyO5nmrLgxTJQUeby+QDeXxfIu1RV4VDJ5VQO7/0NSpaWrNynMLZJGOjU8mYmehvKdw0ik/z/EDtMu3Ies92wfRr5D1YfuDEvrdQdwfImG54N0RaE/DuqxDQJFxHEB375750x0i7W/EluIqy6XBQGcSX79OsCbR6UIhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+NCSypv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+NCSypv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761991; x=1756297991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lezY8n3FfGb0RUs9k8urcnsN7Kic2at/ihL04g8sWeE=;
  b=j+NCSypv3SbIhCGPaaqJjdmir0o5SW9u5COVfiJikcKbBPXzWaYTn/Yq
   KaLXVhzM7t6dPk8FDc9nfdiCRIlhsc8klJkPeTBBghfytkslh95qBA8tS
   sGtnuE2EVmGm8XFJtoss/zV91XHO0/o/cuXxhk9dJDy/UrQ6tNEmWd4qw
   6bznHBHzxjflCcGVwNftu4kAA+rePKacZJsK/aPKgez3JctBiax6O6qHw
   sT+FEnSL/lSoOnxVhxsEVATGL739uBgYUl+6uzss9fOPR4Ue1Snm0fhUB
   a02h3L7UDITUR7n6Z4vcetL5EowicnJeAQLa8TJairhOsdxMvNr1FQzh8
   g==;
X-CSE-ConnectionGUID: 4OKn2W3/RwGGByd64gPsjA==
X-CSE-MsgGUID: egmYBk7gQm+hBw1P2X+JGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235534"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:11 -0700
X-CSE-ConnectionGUID: J8iL3o+lSLyWaCBv/xlLpg==
X-CSE-MsgGUID: bZL12jRKQJGtHoNMY2vguw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676842"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 16/17] ASoC: Intel: soc-acpi: lnl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 20:32:14 +0800
Message-ID: <20240827123215.258859-17-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
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

