Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C092D641F
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002842; cv=none; b=cknuB62gKHYgviZ8DtlvWcUQzirwY5tBwDW6Z0Poi3WiSeDuVgsDMP+4t1Pkbe0oo8dSkgxHhRVMqfAWYgMldifRNEyMmuVjP9Hl8tdr8ZYaHNbp8vZMHy99NhaxCNrRgcFWqfpyz8tiWBbWfCpeS2GQ0f3emaFLiSOQl7obxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002842; c=relaxed/simple;
	bh=yVlgf9xVsoPpZPLC0GVc0YLAEnLjfqzQL7ZggKCLNQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7TojUnW/GjztxyFBCPJC0P1vdHZISuO6cTvPsLVrkCMAu3jwgNEyhJaswUfHjX8Ju2dHIp6M72xMsLbMH/ctFvhdw8AUXe/BoG1CeuL6+434NCOI9jm/0RB0Q9auQh8rL9OccBqnVrjCyLGPVHXqQUqwlDswqndSBsZKFPjlk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4EGDW6Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4EGDW6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002840; x=1791538840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yVlgf9xVsoPpZPLC0GVc0YLAEnLjfqzQL7ZggKCLNQg=;
  b=Q4EGDW6YcYG7IU2FmYg0+U1Q02W4dgagEiV54GIAJKY03VEfZVRGtxiF
   o98OwKqv2zEls3AwRKkKPx2KI7bI1e+i5oiRCIiejAXuBJVFS4j4KeAx8
   j2X9SHp4iWAZT7KbK2DtxRnWkrQQEsd85dYq2UXAHNUDjN/dwkryR3m3F
   Ue8PW3WcG9qCxugyF8E2huSum8ur1jWOK2HmS23fgCjRp2Jf8fkqlT+X5
   TYVOTT+Em0Lm0RPXHwCZqydYYaT2C9Dnd10cfcoKcjaQfmGsuZm/8EgmS
   teb3h1d9OWeBcfgTTLLM9stRoFOTn1jzkgGEd0jnG8BfBi1iRBPqBM+XP
   Q==;
X-CSE-ConnectionGUID: wcwCV/nvQXOGWcM/q4dzMQ==
X-CSE-MsgGUID: ZzpVYedFRiufEgQydFX96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113219"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:37 -0700
X-CSE-ConnectionGUID: D5HvVzxBQHySJaSTgrcVBQ==
X-CSE-MsgGUID: FY2RSZNGRXOOK3vVpYHKIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437962"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/9] ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
Date: Thu,  9 Oct 2025 17:40:17 +0800
Message-ID: <20251009094023.3474895-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the codec name_prefix of Intel SoundWire machine driver is
from the ACPI match table. We can have it in the asoc_sdw_codec_info
struct as a default name_prefix of a codec if there is no corresponding
audio config found in the ACPI match table.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 3c5e9b2af7f1..e289b453baba 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -68,6 +68,7 @@ struct asoc_sdw_codec_info {
 	const int part_id;
 	const int version_id;
 	const char *codec_name;
+	const char *name_prefix;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool ignore_internal_dmic;
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 56c72ef27e7b..cd41b0e16777 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -78,6 +78,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x700,
+		.name_prefix = "rt700",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -95,6 +96,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x711,
+		.name_prefix = "rt711",
 		.version_id = 3,
 		.dais = {
 			{
@@ -115,6 +117,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x711,
+		.name_prefix = "rt711",
 		.version_id = 2,
 		.dais = {
 			{
@@ -135,6 +138,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x712,
+		.name_prefix = "rt712",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -176,6 +180,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1712,
+		.name_prefix = "rt712-dmic",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -190,6 +195,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x713,
+		.name_prefix = "rt713",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -217,6 +223,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1713,
+		.name_prefix = "rt713-dmic",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -231,6 +238,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1308,
+		.name_prefix = "rt1308",
 		.acpi_id = "10EC1308",
 		.dais = {
 			{
@@ -253,6 +261,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1316,
+		.name_prefix = "rt1316",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -273,6 +282,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1318,
+		.name_prefix = "rt1318",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -293,6 +303,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1320,
+		.name_prefix = "rt1320",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -313,6 +324,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x714,
+		.name_prefix = "rt714",
 		.version_id = 3,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -328,6 +340,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x715,
+		.name_prefix = "rt715",
 		.version_id = 3,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -343,6 +356,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x714,
+		.name_prefix = "rt714",
 		.version_id = 2,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -358,6 +372,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x715,
+		.name_prefix = "rt715",
 		.version_id = 2,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -373,6 +388,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x721,
+		.name_prefix = "rt721",
 		.version_id = 3,
 		.dais = {
 			{
@@ -415,6 +431,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x722,
+		.name_prefix = "rt722",
 		.version_id = 3,
 		.dais = {
 			{
@@ -459,6 +476,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x8373,
+		.name_prefix = "Left",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -478,6 +496,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x8363,
+		.name_prefix = "Left",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -497,6 +516,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x5682,
+		.name_prefix = "rt5682",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -514,6 +534,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x3556,
+		.name_prefix = "AMP",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -566,6 +587,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x4242,
+		.name_prefix = "cs42l42",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -583,6 +605,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x4243,
+		.name_prefix = "cs42l43",
 		.codec_name = "cs42l43-codec",
 		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
 		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
@@ -634,6 +657,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
+		.name_prefix = "sdw_mockup_mmulti-function",
 		.version_id = 0,
 		.dais = {
 			{
@@ -659,6 +683,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
+		.name_prefix = "sdw_mockup_headset0",
 		.version_id = 0,
 		.dais = {
 			{
@@ -672,6 +697,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
+		.name_prefix = "sdw_mockup_amp1",
 		.version_id = 0,
 		.dais = {
 			{
@@ -685,6 +711,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x5555,
+		.name_prefix = "sdw_mockup_mic0",
 		.version_id = 0,
 		.dais = {
 			{
-- 
2.43.0

