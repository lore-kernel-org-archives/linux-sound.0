Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973001607B7
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838576; cv=none; b=PavGFdpQc0Kn6Wyg1GgqfBCg5G5fKTc4FUeClubu/HZulZCY2JvPl8bi1EfasOsI/8+KIPR0EIZ4E5StOLxByvRuyL8v37Tkhe5JBx6q6d0D27xEKpT3PzZppcc/n57jE8YJknM17tafePPvYWpxe5PBN4f8OWHfSMdYbmz1ojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838576; c=relaxed/simple;
	bh=2m3wXl1aloLbGCx8+3UjrcvRoYSfSH2cV7nQxeM9yPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9ZHPerPCSwhFmi02aV7HwgSuX+V3tAtLskhFz5OIeLpzIoIhvsenndh8hPtKzvkk5DXgPMTc1XLrx+KdLmdHHKQE+pBGnc0SJ261k8RrgespgcVqfQXv77oCsUW/J1dZLhJu/ToKlB8pOHk7OWZpzF+07Jmf/0il0OAn76Qq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikGIXSDz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikGIXSDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838575; x=1748374575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2m3wXl1aloLbGCx8+3UjrcvRoYSfSH2cV7nQxeM9yPM=;
  b=ikGIXSDz36yAB9tdjhn3JX5aWyipNP6bjZq+hvw0PUZyBldiJqhZPxzy
   5zZ0WbO8aDVDceKpU3QTKeDmVaa5ESYcpa2SKOzyj32KbSQok1gRxjaQb
   YH/PIXUBVO0JAVqjTFyjECnOn7YFm54uDhL7UHYO5mxcw+E3eeTetSlQX
   xYTNgGQb6jwZ1iOf8L3xPN4z+TckQ56PLYbWPTbfdBP3Z4SELx6NuFXMX
   uU2HmSGFK0CtrHMNdfdkTyjIqhYT42XthXbQTdYjG7iQs9UUO6j+Yv2Ho
   peWotyx5JJk0aZnt4PuwClU7YJfpnXOmfvVuoPmLBBjshmaU6/C2IP7NE
   A==;
X-CSE-ConnectionGUID: OYtDAFIFTieuqGwIq6+j1w==
X-CSE-MsgGUID: ue8uqVeVSTq3UO5PNf04hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339346"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339346"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:15 -0700
X-CSE-ConnectionGUID: SzXWC9yzTX6l47CeOqX5AQ==
X-CSE-MsgGUID: lZ55y1mQQva053ZLa7PkXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029767"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/18] ASoC: Intel: sof_sdw: Add missing controls for cs42l43/cs35l56
Date: Mon, 27 May 2024 14:35:42 -0500
Message-ID: <20240527193552.165567-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

No reason for cs42l43 and cs35l56 not to offer pin switch controls for
the headphones and speakers, add these controls.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9dc50a6d5301..0516ae660824 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1059,6 +1059,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_cs_amp_init,
 				.rtd_init = cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
@@ -1094,6 +1096,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.rtd_init = cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
 				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
@@ -1119,6 +1123,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_cs42l43_spk_init,
 				.rtd_init = cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 				.quirk = SOF_CODEC_SPKR | SOF_SIDECAR_AMPS,
-- 
2.43.0

