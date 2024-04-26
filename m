Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D9D15623B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145153; cv=none; b=Ww4frkB6bRKAuw4csdKg07D6fljErBc2f/KuVLZaY3lSC0T+Tni+5ILIUWMTdZLmt5MzxJupnhDdmeDgGTzeWR35Cw8H8sD2HKThSfaL/xABHDAlwEhYlp5R3ddjPjl74bdc0APhKhrjQsahwxx78myHrOn6EmKUtfPLSiQgSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145153; c=relaxed/simple;
	bh=LQ5nnQ9ZW00t49syyn/ph3zhQ6ZrAYJTQfp7YGjztmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPy5mlnZrLld20zQBWpSkBgfCE8MjFFGFb60i8EyJdxc+gX3kEepevzLqUE/QMxbTbhg3513cKWgyP/cHi+hZoho+GLU3B57ErA6PU9+j1QBArYyMzU1FwBD4TxcfAJ+WlkBt7TL9/8L0ZGhodDja5VuFrTQiuhbT+jVMUl52mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO4TVt99; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO4TVt99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145152; x=1745681152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LQ5nnQ9ZW00t49syyn/ph3zhQ6ZrAYJTQfp7YGjztmw=;
  b=YO4TVt99UgZNj+t15vni3+8HFKtQXJv4v4Jw66Ae2arB/IYPUpg8zovu
   6Urdc9ihojt2Pr8YL2yMXK7/WzUEJ0AEO97xlFmjnyoNaXxHJ7wJkwEJ6
   T2Evjmzl8HUmdAIaQZJuelnOVWwxlheerN+kAGWGDrt5pqxKEMCIKbzYf
   qZB/P2KsD1k9bsSxzPmcvcC1MNO/+c+IlcfA6CXvrwIMqCM4HSIZ0Z1vz
   QZNGTuhUNYwSVPB2U5oDiBkLlJgZbzkH9zQL0pFW/2tBSYChreZrUT9IL
   6cxotyCPsMtTUrbM6dp58OTjCujzynSv6q8ealhGbgH3ZBswBxUuHork9
   A==;
X-CSE-ConnectionGUID: 9KzvztLwSDWZZ8tdebAT4Q==
X-CSE-MsgGUID: zce5Ss2mRa+P8DEIJYB64g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291359"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:52 -0700
X-CSE-ConnectionGUID: 8tdpBL57QIiwE5dFtLAP+g==
X-CSE-MsgGUID: geWlkK8nQwGaBWXsOfh55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259610"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/23] ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682 board
Date: Fri, 26 Apr 2024 10:25:26 -0500
Message-Id: <20240426152529.38345-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Move default BYT/CHT quirk to driver_data of sof_rt5682 board. This
fixes a problem that DMI quirk of Minnowboard board got overwritten in
probe function since it's a BYT board.

Fixes: c68e07970eca ("ASoC: intel: sof_rt5682: Add quirk for number of HDMI DAI's")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7a35db5cab35..668b1672f570 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -638,7 +638,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
 	char *card_name;
-	bool is_legacy_cpu = false;
 	int ret;
 
 	if (pdev->id_entry && pdev->id_entry->driver_data)
@@ -646,14 +645,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
-	if (soc_intel_is_byt() || soc_intel_is_cht()) {
-		is_legacy_cpu = true;
-
-		/* default quirk for legacy cpu */
-		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-				   SOF_SSP_PORT_CODEC(2);
-	}
-
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
 	/* initialize ctx with board quirk */
@@ -676,7 +667,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (is_legacy_cpu) {
+	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
@@ -792,6 +783,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2)),
 	},
 	{
 		.name = "glk_rt5682_def",
-- 
2.40.1

