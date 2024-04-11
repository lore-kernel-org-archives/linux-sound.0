Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303B3B182
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873055; cv=none; b=ua9t9dSmvtAKljnj/fls2cOfgxrJMgvJySZ5H9PcGETms0zlp+mGBQ0vsV1aqJ4uMB3Uu/ssKvShpOLM1jYurzy0k60gv2K15HtLlQt9lnHV9n98HE2Dc5LOAS8wQh5lyvBVKQ2DVciE553rWLI0de/DE5s4UGQIss/WImFoKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873055; c=relaxed/simple;
	bh=oqtHSPMLAUON0JmK9Out3TiJRj9J67t4yJqtjUWl/kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eNKXtgkXkHyUIIs6MY4CmhQ+7J0qMQNIY9pfG60xZD+odb6zzOt/ivPWrjmmdRrH/Sr0JYu3VXHNn5QprumP+ENXuWLe347S+rnksBRh0Zu2CG8su6+kGJtN15h0PIq5U6bz/iFcCLD1wA3RjWujkAjYGxpVitEPVjBfq3xU5WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO4pCxu0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO4pCxu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873054; x=1744409054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oqtHSPMLAUON0JmK9Out3TiJRj9J67t4yJqtjUWl/kM=;
  b=UO4pCxu0dsDAh6xWBGLnWRKxfxW9ZN8dnUQXq6zjHDWuUKtRdtjdPdvm
   qIyKdR8vGggofDtrhTfYDV/ORQjTQ4jLzojJWk1xH298pZZKGz7W/ISNu
   KIt7UWKOkJzgTMROO1mSkIvJw3XR0fOrLs12xl1XuVkvbNNK2aPFgn/JY
   HgzkjJtgyKnxkxUuNSb87rStSu3tOBsw4W+wJLHR2sbP285UteEYzl9H9
   r4ZLVPoKejnJX3G4U/qkSlYed9LPCQ2DFR4A8RC+VZs4QPaLoXBUPXHJg
   D15GY+1HDEu40J2oh+cKPCAICR6qYbbIQGXfZyaV/RiQv0qYS5MxoJUFv
   w==;
X-CSE-ConnectionGUID: j1wc59zBRBS2CLcbdPSASA==
X-CSE-MsgGUID: b84Mczp5RuqYrjnQrqOszA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708336"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:12 -0700
X-CSE-ConnectionGUID: 3ANGd8e5S9W4NuJjisqYnw==
X-CSE-MsgGUID: QqoSnvSjRG20aoIcUe5l5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628698"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/12] ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init for Realtek multi-function codecs
Date: Thu, 11 Apr 2024 17:03:36 -0500
Message-Id: <20240411220347.131267-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We do need "info->amp_num++;" for the speaker dai.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b94835448b1b..8a2cd19d8be6 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -737,6 +737,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt712_spk_rtd_init,
 			},
 		},
@@ -912,6 +914,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt722_spk_rtd_init,
 			},
 			{
-- 
2.40.1

