Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AB41607BC
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838579; cv=none; b=T5XGhzlf5XtOLn1rEx31RCsQWaqzpMqUCRcP2VUjBmJ0EpJajKLnaJTgWoFRJ38chnA925b7Vmw/F0wlFIs065adbnCkdxtkg/2ra+GninjInNGE9xVfe23ic/BxmWszKRSJdOTDi1eFnHfNY2uUKHnrS4sUuWCqTVHekau53Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838579; c=relaxed/simple;
	bh=u5E8H9x87T0wWV9iRYcC5/WwcEuQhbmtbeRk9A9m61Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tganhiHW7K2NWrkXxwfAJbvqNuyptTmVUIDaxrVctlnHTNmlQNXbZVSvpe5ExqChsukTsYtFeCSEHPgl66BtOhIQRT2SQJKN2lD2+siNKzYJ5vAPDZT4wSmwBUd+G7MHO0ZkEmXnCQngGUCab4TBmcAa/CDgrDwx+w32Jq+4WyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SI7/W6W+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SI7/W6W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838578; x=1748374578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5E8H9x87T0wWV9iRYcC5/WwcEuQhbmtbeRk9A9m61Y=;
  b=SI7/W6W+sX77MhsUWDG4DDHRi7nrHGl1zqns3s/18Tp3X1Hp1Lh0WSMU
   f5o7n5o34pEupYMtZhtZuYznVQZqzt5biXSX6IvBwsOS4kMx60oxm5sH4
   cGdnuHxjoinrnk3xgdEWQhDWRK67zxnPwckrKYTYwCNiaRH8DaMBRhAAR
   TduGPuPPzOpUczCoTwzn8OeUyzUafBD4i1IYgmExSMPWgHrWshgS/eFxg
   9yuzHTbEJqgG65psQhQ8HYs9wcdTDyDb/0VFKBdLVUwtxOIn+Iy8S4+h5
   ZR1fSjNJGVphzPOn32GMgWGiz3SEeB/RsCGWCfTfs6wv2KtNCmNvkli/N
   Q==;
X-CSE-ConnectionGUID: I0vdXI0LRGepoSgFlkM49w==
X-CSE-MsgGUID: 62PTmQwcQYeEDA/BO+j6gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339363"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:17 -0700
X-CSE-ConnectionGUID: HjPXEEPVTnmgePRh+bz9Iw==
X-CSE-MsgGUID: KaU0VvT1RNysi/IWtuqKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029773"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/18] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
Date: Mon, 27 May 2024 14:35:45 -0500
Message-ID: <20240527193552.165567-12-pierre-louis.bossart@linux.intel.com>
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

Add quirks for some new Dell laptops using cs42l43's speaker outputs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 88 ++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b646b32dd311..5015d3ed6a9c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -461,6 +461,30 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF6")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF9")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CFA")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -495,6 +519,46 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE8")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF3")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF4")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF5")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF7")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
 
 	/* LunarLake devices */
 	{
@@ -521,6 +585,30 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SIDECAR_AMPS),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDC")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDD")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF8")
+		},
+		.driver_data = (void *)(SOF_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0

