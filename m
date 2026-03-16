Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1221576E
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623002; cv=none; b=mDkpkzmbHgRK0nsuvUsSVmNuPW36GA64s1qN0VYK4IEuH7xfHKv1WpkLYOcM+FVP8sUCZNXr20zuuysEdYrVeMUmIFkgZzonDr5eI5xTsNk6A7hkxGXKFFx/R2s7+nm0QntiXxBryO6awkfmyiB3S51f0ocUlpICLm/1HwcQDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623002; c=relaxed/simple;
	bh=ati1CF4tDZQhJzqSYaWPeoP5+DrYTvk6QlhTmSUyxhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRzOWYMdQa9oOXV0h7WkIHTzL/BcVOFe3IpxQWTqQAqLV75v6xZTrgtJJ+pR5FTNPfhMfftGZLJm8RTJo/HphMH5dsue0QZVHmn5TqXSWj0XoYmAhUaMAJoRw/v0D0Bb2jMdLWLG2wnilDssv6IErUfRbmX9+1UQa3X39Of7zAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXBqvfnk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXBqvfnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773623002; x=1805159002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ati1CF4tDZQhJzqSYaWPeoP5+DrYTvk6QlhTmSUyxhs=;
  b=KXBqvfnkLUy+q8sgY1Gwz8TFCs8GfydxLzLixs//SYMRvx6bt3XPWB42
   9+/K1Gft53jDZM+3Hj7BPeXUCDVEfRYYff5hQjqibU7wFc0b7A/BwMIBV
   GRvFdkoSEsYZH74ZySeNoX/UTB6QTIrCN4qMfFRbuTHaI/dQ2xVSdmPNN
   uObIOl8vTNVnWWZBYhUOmsYAmlYnDx7qILYzpWPzNGyE88s/gV/ccTFfl
   c773ZEJtntU79KCiIiJfDx3LRntRmKVShe4EoSpm7yE9OxowknApVHUZ4
   GHKIWEtCXM/3LJFdxvS7ozyZ0hiAqFzmnAmfdmiKf+C7wcQrPG5J3vX7C
   g==;
X-CSE-ConnectionGUID: E9djic5uQb60Rjhi6jk1GQ==
X-CSE-MsgGUID: HGyhzBbGSPqtM8pLBHvj1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78486098"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78486098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:22 -0700
X-CSE-ConnectionGUID: iM1bAjsYQp+5aZtAKhv8jA==
X-CSE-MsgGUID: psO3HJI/RemNRz0goniwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="244794708"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:03:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: soc_sdw_utils: remove codec name index of snd_soc_sdca codecs
Date: Mon, 16 Mar 2026 09:03:08 +0800
Message-ID: <20260316010308.285622-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
References: <20260316010308.285622-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The index could change if any endpoint is not present. Remove the index
and let the machine driver get the right codec name from the registered
components.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index ab197edeb75a..18f46e3afd60 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -819,7 +819,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {true, false},
-				.codec_name = "snd_soc_sdca.UAJ.1",
+				.codec_name = "snd_soc_sdca.UAJ",
 				.dai_name = "IT 41",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -827,7 +827,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.codec_name = "snd_soc_sdca.SmartMic.0",
+				.codec_name = "snd_soc_sdca.SmartMic",
 				.dai_name = "OT 113",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
@@ -835,7 +835,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.codec_name = "snd_soc_sdca.UAJ.1",
+				.codec_name = "snd_soc_sdca.UAJ",
 				.dai_name = "OT 36",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
@@ -844,7 +844,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 		.auxs = {
 			{
-				.codec_name = "snd_soc_sdca.HID.2",
+				.codec_name = "snd_soc_sdca.HID",
 			},
 		},
 		.aux_num = 1,
-- 
2.43.0

