Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127B30CD8B
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426038; cv=none; b=noOU6BeH2Dofc54TsUbKv6pFjb/kyXGR1UBIfDY3qOsalqvReg5Gj3xNr9bfggacIz6RKNqW9Qpcl4ttk2b5QQEC14bUtg78yrfpUvXwIF5pethDb5NyKLciaAkRjKj94z8F8nYKjWqoYvHBisGv7QeGJ6QXbrdrND1PkphExZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426038; c=relaxed/simple;
	bh=rvykyq6u3GzqpQ42PlJj+e4B1sO9cx+0JxFL+H5/NdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IG7nqYIdHskuMmxpBuLVKSi9LcoCOt93fcABC8GlF2H+Oaxoy1kEXhKmMbPG8C2Vqbm3I26GQUwfcB08gjb8L3T5BQmEYVGZHezby2XqGnubfYJ0KUu84z4rFM2xMy065JEobkQsTdgQ4q1qrIeA8VXohvqWCb7pFDU0oVCSH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI53Mxws; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI53Mxws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426036; x=1791962036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rvykyq6u3GzqpQ42PlJj+e4B1sO9cx+0JxFL+H5/NdU=;
  b=iI53Mxws4/9p8wEnmNPh7bAMmE+11IQk4E4sGND0KGbZdZ5O5WsdSIQv
   x3f9k1N7nUWjFVgdAK1/z69lfcjhD1hml5F84I7dTYxXiKnP4DN1EYjz9
   /K+iI3pOWHgZ7IR3Ah2ruoBqbKW4AVKBQMRsOtIrZvvAVnGbETE2yHSwX
   0mgineFuze39gK4cU8Vg20wP29jyF7/0yTGtQrvBlWNHnMSoeBh59E0My
   GZK/7Zk3OzFEHyBaQbioQH4uKVYVVb5SWNszTdczgHNCDXxGQBDuAg+hP
   3GPt8+L+u7kR216P6s0oDpDd+oizHnSNASsmO/dH3dzsuItUFcHqUqanf
   A==;
X-CSE-ConnectionGUID: v4iYXnrcT0uEhr3e63snag==
X-CSE-MsgGUID: Ix3CwpKdTfqWwNi9IalKBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233673"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:56 -0700
X-CSE-ConnectionGUID: htJXtwCtRdGj38hQo3iScQ==
X-CSE-MsgGUID: kPA06oh1Qde9QndyhcPgBg==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 3/9] ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_info struct
Date: Tue, 14 Oct 2025 15:13:29 +0800
Message-ID: <20251014071335.3844631-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
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
 sound/soc/sdw_utils/soc_sdw_utils.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index 56c72ef27e7b..d2db597f84c0 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -60,6 +60,7 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x0000, /* TAS2783A */
+		.name_prefix = "tas2783",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -78,6 +79,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x700,
+		.name_prefix = "rt700",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -95,6 +97,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x711,
+		.name_prefix = "rt711",
 		.version_id = 3,
 		.dais = {
 			{
@@ -115,6 +118,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x711,
+		.name_prefix = "rt711",
 		.version_id = 2,
 		.dais = {
 			{
@@ -135,6 +139,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x712,
+		.name_prefix = "rt712",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -176,6 +181,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1712,
+		.name_prefix = "rt712-dmic",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -190,6 +196,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x713,
+		.name_prefix = "rt713",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -217,6 +224,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1713,
+		.name_prefix = "rt713-dmic",
 		.version_id = 3,
 		.dais =	{
 			{
@@ -231,6 +239,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1308,
+		.name_prefix = "rt1308",
 		.acpi_id = "10EC1308",
 		.dais = {
 			{
@@ -253,6 +262,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1316,
+		.name_prefix = "rt1316",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -273,6 +283,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1318,
+		.name_prefix = "rt1318",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -293,6 +304,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x1320,
+		.name_prefix = "rt1320",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -313,6 +325,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x714,
+		.name_prefix = "rt714",
 		.version_id = 3,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -328,6 +341,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x715,
+		.name_prefix = "rt715",
 		.version_id = 3,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -343,6 +357,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x714,
+		.name_prefix = "rt714",
 		.version_id = 2,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -358,6 +373,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x715,
+		.name_prefix = "rt715",
 		.version_id = 2,
 		.ignore_internal_dmic = true,
 		.dais = {
@@ -373,6 +389,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x721,
+		.name_prefix = "rt721",
 		.version_id = 3,
 		.dais = {
 			{
@@ -415,6 +432,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x722,
+		.name_prefix = "rt722",
 		.version_id = 3,
 		.dais = {
 			{
@@ -459,6 +477,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x8373,
+		.name_prefix = "Left",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -478,6 +497,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x8363,
+		.name_prefix = "Left",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -497,6 +517,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x5682,
+		.name_prefix = "rt5682",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -514,6 +535,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x3556,
+		.name_prefix = "AMP",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -540,6 +562,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x3563,
+		.name_prefix = "AMP",
 		.dais = {
 			{
 				.direction = {true, false},
@@ -566,6 +589,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x4242,
+		.name_prefix = "cs42l42",
 		.dais = {
 			{
 				.direction = {true, true},
@@ -583,6 +607,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x4243,
+		.name_prefix = "cs42l43",
 		.codec_name = "cs42l43-codec",
 		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
 		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
@@ -634,6 +659,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
+		.name_prefix = "sdw_mockup_mmulti-function",
 		.version_id = 0,
 		.dais = {
 			{
@@ -659,6 +685,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
+		.name_prefix = "sdw_mockup_headset0",
 		.version_id = 0,
 		.dais = {
 			{
@@ -672,6 +699,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
+		.name_prefix = "sdw_mockup_amp1",
 		.version_id = 0,
 		.dais = {
 			{
@@ -685,6 +713,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x5555,
+		.name_prefix = "sdw_mockup_mic0",
 		.version_id = 0,
 		.dais = {
 			{
-- 
2.43.0

