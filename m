Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B51BA49
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723051; cv=none; b=UiIEADqLkIr7rqZ2wDEnYZgrUU3BzmnNHx/UZSSn43VB8L1u3R2GjaX99f763aj65FfuQhTEY+/961g+MqU8YgDgzNNiggN58a92EzAQHlUNq4TDQCPbQMBlz2ZssWWPEju828WY/POL+1rTXMMFJBLstrgiKK6Yoc627/wSSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723051; c=relaxed/simple;
	bh=PxL0aMKSvwXL//qeHZymFfYwo3xE8toXcHBVq72XSEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYACAAvj5NTtAWDty4miZqsgtSm2a35/Ny1b7IhW0VZtvuYhAozYhIpvaQPDYYsc8vXx5RZ5/sijdDBtpQxq851qmO/3+m9M8aQ8pbIQ8zBH1BgqlT5QCFtYBQxF9/s1+KjdL6NzJMP7JAGYuDTKhPMHDR3lCwBtT8Hip5Cxy6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIFdz9Ae; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIFdz9Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723050; x=1756259050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PxL0aMKSvwXL//qeHZymFfYwo3xE8toXcHBVq72XSEQ=;
  b=jIFdz9AeldHtBX1lxgQFlkyyYhsExXcI1Hn3Zj9EEgLAoJ9U8T0blZ38
   y1PKkEYL+kLSSnyDTxy+o2IkIxkifp9UhlIVBRg81sfV450AlYDgTAm0J
   QP9UzyBeBM/BhqfjsbmkizC+NauEVOvw3C+S+u0pYB7CreDlDPG4n/BQY
   50Aj8XdshEE8QNtShR9kQspmfJhSwV4Mdr0FtTh+Bq5BAd5g7dDkmBFPk
   wUA+WoAkHxRHPvz83qMuumgzJPn4ecDXAqSa8FOKWqtegF0r8acrNBPH7
   3Vu4jF7q4VW7xM2WScD0Ykb0Y3ShKdPq855fEpDOm5w3GjXNpxJo4tVX2
   g==;
X-CSE-ConnectionGUID: sY33S5dQRP+LdoGdl3duKQ==
X-CSE-MsgGUID: qmPFQLPBQJCSxfnxuCkGrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984953"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:10 -0700
X-CSE-ConnectionGUID: bDsUov8ETyGFC8A/1hlABg==
X-CSE-MsgGUID: Jysze/AERBGfN4YUCZ05ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427935"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:07 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 10/16] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL match table
Date: Tue, 27 Aug 2024 09:43:22 +0800
Message-ID: <20240827014329.6542-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture via I2S feature support in ARL platform.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c               | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index b45d0501f109..578271b4230a 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -818,6 +818,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
 					SOF_ES8336_JD_INVERTED),
 	},
+	{
+		.name = "arl_es83x6_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_ES8336_SSP_CODEC(1) |
+					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
+					SOF_HDMI_CAPTURE_1_SSP(0) |
+					SOF_HDMI_CAPTURE_2_SSP(2) |
+					SOF_SSP_HDMI_CAPTURE_PRESENT |
+					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
+					SOF_ES8336_JD_INVERTED),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 304f974dc960..8f69d61ea39c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -100,7 +100,19 @@ static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs arl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
+	{
+		.comp_ids = &arl_essx_83x6,
+		.drv_name = "arl_es83x6_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &arl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-arl-es83x6-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &arl_essx_83x6,
 		.drv_name = "sof-essx8336",
-- 
2.43.0

