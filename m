Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1251280BF0
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411370; cv=none; b=fZFm6HxlvxzlSnE5PMHr6O2k+YbPWtTDzw7Ep2JiWeiKQMqPSJf1pitaphe3BIiSGr0xAHxay9xIva/soAbO6POeGNyxj3oF+YHEDmR8dYnFzDlUol9fBkrnTok7OUZL4D+AbdMd7/X9qpGYNnimmxkdIva4HorOgL2eMyV9Wuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411370; c=relaxed/simple;
	bh=Q3kKBT2OCE5WYq141Fdi7TsGKTc9+dGxIYt5YbVnmB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTVHehU3PqtUbHPmcpP3QCiqjh9LXoGREK0/lk7YHOGUyzt/5y1dhWBQzFNp8JhTirdqjEWKVkBdzqM2CC51j1A/ychef4hM6hZT5opYThh67eGXPiWFqqUnWqQf83GfzyzUMh8v2ecgphM49AAv9uOZLaha/GXh0PVwVLtC4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+HpkBVU; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+HpkBVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3kKBT2OCE5WYq141Fdi7TsGKTc9+dGxIYt5YbVnmB0=;
  b=Q+HpkBVU/GdB3x2WEn9kt/EOwjs2SPIHiSJKTlEumvz4qg89xFG6DHW6
   xpSWe8ROq5V1IxQHv7djEsMzdjk0xw5eVwEt8lekKl/vrDyHq3TpzMT6+
   2J8/L5+MzI9RPeDN0m1z/58RgcyL5nhYyFNcI9PaR73umaz079AnqHlZs
   yO9Lp4NqDpjOCG8xg8Ty1wW8c808qNzIXR22C2Zu//HfpCw/zDEVIFKkm
   dX1OFnF3AtnY/Pgw6BK6bQnw4Fxb07yXB8mzGUSzDyO7RDqGKcKS/JAKj
   pbMTl37ERTpcvNF3Px9lmAOThpCJOq1g4mpQwiv83d+5GCttypwsX3pJo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675426"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675426"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690275"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/24] ASoC: Intel: ssp-common: Add stub for sof_ssp_get_codec_name
Date: Thu,  8 Feb 2024 10:55:41 -0600
Message-Id: <20240208165545.93811-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

As this function is now used in sof_board_helpers it requires a build
stub for the case SSP_COMMON is not built in.

Fixes: ba0c7c328762 ("ASoC: Intel: board_helpers: support amp link initialization")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_common.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
index 6d827103479b..d24888bc99fd 100644
--- a/sound/soc/intel/boards/sof_ssp_common.h
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -67,6 +67,14 @@ enum sof_ssp_codec {
 
 enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
 enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON)
 const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
+#else
+static inline const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
+{
+	return NULL;
+}
+#endif
 
 #endif /* __SOF_SSP_COMMON_H */
-- 
2.40.1

