Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698A21E3C2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047842; cv=none; b=sWDtnraWwUb4KMmxDvPGUv8RMJ0hE3Kv3JpLT5vcBLU4TIG0HRAcEQZRUPq/xOiE8y2s9SfaGJFaqqiVb9Ze3iVO+uYbTJFEOhNJK9Fovdgz70kJJqTV80kcZKTLJSEfekr6MVGNnJkFFgSZwBMFiYBS2nJMS+kIkxOsHdMYLiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047842; c=relaxed/simple;
	bh=WOdsbh88JUit1Hrl57mJJGYfFOcLvU1H/HJyDTOUlxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDkJQccb4JoVTtXpPHRvW0A6mWFkyT/Cp29vq6/rAI1ZQwP68PDBr2+56vteY3YUmbkLbZ9WPFE2laVeDtFQl/SOpMyLbJ8mqnJ+tGmE4NU1XO8yeYhgOKLE2dB24zrzuKf6dHQdpEaWebTDw57p/xVm2CV6ZQQS0MpG8axIlBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFbDGr0L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFbDGr0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047841; x=1760583841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WOdsbh88JUit1Hrl57mJJGYfFOcLvU1H/HJyDTOUlxk=;
  b=KFbDGr0L03H2jb45Lmw98/xJeSTZAMfLhHPHP20GMB6AHiqEGEHqKP5v
   Vu7dlic4B/kAIFPUC+D6LivB+kYt5xZbvPywqoPmXCAMmjbV26pRFaMCs
   Kt05iSWz8AxCEAf/Iqt7oiM36sOu3YnTU3tkWba266JWeCrQKs3Pi5pWo
   8fC/UDxfLCU2fPeI8HxWzwclPxshZh6FQ6iPLMjF5PGitcOrK4HN3D1+7
   148wI0dZBTQlCeCVOGlcUjcXTJ/J5eUewVelukNMjiXc5ww7jnMNIQbGY
   Ghq865VvN38FKZXdZ31BqW00byP7kIe8cROn98Ay/k0juCbbWxiyFTtJ+
   w==;
X-CSE-ConnectionGUID: QJNOtK3DTXqWHW5CuAjHlg==
X-CSE-MsgGUID: UINDdhQARPWyM+8nDlu2jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28265543"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28265543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:01 -0700
X-CSE-ConnectionGUID: /p8VoJoqSPqgvpWUAgN65w==
X-CSE-MsgGUID: kEEE9/ZiSuWZDwcLAzn50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77979238"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:03:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/4] ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be ignored
Date: Wed, 16 Oct 2024 11:03:42 +0800
Message-ID: <20241016030344.13535-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
References: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

To support some systems using host microphones add a quirk to allow the
cs42l43 microphone DAI link to be ignored.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       | 1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index e16fccd48e6b..a25f94d6eb67 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -28,6 +28,7 @@
  *   - SOC_SDW_CODEC_SPKR | SOF_SIDECAR_AMPS - Not currently supported
  */
 #define SOC_SDW_SIDECAR_AMPS		BIT(16)
+#define SOC_SDW_CODEC_MIC		BIT(17)
 
 #define SOC_SDW_UNUSED_DAI_ID		-1
 #define SOC_SDW_JACK_OUT_DAI_ID		0
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f86d55cdaaf6..6f6bff0f69fc 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -528,6 +528,8 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
 				.widgets = generic_dmic_widgets,
 				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
 			},
 			{
 				.direction = {false, true},
-- 
2.43.0

