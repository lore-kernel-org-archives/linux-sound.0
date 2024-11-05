Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AF1D3195
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805071; cv=none; b=q68erNL/Cfj2tSrwSwR6/NfjJCw2bKk+NghMrDvIDbF8w0nAdWNjkZZSUeZcTqnI3ONbcdUDENpHgEAIkUWvfpk3VLCr5nZRsIrUUPUrU79yhAFpVYwXqeSfZRkf/PXaaBgP3zMPuEFdELdJrPk+MF8VacWvJnJ6gGODNHPIqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805071; c=relaxed/simple;
	bh=HLn1onA7Q1EHYrgsINywbRfo+u78y/ij4Levl6FiA9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4MB9P8ZC0cDAQVvxxo9juHz315nt87CjUjBubbtK3mZ1IVOGnKi+9YkCIVm3zVxIzZDjNGfSSv7J8etPOKQHUTmIflcGxK9pTlmlQN1Gh/MlEK5FcrSZELqC3S2BJI8+AbmspYx41IRKYkhAm3rtKf4KqHk/5miQ3JKXTO1+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL7JXb1a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL7JXb1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730805067; x=1762341067;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HLn1onA7Q1EHYrgsINywbRfo+u78y/ij4Levl6FiA9s=;
  b=kL7JXb1a7yD36XaDBRsRmLLbmFsv3pW/Hr+1IWozqhPJiHgFPrn3JMh4
   mT3OIqdmYmY3Ljg7Ob0rTkh97kZHnzYKJpjopplUkQ9vBRadY4avF8AiO
   Ioj3OZu370+1kmjeV7RIsvgPTvT3zJKut74HqNxza+LGDe55lIB6x9nZI
   a9XjBitchqjqaEVxncEpkgan1TD9W7T2hDgoGdXJKqrVahiCySfV4K5Gn
   /AaoIqZHOQ3wNnvnpd4ZP4ieUJ12PvLkFTzlz5tJeM/gWnW2LnfItB7UT
   xrD+h9ShQAaci2beZmVC2ZHNLHsmpAtqYoSepd32iTq3/MjbUSqAxn5mZ
   g==;
X-CSE-ConnectionGUID: yI5aeh6eQVmINdRGxWA0gA==
X-CSE-MsgGUID: cB7c+ZusRVG6Kj6oD+ql5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30501556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30501556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:11:06 -0800
X-CSE-ConnectionGUID: f4f9xBo2SIKla02B1pn/1g==
X-CSE-MsgGUID: Tj7ngavlSFWuFoN0JW/PuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84088830"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.182])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:11:04 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	deep_harsora@dell.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Add missing quirks from some new Dell
Date: Tue,  5 Nov 2024 19:10:56 +0800
Message-ID: <20241105111057.182076-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Deep Harsora <deep_harsora@dell.com>

Add missing quirks for some new Dell laptops using cs42l43's speaker
outputs.

Signed-off-by: Deep Harsora <deep_harsora@dell.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5614e706a0bb..b12f700e842f 100644
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
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF6")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
@@ -488,6 +496,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CFA")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -572,6 +588,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0D36")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
@@ -647,6 +671,30 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF3")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF4")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF5")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* Pantherlake devices*/
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

