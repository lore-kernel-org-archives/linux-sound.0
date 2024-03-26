Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6F13CAB1
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469142; cv=none; b=ZoTmnuUlZamyG33LJIwA6r65j5oYC1OTW2DNAkc5ksOKaMWyCTMHVKi98fD/7jgiW4G53RyWuryOoMtTYLNkj0zihzcN3Gx862PLDxvsTPw1kzk6WMr4xe4vfq94i2mG1areUY0AHa6ELnTGgTOb0N9lgfPj1enjCKH5YZMc7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469142; c=relaxed/simple;
	bh=YMFANXByotTvz7ZAP+9o35CxIDW0uJSAVkZ2qrDO9cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhtpICfYTaAkVTNiZzwjMj+ZFcbhUTrw6PbKYgmnCDejtCOfoORwcVYoNM1Kuq0JzyqfTbhCdZMUI+REbTQkMdYkKhvKSszm305dzqtCdH+sI9qFlPsrrErh4NGWQMyykWFb1RS0mYpv78omDk+H16k3ziwM+oKRKTnOeLI4reg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoRa6Ci4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoRa6Ci4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469141; x=1743005141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMFANXByotTvz7ZAP+9o35CxIDW0uJSAVkZ2qrDO9cg=;
  b=QoRa6Ci4LyPGLtrw6fR0/xthxEyY5jheGqupjriP6R0F4F1Ftroxaya8
   CbumXmROz4rgXf5YBK9EJCY8EOA2LUnzFGoeFxyrkPjZkonwhiAVjlevo
   nj24osk18LhpF/33tnuWxZpD2+7SBnZrgCyXVf001zQ8sNL1a8tJwQuqB
   E/B1BmhThAXTXwdjtKmYLsLnlvREVI4b6pCcqnnlU7Hlbv/QhWvXViVw8
   ZD/NqFjOvDdteVlyKVyOywStbEQFIzYbnUA0uqayIfOx0Wdfszijhc6WZ
   CrZIplAfyOs1OQpRvLcCUT2Xmz9pabJZcicynbxXEhg6Myswjjn0YkceK
   A==;
X-CSE-ConnectionGUID: taDVkj+mSwq3jlq+GrhLtA==
X-CSE-MsgGUID: Y/hvjmITQk24bnY3lZgieA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260538"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482452"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 29/34] ASoC: Intel: sof_sdw: change rt715-sdca dai name
Date: Tue, 26 Mar 2024 11:04:24 -0500
Message-Id: <20240326160429.13560-30-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

As rt715-sdca dai name has been changed in codec driver, we should
change it in machine driver, too. Changing the dai name in
codec_info_list[] also help sof_sdw_rtd_init() to run .rtd_init()
from the same codec.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c         | 4 ++--
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3874da8d7fe4..1816ec5dd580 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -838,7 +838,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {false, true},
-				.dai_name = "rt715-aif2",
+				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
@@ -853,7 +853,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {false, true},
-				.dai_name = "rt715-aif2",
+				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 5aec8422656c..2f7ed9b31e79 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -14,6 +14,7 @@
 
 static const char * const dmics[] = {
 	"rt715",
+	"rt715-sdca",
 	"rt712-sdca-dmic",
 	"rt722-sdca",
 };
-- 
2.40.1

