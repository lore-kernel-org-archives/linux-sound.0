Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAF3B4EA5
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654714; cv=none; b=FNaGXRt7+AWBTuL6Y2PwFxaQ0Cf34M/QM+vD/af19H4/+UOI+lz6QwhFKI3Hc/wHHGDK4GtLuhTerN2B7sv8W13dLzpzkFpp3BflW1I5RN8bX6JehL6xWRxOBTht16OPm6JcvBoeRN1rjz9MI+GlxheiOXI+04dV/gCbcay6AcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654714; c=relaxed/simple;
	bh=2vjhNycSJACzq8q/+Ar8dms+ZaL0a5rX7VIFBbj/mp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JA+catubD1jkC2WtGNACiOOZTgk6MOPNLbQd0nm3vJj0c05UvubEac1rpSpdSHNtbds2SnmArN+MwtqQswcgIUHnt4UQKUVsQkf6/L7GLEgMrD+TG0SPHW3uNsSTqa7IbNRrYXfLXQ+O2xo8ZfSaUa8RK1bHvF/0JuTgXSKnSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlNUgMUI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlNUgMUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654712; x=1812190712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vjhNycSJACzq8q/+Ar8dms+ZaL0a5rX7VIFBbj/mp8=;
  b=GlNUgMUIB2WHyZRkF54vLkXUzdhCLuXn25+a21nIacDlOI6ctoUxfPy5
   8EYNYm4ovEmX1tO7B/RPjcsDlRygZm1nqJcwVzcsD1mvkzB22tFPCzY/B
   LdGxatGLqBiCzgbU7wrMrsPLBBcoM0NxgT7LD00TFUIsw5O9qLav92nv6
   ByXBP0Asv4KPSu1VxQ9vkmPUjGDzSAbJaePgAxhl/yTBMNt6lZKQJMkUT
   opSaNbPPX4Yy2C0LmWUbsEaURFexlIu2x9j7RdIUtCeDSa/z5x4K2ppIt
   RFhu+1GK4F1gjoMurBWHnR1Sdx3+wMmuoFoXgdTADf6NYLbTjjQLkDxqh
   A==;
X-CSE-ConnectionGUID: KWrmWWy1Rz2PVfaVBXn53A==
X-CSE-MsgGUID: hvG3OWSgS4Oyws6uWEIuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81610300"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81610300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:32 -0700
X-CSE-ConnectionGUID: dcHkXzEYTiSRWNMa7kvYaw==
X-CSE-MsgGUID: BF/9lqBdRyeMVkLopt1yDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243972167"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: soc_sdw_utils: add is_amp flag to all amps
Date: Fri,  5 Jun 2026 18:18:04 +0800
Message-ID: <20260605101805.121428-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
References: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The is_amp flag will be used for the codec name_prefix.
We detect it by checking if the codec support endpoints other than amp.
However, it is not accurate. Currently, the is_amp flag is only set to
the amps that include other types of endpoints. But it can't cover the
case that a monolithic codec that only the amp endpoint is present.
Add the is_amp flag to all amp type codecs and will set the name_prefix
by the flag in the follow up commit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 681452bb89f2..5de33ff0ae7c 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -227,6 +227,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x0102,
 		.part_id = 0x0000, /* TAS2783A */
 		.name_prefix = "tas2783",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, true},
@@ -417,6 +418,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.part_id = 0x1308,
 		.name_prefix = "rt1308",
 		.acpi_id = "10EC1308",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -440,6 +442,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x025d,
 		.part_id = 0x1316,
 		.name_prefix = "rt1316",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, true},
@@ -462,6 +465,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x025d,
 		.part_id = 0x1318,
 		.name_prefix = "rt1318",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, true},
@@ -712,6 +716,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x019f,
 		.part_id = 0x8373,
 		.name_prefix = "Left",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, true},
@@ -733,6 +738,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x019f,
 		.part_id = 0x8363,
 		.name_prefix = "Left",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -773,6 +779,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x01fa,
 		.part_id = 0x3556,
 		.name_prefix = "AMP",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -801,6 +808,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x01fa,
 		.part_id = 0x3557,
 		.name_prefix = "AMP",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -829,6 +837,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x01fa,
 		.part_id = 0x3563,
 		.name_prefix = "AMP",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -1190,6 +1199,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x0105,
 		.part_id = 0x55aa, /* amplifier mockup */
 		.name_prefix = "sdw_mockup_amp1",
+		.is_amp = true,
 		.version_id = 0,
 		.dais = {
 			{
-- 
2.43.0

