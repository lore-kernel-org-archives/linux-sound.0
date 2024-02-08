Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986227FBB5
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411368; cv=none; b=JLVQPAwKzOdQ4087Nwjt+xcOsePkJokZofvBHRg77QG4gfjPMqrBEO8HGhRRjr7SsIAmORTZwYWjl4TfDlfuhb5bDt1ehUS7VOTgPf2x0zKJakv4Esm8m5kJPC28ufK+hLfI9dL5UhYIH7qwdFUVIa56YwAphHiOR6e7Lj+sPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411368; c=relaxed/simple;
	bh=V92CfbYk61vu8Lu87qyGidx+d8Y00Or+SdwAb6vYum4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYOHTspkibygsI2tHxWaHFlEhbGdyt5qMgbY6VvHfDQri1Zt9OpjGL1cNA6Eu9cO+fmSjU0x+m/C4B5pu1gQ/8+4r8GnUWfrATepWcF3Fa+8yqHPNPVzWmh+hgceJu//Q5fo37fLhTFDPByV4ZmGi+DMMdgTunFmMCWluyduTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrftcF3I; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrftcF3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411367; x=1738947367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V92CfbYk61vu8Lu87qyGidx+d8Y00Or+SdwAb6vYum4=;
  b=lrftcF3Idl42iyMWz9E4Fq2SSlvbh7B52CVNNvS5SPQHhxONfk14IbYg
   cpcHSb3qC7Dfg+WmpeZQFl78sEGez90vxLeBHVpEQEWh2BlpOP1KkWZnZ
   rJP3ZpV58Ii7xuwnFcXwG5WbBi+pbwdlAcnROwqahPSLYT2FfsD04EhsX
   GYJkdtieAGjAnRtpeYdNmpKsyiebF80J5nYoMiTbLr55oIUzPVhQxjzQ8
   WpL8X6LX6F48QoRc1AUSqvFde05TN8v5Ey+ye/2Vb6hkyMgAZ6sQATlYq
   UJujC6NSYu+nohPAqoQXx5LlnYCcgVhiZpc8zirAxxSvYiR3nIs45Hb32
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675419"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690269"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	mosomate <mosomate@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/24] ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710) laptops
Date: Thu,  8 Feb 2024 10:55:40 -0600
Message-Id: <20240208165545.93811-20-pierre-louis.bossart@linux.intel.com>
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

From: mosomate <mosomate@gmail.com>

Added DMI quirk to handle the rebranded variants of Intel NUC M15
(LAPRC710) laptops. The DMI matching is based on motherboard
attributes.

Link: https://github.com/thesofproject/linux/issues/4218
Signed-off-by: Máté Mosonyi <mosomate@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c   |  8 ++++++++
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 9ebdd0cd0b1c..91ab97a456fa 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -130,6 +130,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_rooks_county,
 	},
+	{
+		/* quirk used for NUC15 LAPRC710 skew */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)intel_rooks_county,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 801cfe9c4dd3..e4b9f4d1ec06 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -236,6 +236,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					RT711_JD2_100K),
 	},
+	{
+		/* NUC15 LAPRC710 skews */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					RT711_JD2_100K),
+	},
 	/* TigerLake-SDCA devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

