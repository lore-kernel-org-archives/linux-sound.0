Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9421E3C2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047847; cv=none; b=YOeVmuXbDONmM3xp6tiW4hGpoF48NcoHR7a1ljvee7J0Ew5NDUh1D0SFSDWhCQ2RaKmjMOKkI5GTM/qVS6BSGlc1Gm2XZbEibtB2oVycABXH9ylBmJQPOCBPXXZcvvmvndGglkfmBA6xaBrkxL9CjyUekXr5aq4/Ryc+92iMiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047847; c=relaxed/simple;
	bh=nRCXKrcK+2X0hpKI4+Woq0FgH0goeE+zTdJeAqkMS7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1rU9A7Wa5eUgh4jEdzoCf9yxgtmHZmSIu5+jf0TVs8zOW/NmHtxBcts0RptnYqN5/G3G/WgTbnj/SyNJ43jYtZD52h5o0ZmmaNMhAocYx5/TIayLotMyuSL0ovgw/eh0ZpclwF5DJilcAHTIaOLEhvVWcp6ELGOU/6RruEYnwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5R6p5Qx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5R6p5Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047846; x=1760583846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRCXKrcK+2X0hpKI4+Woq0FgH0goeE+zTdJeAqkMS7E=;
  b=X5R6p5QxiDfOzQoPXigRusfVmXCflMFItJEigqBwh2dyq8lEhT2HtP0w
   gM8kAhHe244zIAS6ULygeZMu1z7otsHcGAXgfdudqF4tv+Jj3JqpmUtX8
   CXp7p/dVzmRKeltOzUUO3JuiF2uz30wyLGFiF7ucCcUYlAS4GcwzAFalf
   458cFezSoBUq3tt4d2SlUf8hhbXBMRCamKPEUFbZFltrhbt0vHo/GtImg
   ovh0kRzj6V+V6yihHLwfJuDsbiGZGiN0MGx7epXe/yniW6z/nnM221rSl
   +4S5AF4j15/i6k1m1HWfLZ2i0LTIcuxHDayrtNFiGFoIiE+5ufzOscVAW
   A==;
X-CSE-ConnectionGUID: qrwgjrUaRiyPaLqnrPimtA==
X-CSE-MsgGUID: COA+QVjvS0yCXzssLoEDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28265564"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28265564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:06 -0700
X-CSE-ConnectionGUID: L7AcoobxR9aCoKqG5kn1dw==
X-CSE-MsgGUID: eCAX4l/ySR+eFhppH4D31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77979251"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops
Date: Wed, 16 Oct 2024 11:03:44 +0800
Message-ID: <20241016030344.13535-5-yung-chuan.liao@linux.intel.com>
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

Add some more sidecar amplifier quirks.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f08636589284..a6e391791bad 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -580,6 +580,30 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "3838")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "3832")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "380E")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
@@ -589,6 +613,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		/* Note this quirk excludes the CODEC mic */
 		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233B")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+	},
 
 	/* ArrowLake devices */
 	{
-- 
2.43.0

