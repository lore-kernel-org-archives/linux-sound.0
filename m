Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8FB1598FA
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145152; cv=none; b=TzZ50BjZ0+64NXrTdj6OVVAqDJm7ECpl1hijTRNkgdEmyKvBd9pliTIu9n3wGWEwCCdk0cZWfqxrR1kdZFbq0d97TfossjgtzNtUEu5zSTYcOBNLVc4//r9+n+UhovoV8Ea+4TbzPoWSeTu+Y2WVohubfGE04y1RzxIFVyObpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145152; c=relaxed/simple;
	bh=J2eM61MUNL0PVZO5q4cOIHXd03/HUMuzQ7EwErj0wjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEkY2gZPGVoLLRdi8hY0A6Q2ORyWG8bo7xtIpRA+v8gDXWvKh5/VIClmexrSC8UMciRXDgtzbtTbXX/eRdCU509u+7G4PLjAHFPNHX9Gclg4FGQepMwd0hcr/NwHs7an+qw7Ehdu8L1ubGGvjH4RIIx4lr9MZtgLawThfiZS8E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5C8XVbp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5C8XVbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145151; x=1745681151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J2eM61MUNL0PVZO5q4cOIHXd03/HUMuzQ7EwErj0wjI=;
  b=O5C8XVbpIfjaQMC/jHQLThzp4H6Pm9l30JjcGU36Nsyd/lHh8ZtdTNNz
   igT+twqqo7TWpj9WsuqH9qLFLxMZp9brYKJrh5O+ANo5EQNxZh8NuVO3W
   3wpo7Jb/K1qtceOwD51zYWECdDFlMx3p5pGynXgQva+vW7a6GO0D+9MY7
   yE46uHq25DOqSMq91aj7an3cxup6WGvg9VXa+c/eEDdK3vzvGQEe+azXw
   th88TlQ3XEKvCPTimyVpO1ObuvGwmqogLcUHjdQIqVa+ZuVoHsBih+MLT
   sswBlJKNv5XauuR3UfEFWsHqmaRgRcKl1FQxwQSNEIFJYrUGWxd7HXYsk
   A==;
X-CSE-ConnectionGUID: K7TEkrG8TOOLnxyf7V0iHg==
X-CSE-MsgGUID: QnW/pn5LQnS5v0aWEpvCGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291355"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291355"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:51 -0700
X-CSE-ConnectionGUID: GjxfGHSnTEOVDidpf+gEww==
X-CSE-MsgGUID: 8EyijvjOR6OH3IpHdzhiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259605"
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
Subject: [PATCH 19/23] ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl boards
Date: Fri, 26 Apr 2024 10:25:25 -0500
Message-Id: <20240426152529.38345-20-pierre-louis.bossart@linux.intel.com>
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

Add the board config icl_rt5682_def to rt5682 machine driver for all
icl boards using default SSP port allocation (headphone codec on SSP0).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 14 +++++---------
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  2 +-
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4c6dfe632edf..7a35db5cab35 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -76,15 +76,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0)),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -808,6 +799,11 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(1)),
 	},
+	{
+		.name = "icl_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0)),
+	},
 	{
 		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index d0062f2cd256..39875d67dcd1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -29,7 +29,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "icl_rt5682_def",
 		.sof_tplg_filename = "sof-icl-rt5682.tplg",
 	},
 	{
-- 
2.40.1

