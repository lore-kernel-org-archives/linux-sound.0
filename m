Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0F1DDC2C
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 02:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752029893; cv=none; b=R760EHgUBb/t4O/pxJX71neSLAuXrpM9NN5GWBscD4W3cK1RX1AlZzFo9V4AQBtBSW/cdrT4GWl0v9D3PEBAVUu5mT/fo3N8kezPjJ7FVbCZwOFlsxGviRanVoq2W5jw79S2M6mte92CNeOfC1Ygx/3PMe47gy0lVw0Vm/iJ2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752029893; c=relaxed/simple;
	bh=Vq5hu7c15B3Qdoj6YJqqwrcfYtaflyx6lextx6axTg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUDkjAP15SbdkLNuWOI0Dwn29N9lo4i4NybNCdtSkcswYTgUH0yuckytLTRP5PPrnmneAavjdbhs5ohKHY1urPi7C7YMVVoXQ05JhhMqahIRa+L4kUy12QTOUSvV6Av/ozH2r2botgB/GOeTJaytG+rXBgHAhRPP/0pIpThwXt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxKz1ABW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxKz1ABW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752029891; x=1783565891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vq5hu7c15B3Qdoj6YJqqwrcfYtaflyx6lextx6axTg8=;
  b=PxKz1ABWzBEgP6GxpFJ0xzXMtNAAUYqmVRn77TvAqRuLg5SZRJeP+g+Z
   DkF424dwzwR0NLZi8jkkODrYzOyoRHHZvts9o9qVVVafjg+FPMY3fJxdQ
   XQn4xnhtfVmfeEkRIdx4j4OQm6mxvtZZzxAJU2A9xaYYc02oCYOeW9OcU
   B3aEn01NcpDEktPKMkwjFU6ofHQ9SnbFVg3SAVeHVSDhByqm5ES6/lEkk
   VZyOytQ3OdQiLDmJ9dSKaxkxk66hJI7OAYnwl1oKhUDu2vlpvJKS2Kda/
   JPT2hVqNpV+zOQeljHVCph15edezQD8TOAV8BilwquQhzRUtiQN29THBD
   A==;
X-CSE-ConnectionGUID: uMrlczDCQ9OVMZtnfSzSSQ==
X-CSE-MsgGUID: m3Yrw2S7SK20IIJRdsplAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54423535"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54423535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 19:57:56 -0700
X-CSE-ConnectionGUID: SkhHvmquTnqJe+SU5S0KxQ==
X-CSE-MsgGUID: cIp1iaTwS3GfogTcNP2Q5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="192836434"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 19:57:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: sdw_utils: Add missed component_name strings for speaker amps
Date: Wed,  9 Jul 2025 10:57:45 +0800
Message-ID: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Several speaker amp was missed when the compoennt_name was added, which
results missing " spk:" from the components string, confusing UCM.

Fixes: f792733e08d5 ("ASoC: sdw_utils: add component_name string to dai_info")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index a744ca019378..1580331cd34c 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -218,6 +218,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt1308-aif",
+				.component_name = "rt1308",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_rt_amp_init,
@@ -238,6 +239,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt1316-aif",
+				.component_name = "rt1316",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_rt_amp_init,
@@ -257,6 +259,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "rt1318-aif",
+				.component_name = "rt1318",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_rt_amp_init,
@@ -370,6 +373,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt721-sdca-aif2",
+				.component_name = "rt721",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt721-sdca codec driver*/
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -596,6 +600,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp6",
+				.component_name = "cs42l43",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_cs42l43_spk_init,
-- 
2.43.0

