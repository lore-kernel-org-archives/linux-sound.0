Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B5B674
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723068; cv=none; b=Q1asm32sQmrGsX6nSwrA32nl/jiz+iPUg3EnBZqE5+ccehkCJ6/pAczNGsPOzsS14YN8XyIk1EGTyRcQzNXV8qtrJwEJkLsKc1UJ/zzcEu31RCBgpjUSJviuFb/iSld4hsRNxL0Bi9Qa1cWSedjTbn2kxA/ALsXu0VFa5F2mfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723068; c=relaxed/simple;
	bh=plgYLZUH4hSB8RBHdWrUYinlJ2D8P8EfiRGnW+DxjRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sExWOexfHIc1BD9UfqaZlsT9F7z9hdsP978l7riM/1cqbeTKRjwRFKmjjGpAccMVuUBesH3IS0jVT6CcqicpT39c7/nuL1gEaqkdllEJbvA57dkOvhefW4Lv1Vlf3AbaqjNyOYKKiMyDaLZS1PBYzY1GYLr4ayXW9OkiLypxmqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1sro0gy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1sro0gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723067; x=1756259067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=plgYLZUH4hSB8RBHdWrUYinlJ2D8P8EfiRGnW+DxjRs=;
  b=c1sro0gynaUXu3Govj3bQc97atEXwIIoe4Xros+1l+UyO8b55uauU+Cj
   1BLhAb7OE2HoNoA0ZmHgkbjhA9rLYOI2gs3QEIFM/Pj3QVV45ExT0l88m
   jKssoHdOeYKUCVMK955zWItSj1PN7T+vHKm6uMREHl1Yh2pJ40FmMbp2F
   6mfY1rkDBMB852FRGqTNLnytiCyQv3+IM2xfgUyH0DaRLuFHbosweRiiY
   vs3X35EHITinEO3Px/q4sfyxVmBj3drRvy86NIFIZjagDXN+KFP9/ovez
   bV3YUulXvmwhMO0xwzcoblj0KYNa52sn5N5tIo5OVfrQVi7/giN9WhiWm
   w==;
X-CSE-ConnectionGUID: MVJCadVaTBmPA8/PJDdZQg==
X-CSE-MsgGUID: DRQz7Bl4TxCKXcaAD6Cw/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22985002"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22985002"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:27 -0700
X-CSE-ConnectionGUID: CluTBK1RR5ujlvc3ncnoAg==
X-CSE-MsgGUID: XiizgidwRx+Xu+ouuowWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427975"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 16/16] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
Date: Tue, 27 Aug 2024 09:43:28 +0800
Message-ID: <20240827014329.6542-17-yung-chuan.liao@linux.intel.com>
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

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add quirks for some new Dell laptops using cs42l43's speaker outputs.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b06948c16b3f..855109d22131 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -480,6 +480,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF9")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -540,6 +548,56 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDB")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDC")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDD")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF8")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+
+	/* ArrowLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE8")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF7")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0

